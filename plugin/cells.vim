let s:save_cpo = &cpo
set cpo&vim

"
"todo : 最初の |より前はそのまま

com! -range Cells call s:cells(<line1>,<line2>)

"幅を合わせる
function! g:set_lens(strs1, strs2) "{{{

	" 配列サイズの更新 - maxsの後ろの追加する

	let cnt = 0
	if len(a:strs1) > len(a:strs2) 
		let max = len(a:strs1) - len(a:strs2) 

		while ( cnt < max ) 
			call add(a:strs2,0)
			let cnt += 1
		endwhile
	else
		let max = len(a:strs2) - len(a:strs1) 

		while ( cnt < max ) 
			call add(a:strs1,0)
			let cnt += 1
		endwhile
	endif
	
endfunction
"}}}
"文字幅の取得
function! s:get_maxs_from_str(str, maxs) "{{{
	" ********************************************************************************
	" 最大幅の取得 ( 文字列 ) 
	" @param[in]	str		設定更新する文字列
	" @param[in]	maxs	文字列の最大幅
	" ********************************************************************************

	let str = a:str
	let maxs = a:maxs

	" 更新する文字列の文字幅の取得
	let tmp_maxs = map(split(str,"\[|+]"), "len(v:val)")

	" 配列サイズの更新 - maxsの後ろの追加する
	"let max = len(tmp_maxs) - len(maxs) 
	"if max > 0
		"let cnt = 0
		"while ( cnt < max ) 
			"call add(maxs,0)
			"let cnt += 1
		"endwhile
	"else
		"let max = len(maxs) - len(tmp_maxs) 
		"let cnt = 0
		"while ( cnt < max ) 
			"call add(tmp_maxs,0)
			"let cnt += 1
		"endwhile
	"endif

	" 配列幅を合わせ
	call g:set_lens(tmp_maxs, maxs) 

	" 文字幅の取得
	let cnt = 0
	for max in maxs
		let tmp_max = tmp_maxs[cnt]

		if tmp_max > max
			let maxs[cnt] = tmp_max
		endif

		let cnt += 1
	endfor

	" 文字列の最大幅
	return maxs

endfunction
"}}}
function! s:get_maxs_from_strs(strs) "{{{
	" ********************************************************************************
	" 最大幅の取得 ( 文字列 ) 
	" @param[in]	strs	設定する文字列
	" @param[out]	maxs	文字列の最大幅
	" ********************************************************************************
	let strs = a:strs

	" 文字列の最大幅 ( リセット ) 
	"
	let maxs = []
	for str in strs
		let maxs = s:get_maxs_from_str(str,maxs)
	endfor

	return maxs

endfunction
"}}}

"幅に合わせて、文字列の更新
function! s:is_line(str) "{{{
" ********************************************************************************
" 行の線か調べる
" @param[in]	str		調べる文字列
" ********************************************************************************
	let str = a:str

	" 表開始までを削除する
	let str = substitute(str, " ?.\{-}\[|+]", "", "g")
	
	"if str =~ "\[^|+-]"
	"
	" - が含んでいるなら線にする
	if str =~ "[-]"
		let rtn = 1 
	else
		let rtn = 0 
	endif

	return rtn

endfunction
"}}}
function! s:get_line(str, maxs) "{{{
	" ********************************************************************************
	" 線の行なら、線を表示する
	" @param[in]	str		線の行か調べる行
	" @param[in]	maxs	各幅の設定値
	" ********************************************************************************
	"
	let str = a:str
	let str1 = substitute(str, "\[+|].*","","")

	if s:is_line(str)

		" 一番最初は、表示しない
		let strs = []

		for max in a:maxs
			call add(strs,repeat('-', max))
		endfor

		let strs[0] = str1. repeat(' ',a:maxs[0]-len(str1))

		let str = join(strs,'+').'+'
	endif

	return str

endfunction
"}}}

function! g:add_list(name1, list1, name2, list2) "{{{

	" 配列幅を合わせる
	call g:set_lens(list1, list2) 

	let cnt   = 0
	let dicts = []
	while cnt < max
		let dicts  = add({name1 : list1[cnt], name2 : list2[cnt]})
		let cnt   += 1
	endwhile
	
	return dicts
endfunction
"}}}
function! s:get_str(str, maxs) "{{{
	let maxs      = a:maxs
	let while_max = len(maxs)
	let strs      = split(a:str, "|")

	" 配列数を合わせる
	call g:set_lens(strs, maxs) 

	let cnt = 0
	while ( cnt < while_max ) 
		let max = maxs[cnt]      " 各列幅
		let len = len(strs[cnt]) " 文字列幅
		let sa  = max - len

		" 最大文字数に足りない分は、SPACEを挿入
		let strs[cnt] .= repeat(' ',sa)

		let cnt += 1
	endwhile

	" 結合
	let rtn = join(strs,'|').'|'

	return rtn

endfunction
"}}}
function! s:get_strs(strs, maxs) "{{{

	let outs = []
	for str in a:strs
		if s:is_line(str)
			call add(outs, s:get_line(str, a:maxs))
		else
			call add(outs, s:get_str(str, a:maxs))
		endif
	endfor

	return outs 

endfunction
"}}}

function! s:cells(line1,line2) "{{{
	let line1 = a:line1
	let line2 = a:line2

	" 編集データの取得
	let strs = getline(line1,line2)

	" | の場所の取得 ( 各列の幅の設定 ) 
	let maxs =  s:get_maxs_from_strs(strs)

	" 幅の設定
	let strs = s:get_strs(strs, maxs)

	call setline(line1, strs)	

endfunction
"}}}

"     +----+---------+--------------+
"     |134 |2        |13456789      |
"     +----+---------+--------------+
"     |1234|12       |123456789     |
"     +----+---------+--------------+
"     |    |0        |              |
"a    +----+---------+--------------+
"     +----+---------+--------------+
"
"
"
"
"
"
let &cpo = s:save_cpo
unlet s:save_cpo

