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

let $GITPATH = 'C:/Users/yamasaki.mac/Dropbox/vim/mind/vimwork/'
"source - gi_ls_files "{{{
let s:source = {
			\ 'name' : 'git_ls_files',
			\ }
"\ 'default_action' : '',
call unite#define_source(s:source)
function! s:source.gather_candidates(args, context) "{{{
	let datas = git#cmds('ls-files')

	let candidates = map( datas, "{
				\ 'word' : v:val,
				\ 'kind' : 'file',
				\ 'action__path' : $GITPATH.v:val,
				\ }")
	return candidates
endfunction "}}}
unlet s:source "}}}

nnoremap ;gh<CR> :<C-u>Unite git_ls_files<CR>
