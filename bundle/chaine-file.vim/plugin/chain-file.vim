let s:save_cpo = &cpo | set cpo&vim

let g:chain_files     = get(g:, 'chain_files', {})
let g:chain_extension = get(g:, 'chain_extension', {
			\ 'c' : 'h',
			\ 'h' : 'c',
			\ })

command! -nargs=1 ChainFile call s:chain_file(<q-args>)
function! s:chain_file(str) "{{{
	let filename_ = s:get_chain_filename(a:str)
	exe 'edit' filename_
endfunction
"}}}
function! s:get_chain_filename(str)  "{{{
	let extension = expand("%:e")
	let filename_ = expand("%:t")
	let cd_       = expand("%:h")

	let rtn_str = filename_

	if exists('g:chan_files[filename_]')
		let rtn_str = g:chain_files[filename_]
	elseif exists('g:chain_extension[extension]')
		let rtn_str = fnamemodify(filename_, ":r"). g:chain_extension[extension]
	endif

	return cd_.'/'.rtn_str

endfunction
"}}}

let &cpo = s:save_cpo | unlet s:save_cpo
