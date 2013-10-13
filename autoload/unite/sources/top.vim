let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#top#define()
	return s:source
endfunction

function! s:get_top(path)
	let path = substitute(a:path, "\\", "\/", "g")
	let rtns = [path]
	while(path =~ '/')
		let path = matchstr(path, '.*\ze\/')
		call add(rtns, path)
	endwhile
	return rtns
endfunction

let s:source = {
			\ 'name' : 'top',
			\ 'default_kind' : 'directory',
			\ 'default_action' : 'lcd',
			\ }

function! s:source.gather_candidates(args, context)
	let paths = []

	for tmp in [expand("%:p"), getcwd()]
		call extend(paths, s:get_top(tmp))
	endfor

	return map(paths, "{
				\ 'word' : v:val,
				\ 'action__directory' : v:val,
				\ }")
endfunction

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
