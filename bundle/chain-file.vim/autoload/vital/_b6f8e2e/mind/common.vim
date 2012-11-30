let s:save_cpo = &cpo
set cpo&vim

function! s:get_dict(tmp)
	return (type(a:tmp) == type([])) ? a:tmp : [a:tmp]
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
