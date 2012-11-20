function! s:get_message() "{{{
	redir => mes_
	silent! mes
	redir END

	return split(mes_ , "\n")
endfunction "}}}

"source - message
let s:source = {
			\ 'name'           : 'message',
			\ 'description'    : '',
			\ 'default_action' : '',
			\ }
call unite#define_source(s:source)
function! s:source.gather_candidates(args, context)
	let datas = s:get_message()
	let candidates = map( datas, "{
				\ 'word' : v:val,
				\ 'kind' : 'common',
				\ }")
	return candidates
endfunction
unlet s:source
