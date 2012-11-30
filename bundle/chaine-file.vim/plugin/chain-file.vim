let s:save_cpo = &cpo
set cpo&vim

let s:Debug = vital#of('vital').import('Mind.Debug')

let g:chain_files     = get(g:, 'chain_files', {})
let g:chain_extension = get(g:, 'chain_extension', { 'c' : 'h', 'h' : 'c'})

let g:chain_files = {
			\ 'a.c' : 'include/ab.h',
			\ 'b.c' : 'include/ab.h',
			\ 'ab.h' : ['../a.c', '../b.c'],
			\ }

command! ChainFile call s:chain_file()
function! s:chain_file() "{{{
	exe 'edit' s:get_chain_filename()
endfunction
"}}}
function! s:get_chain_filename()  "{{{
	let extension  = expand("%:e")
	let fname      = expand("%:t")
	let cd_        = expand("%:h")
	let fname_full = expand("%")

	let rtn_str = fname

	exe s:Debug.exe_line('')


	if exists('g:chain_files[fname]')
		let tmps = g:chain_files[fname]
		let rtn_str = type(tmps) == type([]) ? tmps[0] : tmps
		let fname_next = fnamemodify(rtn_str, ":t")

		" •À‚Ñ‘Ö‚¦
		unlet tmps
		let tmps = g:chain_files[fname_next]
		if type(tmps) == type([])
			for num_ in range(len(tmps))
				let tmp = tmps[num_]
				let tmp = substitute(tmp, '\.\.\/', '', '')
				if  fname_full =~ tmp
					unlet tmps[num_]
					call insert(tmps, tmp)
				endif
			endfor
		endif

	elseif exists('g:chain_extension[extension]')
		let rtn_str = fnamemodify(fname, ":r").".". g:chain_extension[extension]
	else
	endif

	return cd_.'/'.rtn_str
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

