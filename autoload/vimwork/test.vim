let s:save_cpo = &cpo
set cpo&vim

function! s:func_test(func, in, out) 
	let out = call(a:func, a:in)
	let rtn = ( a:out == out ) 
	if rtn
		echo "OK    :"
		PP out
	else
		echo "ERROR :"
		echo 'rtn :'
		PP out
		echo 'ans :'
		PP a:out
	endif
	return rtn
endfunction

function! s:func_tests(func, datas) 
	for data in a:datas
		call s:func_test(a:func, data.in, data.out)
	endfor
endfunction

function! vimwork#test#main(...)
	return call('s:func_tests', a:000)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
