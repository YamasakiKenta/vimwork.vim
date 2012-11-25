let s:save_cpo = &cpo | set cpo&vim

let g:chain_files     = get(g:, 'hcaine_files', {})
let g:chain_extension = get(g:, 'chain_extension', {
			\ 'c' : 'h',
			\ 'h' : 'c',
			\ })

command! -nargs=1 chainFile call s:chain_file(<q-args>)
function! s:chain_file(str) "{{{
	let filename = s:get_chain_filename(a:str)
	exe 'edit' filename
endfunction
"}}}
function! s:get_chain_filename(str)  "{{{
	let rtn_str = a:str
	let extension = fnamemodify(a:str, ":e")

	if exists('g:chain_files[a:str]')
		let rtn_str = g:chain_files[a:str]
	elseif exists('g:chain_extension[extension]')
		let rtn_str = fnamemodify(a:str, ":r").'.'.
					\ g:chain_extension[extension]
	endif

	return rtn_str

endfunction
"}}}

let &cpo = s:save_cpo | unlet s:save_cpo
