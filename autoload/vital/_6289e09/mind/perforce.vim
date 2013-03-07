let s:save_cpo = &cpo
set cpo+=vim

function! s:get_client_root "{{{
	let lines = split(system('p4 info'), "\n")

	let word = '^Client root:'
	for line in lines 
		if line =~ word
			let root = matchstr(line, 'word.\zs.*')
			break
		endif
	endfor

	return root
endif
endfunction
"}}}
"
set &cpo = s:save_cpo
unlet s:save_cpo
