command! GetFunclnk call <SID>getFunclnk()

function! s:get_fnc_from_line(line) "{{{
	return a:line
endfunction "}}}
function! s:getFunclnk() "{{{
let file = expand("%")
let lines = readfile(file);

arg = {
			\ 'lines' : lines,
			\ 'start' : 'function',
			\ 'end'   : 'endfunction',
			\ 'fnc'   : function('<SID>get_fnc')
			\ }
for line in line

endfor

endfunction "}}}

function! s:get_str_from_loop(arg) "{{{
	let lines = a:arg.lines
	let start = a:arg.start
	let end   = a:arg.end
	let Fnc   = a:arg.fnc
	let rtns = []
	for line in lines
		" 検索開始
		if serach_flg == 0 && line =~ start
			let search_flg = 1
		endif
		" 検索終了
		if serach_flg == 1 && line =~ end
			let serach_flg = 0
		endif
		" 開始
		if serach_flg == 1 
			call add(rtns, Fnc(line))
		endif
	endfor
endfunction
