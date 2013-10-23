let s:save_cpo = &cpo
set cpo&vim

function! neocomplete#sources#mind#define()
	return s:source
endfunction
let s:source = {
			\ 'name' : 'mind',
			\ 'kind' : 'manual',
			\ 'mark' : '[MY]',
			\ }

function! s:source.gather_candidates(context)
	return keys(a:context)
endfunction

call neocomplete#define_source(s:source)

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
