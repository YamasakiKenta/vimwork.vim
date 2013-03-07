let s:save_cpo = &cpo
set cpo&vim

" todo : enum
" todo : struct

function! s:get_struct_member(str) "{{{
	" { 'type' : 'int' , 'name' : 'count' }
endfunction
"}}}
function! s:get_enum(str) "{{{
	"{ 'name' : 'ret' , 'num' : 1 }
endfunction
"}}}
function! s:del_str(data_d) "{{{
	" {{{
	" ********************************************************************************
	" @par      コメントを削除します
	" 
	" @param[in] data_d.line        コメントを削除したい文
	" @param[in] data_d.comment_flgs[]  data_d.comments の配列番号
	"
	" @param[in] data_d.comments[]   この文字以降をコメントとみなす 
	" 例: ['\/\/']
	"
	" @param[in] data_d.kakko_ds[]     この文字で区切られた箇所をコメントとみなす 
	" start    : コメント開始
	" else     : 分岐
	" end      : コメント終了
	" else_flg : 削除するコメントの指定
	" _mode    = 'double' - 二重定義可能
	"          = 'only_on'  - コメント中
	"          = 'only_off' - コメントではない
	"
	" 例: [{'start' : '\/\*' , 'end' : '\*\/', only_flg = '1'}, 
	"      {'start' : '#if\s:1', 'else' : '#else' , 'end' : '#endif',
	"      'else_flg' : 1, only_flg : 0]
	"
	"     ※備考
	"     #if 1
	"         /* else_flg==0 の場合、削除する */
	"     #else
	"         /* else_flg==1 の場合、削除する */
	"     #ndif
	"
	" @retrun data_d.line        コメントを削除した文
	" @return data_d.comment_flg true:現在コメント中
	"
	" ********************************************************************************
	" }}}

	let _line        = a:data_d._line
	let _kakko_ds    = a:data_d._kakko_ds
	let _comment_flg = get(a:data_d, '_comment_flg', [])
	let while_flg    = 1
	let new_line     = { 'str' : _line, '_num': 999 }

	" 一行にカッコが複数ある場合に対応
	
	" モードの設定
	for _num in range(len(_kakko_ds))
		let _kakko_ds[_num]._mode = get(_kakko_ds[_num] , '_mode' , 'only_off')
	endfor

	" 一回目の実行時のみ更新する
	let _mode_new = map(copy(_kakko_ds), 'v:val._mode')

	while while_flg == 1 "{{{
		let while_flg = 0
		for _num in range(len(_kakko_ds))
			let _start     = _kakko_ds[_num]['_start']
			let _end       = _kakko_ds[_num]['_end']
			let _else      = get(_kakko_ds[_num] , '_else'     , '')
			let _else_flg  = get(_kakko_ds[_num] , '_else_flg' , 0)
			let _mode      = get(_kakko_ds[_num] , '_mode'     , 'only_off')

			if _mode == 'double'
			elseif _mode == 'only_on' || _mode =='only_off'

				" コメント中 ( 終了は、一回の為 ) 
				if _mode == 'only_on'
					if new_line.str =~ _end
						let _mode_new[_num] = 'only_off'

						let new_line.str = substitute(_line, '.\{-}'._end, '', '')
						let new_line._num = 0
					else 
						let new_line.str = ''
						let new_line._num = 0
					endif
				endif
				"
				" コメント中でない場合
				while new_line.str =~ _start
					if _line =~ _start.'.\{-}'._end
						let _mode_new[_num] = 'only_off'

						let matchnum = match(_line, _start)
						if new_line._num > matchnum
							let new_line._num = matchnum
							let new_line.str = substitute(_line, _start.'.\{-}'._end , '', '')
						endif
					else
						let _mode_new[_num] = 'only_on'
						let matchnum = match(_line, _start)
						if new_line._num > matchnum
							let new_line._num = matchnum
							let new_line.str = substitute(_line, _start.'.*', '', '')
						endif
					endif
					let while_flg = 1
				endwhile
			endif

		endfor
		let _line = new_line.str
	endwhile

	"}}}
	"
	for _num in range(len(_kakko_ds))
		let _kakko_ds[_num]._mode = _mode_new[_num]
	endfor

	let a:data_d._line         = _line        
	let a:data_d._comment_flg  = _comment_flg 
	let a:data_d._kakko_ds     = _kakko_ds

	return a:data_d
endfunction
"}}}
"
let &cpo = s:save_cpo
unlet s:save_cpo

