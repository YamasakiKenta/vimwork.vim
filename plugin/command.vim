" [ ] selectEditで保存できるようにする
"
" ********************************************************************************
" 前後の入れ替え
" ********************************************************************************
command! -range -nargs=? MySwap <line1>,<line2>call <SID>mySwap(<q-args>)
function! s:mySwap(qarg) "{{{
	let lineNum = line(".")
	let line = getline(".") " # 文字の取得

	"選択しているの編集
	if strlen(a:qarg) > 0
		"指定した文字で入替え
		let hit  = match(line, a:qarg)         " # 中心開始位置
		let hit2 = hit + strlen(a:qarg)        " # 中心終了位置
		let str  = line[0: hit]                " # 左側
		let str2 = strpart(line, hit2)         " # 右側
		call setline(lineNum, str2.a:qarg.str)
		"todo 正規表現で移動
	else 
		" # todo : 適当に入替え
		" # 文字の操作
	endif
endfunction "}}}

" ********************************************************************************
" 修正中のsyntax ファイルを修正する
" ********************************************************************************
command! MySyntaxFile call <SID>mySyntaxFile()
function! s:mySyntaxFile() "{{{
	exe 'e '.$IVIMWORK.'/syntax/'.&filetype.'.vim'
	call okazu#MyQuit()
endfunction "}}}

" ********************************************************************************
" 選択した部分を、コピーして別画面で開く
" ********************************************************************************
command! -range=% SelectEdit :call s:selectEdit(<line1>, <line2>)
function! s:selectEdit(start, end) "{{{

	" 行の保存
	let g:selectEdit_start = a:start
	let g:selectEdit_end   = a:end

	" 現在のファイルタイプを保存する
	let ft = &filetype

	" bufnrの保存
	let g:selectEdit_bufnr = bufnr("")

	if 0
		tabe! ~/vim/tmp/selectEdit
		% delete _
		0put t 
	else
		let strs = getline(g:selectEdit_start,g:selectEdit_end)
		call okazu#event_save_file('selectEdit',strs,"MySelectEdit_write()")
		$ delete _

		if 0 
			let tmpfile = 'selectEdit'

			"画面設定
			exe 'vnew' tmpfile
			setlocal noswapfile bufhidden=hide buftype=acwrite

			"文の書き込み
			%delete _
			call append(0,strs)

			"なぜか空白行なので削除
			$ delete

			" リセットする
			aug selectEdit
				autocmd!
				autocmd BufWriteCmd <buffer> nested call MySelectEdit_write()
			aug END
		endif

	endif

	exe 'set ft='.ft

endfunction "}}}
function! MySelectEdit_write() "{{{
	" ********************************************************************************
	" 選択した範囲に書き込み
	"
	" ********************************************************************************
	let start    = g:selectEdit_start
	let end      = g:selectEdit_end
	let bufnr    = g:selectEdit_bufnr

	" tmpfileの保存
	let nowbufnr = bufnr('%')
	let strs     = getline(0,'$')

	" 行の変更
	let g:selectEdit_end = start + line('$') - 1

	" 編集するファイル の編集
	exe bufnr 'buffer'

	" 削除
	exe start.','.end 'delete'

	" 追加
	" todo : 空白行なら追加しない
	call append(start-1,strs)

	" tmpfileに戻す
	exe nowbufnr 'buffer'

endfunction "}}}

" ********************************************************************************
" Grep を行う
" ********************************************************************************
command! -narg=+ MyGrep call <SID>grep(<f-args>)
function! <SID>grep(...) "{{{
	let word = join(a:000,'\|')
	exe 'vim /'.word.'/ **/*.'.g:myGrepFileType
endfunction "}}}
