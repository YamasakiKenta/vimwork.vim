let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#args#define()
	return s:source
endfunction

let s:source = {
			\ 'name' : 'args',
			\ 'default_kind' : 'args',
			\ }
function! s:source.gather_candidates(args, context)
	" get args
	redir => output
	silent! execute 'args'
	redir END
	let result = split(output, '[^\\]\zs ')

	return map(result, "{
				\ 'word' : v:val,
				\ 'action__path' : v:val,
				\ }")
endfunction

call unite#define_source(s:source)

let &cpo = s:save_cpo
unlet s:save_cpo

