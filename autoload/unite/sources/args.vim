"=============================================================================
" FILE: args.vim
" AUTHOR:  Yamasaki Kenta
" Last Modified: 2014/03/06 10:50:12
"============================================================================="

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

	let output = substitute(output, "\n", "", "")
	let result = split(output, '[^\\]\zs ')

	call map(result, 'matchstr(v:val, ''^[\?\zs.\{-}\ze\]\?$'')')
	return map(result, "{
				\ 'word' : v:val,
				\ 'action__path' : fnamemodify(v:val, 'p'),
				\ }")
endfunction

call unite#define_source(s:source)

let &cpo = s:save_cpo
unlet s:save_cpo

