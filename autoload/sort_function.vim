let s:save_cpo = &cpo
set cpo&vim

let g:sort_function_words_d = get(g:, 'sort_function_words_d', {
			\ '\<\(function\|func\)\>!\?\s*\w' : '\<end\(function\|func\)\>',
			\ '{' : '}',
			\ '[' : ']',
			\ })
function! s:sub_get_cnt_from_str(line, findstr) "{{{
	let tmp_str = a:findstr == '=' ? '@' : '='
	let tmps    = split(substitute(a:line, a:findstr, tmp_str.'&'.tmp_str, 'g'), a:findstr)
	return len(tmps) - 1
endfunction
"}}}
function! s:sub_check_start(line, data) "{{{
	let data = a:data
	let line = a:line
	let data.kind = 'none'
	let data.sum_start_cnt_old = data.sum_start_cnt

	" コメントは、考慮してないです
	for start_ in data.starts
		if a:line =~ start_
			let data.kind  = 'start'
			let cnt = s:sub_get_cnt_from_str(a:line, start_) " 保存番号
			let data.start_cnt_d[start_] = get(data.start_cnt_d, start_, 0) + cnt
		endif
	endfor

	" 終了処理
	let sum = 0
	for type in keys(data.start_cnt_d)
		let end_ = data.end_d[type]
		if a:line =~ end_
			if data.start_cnt_d[type] > 0
				let data.kind = 'end'
				let cnt = s:sub_get_cnt_from_str(a:line, end_)
				let data.start_cnt_d[type] -= cnt
			endif

		endif

		" 合計数の取得　
		let sum += data.start_cnt_d[type]

		" 不要なキーは削除
		if data.start_cnt_d[type] == 0
			unlet data.start_cnt_d[type]
		endif
	endfor

	let data.sum_start_cnt = sum

endfunction
"}}}

function! sort_function#sort_function(line1, line2) "{{{
	" 初期設定
	let data = {
				\ 'starts'            : keys(g:sort_function_words_d),
				\ 'end_d'             : g:sort_function_words_d,
				\ 'kind'              : 'none',
				\ 'start_cnt_d'       : {},
				\ 'old_len_types'     : 0,
				\ 'sum_start_cnt_old' : 0,
				\ 'sum_start_cnt'     : 0,
				\ }

	if a:line1 == a:line2
		let line1 = 0
		let line2 = line("$")
	else
		let line1 = a:line1
		let line2 = a:line2
	endif

	let lines = getline(line1, line2)

	let table_d = {}
	let fnc = ''
	let cnt = 0

	" テーブル作成
	for line in lines
		call  s:sub_check_start(line, data)

		if ( data.kind == 'start' && data.sum_start_cnt_old == 0 )
					\ || ( data.kind == 'none' && data.sum_start_cnt == 0 )
			if line != ''
				let fnc = line.'_'.cnt
				let table_d[fnc] = []
			endif
		endif

		if fnc != ''
			if data.sum_start_cnt > 0 || line != ''
				call add(table_d[fnc], line)
			endif
		endif

		let cnt = cnt + 1
	endfor

	" 並び替え変え用、文字列の作成
	let cnt = 0
	let sort_keys = {}
	for key in keys(table_d)
		let val = key
		let val = matchstr(val, '.*\ze_')

		let sort_keys[val.'_'.cnt] = key
					
		let cnt = cnt + 1
	endfor

	exe line1.','.line2.'delete'

	let lnum = line1 - 1
	for order in sort(keys(sort_keys))
		let order = sort_keys[order]
		for line in table_d[order]
			call append(lnum, line)
			let lnum = lnum + 1
		endfor
	endfor

endfunction
"}}}

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
