let s:save_cpo = &cpo
set cpo&vim

let Common = vital#of('chain-file.vim').import('Mind.Common')

let g:chain_files     = get(g:, 'chain_files', {})
let g:chain_extension = get(g:, 'chain_extension', { 'c' : 'h', 'h' : 'c'})

let g:chain_files = {
			\ 'a.c' : 'include/ab.h',
			\ 'b.c' : 'include/ab.h',
			\ 'ab.h' : ['../a.c', '../b.c'],
			\ }

let s:chain_files_1 = {
			\ 'ab.h' : 'b2/a.c',
			\ 'bc2/a.c' : '../include/ab.h',
			\ }

let s:dict = { 
			\ '__file'     : g:chain_files,
			\ '__extension' : g:chain_extension,
			\ }

let s:dict = { 
			\ '__file'     : s:chain_files_1,
			\ '__extension' : g:chain_extension,
			\ }

function! s:get_key(file_d, fname_full) "{{{
	let file_d    = a:file_d
	let fname_tmp  = a:fname_full

	echo file_d
	while len(fname_tmp) && !exists('file_d[fname_tmp]')
		let fname_tmp  = matchstr(fname_tmp, '.\{-}\/\zs.*')
		echo fname_tmp
	endwhile
	return fname_tmp
endfunction
"}}}

function! s:get_chain_filename(...)  "{{{
	let extension    = expand("%:e")
	let fname        = expand("%:t")
	let fname_full   = substitute(expand("%"), '\\', '\/', 'g')
	let rtn_str      = expand("%")

	" �����f�[�^�̐ݒ�
	if a:0 > 0
		let tmp_d = { '__file' : {} , '__extension' : {} }
		for a_d in a:000
			if type(a_d) == type({})
				call extend(tmp_d.__file,      get(a_d, '__file',      {}))
				call extend(tmp_d.__extension, get(a_d, '__extension', {}))
			endif
		endfor

		let file_d       = tmp_d.__file
		let extension_d  = tmp_d.__extension
	else
		let file_d      = get(g:, 'chain_files', {})
		let extension_d = get(g:, 'chain_extension', { 'c' : 'h', 'h' : 'c'})
	endif

	" KEY���擾���� 
	let fname_tmp = s:get_key(file_d, fname_full)

	if exists('file_d[fname_tmp]') 
		" �Ή�����t�@�C�������݂��� 
		let tmps       = (type(file_d[fname_tmp]) == type([]) ? file_d[fname_tmp] : [file_d[fname_tmp]])
		let rtn_str    = expand("%:h").'/'.tmps
		let fname_next = expand(rtn_str)

		" ���ёւ� - �Ō�ɊJ�����t�@�C����D�悳����
		unlet tmps
		let tmps = file_d[fname_next]
		if type(tmps) == type([])
			for num_ in range(len(tmps))
				let tmp = tmps[num_]
				if  fname_full =~ substitute(tmp, '\.\.\/', '', '')
					unlet tmps[num_]
					call insert(tmps, tmp)
				endif
			endfor
		endif
	elseif exists('extension_d[extension]')
		"�Ή�����g���q�����݂��� 
		let rtn_str = expand("%:r").".". extension_d[extension]
	else
	endif

	return rtn_str
endfunction
"}}}

command! ChainFile call s:chain_file()
function! s:chain_file() "{{{
	exe 'edit' s:get_chain_filename(s:dict)
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

