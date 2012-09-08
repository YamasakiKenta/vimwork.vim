"source - git_status "{{{
let s:source = {
			\ 'name' : 'git_status',
			\ 'description' : '',
			\ }
"\ 'default_action' : '',
call unite#define_source(s:source)
function! s:source.gather_candidates(args, context) "{{{
	let datas = 
	let candidates = map( datas, "{
				\ 'word' : v:val,
				\ 'kind' : 'file',
				\ }")
	return candidates
endfunction "}}}
unlet s:source "}}}
