let s:save_cpo = &cpo
set cpo&vim

function! vimwork#test#main(func,datas) "{{{
	for data in a:datas
		let ans = data.out
		let out = call(a:func, data.in)
		if exists('data.key')
			let out = get(out, data.key, '')
		endif
		if type(data.out) == type(out) && ( data.out == out ) 
			echo "OK     :" . string(out)
		else
			echo "ERROR  :"
			echo '= ans =:'.string(data.out)
			echo '= rtn =:'.string(out)
		endif
	endfor
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
