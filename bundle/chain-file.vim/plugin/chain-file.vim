let s:save_cpo = &cpo
set cpo&vim


"let s:Common = vital#of('chain-file.vim').import('Mind.Common')
let s:Common = vital#of('vital').import('Mind.Common')

" setting "{{{
let g:chain_files     = get(g:, 'chain_files', {})
let g:chain_extension = get(g:, 'chain_extension', { 'c' : 'h', 'h' : 'c'})

let g:chain_files = {
			\ 'a.c' : 'include/ab.h',
			\ 'b.c' : 'include/ab.h',
			\ 'ab.h' : ['../a.c', '../b.c'],
			\ }

let s:chain_files_1 = {
			\ 'ab.h' : '../bc2/a.c',
			\ 'bc2/a.c' : '../include/ab.h',
			\ }

let g:dict1 = { 
			\ '__file'     : g:chain_files,
			\ '__extension' : g:chain_extension,
			\ }

let g:dict2 = { 
			\ '__file'     : s:chain_files_1,
			\ '__extension' : g:chain_extension,
			\ }
"}}}

function! s:get_chain_filename(dicts)  "{{{
	let extension    = expand("%:e")
	let rtn_str      = expand("%")
	let fname_full   = substitute(expand("%"), '\\', '\/', 'g')

	" 辞書データの設定
	let tmp_d = { '__file' : {} , '__extension' : {} }
	for dict_d in a:dicts
		if type(dict_d) == type({})
			let tmp_d.__file      = s:Common.set_dict_extend(tmp_d.__file,      get(dict_d, '__file',      {}))
			let tmp_d.__extension = s:Common.set_dict_extend(tmp_d.__extension, get(dict_d, '__extension', {}))
		endif
	endfor

	let file_d       = tmp_d.__file
	let extension_d  = tmp_d.__extension

	" KEYを取得する 
	let fname_tmp = s:Common.get_fname_key(file_d, fname_full)

	if exists('file_d[fname_tmp]') 
		" 対応するファイル
		let tmps = s:Common.get_list(file_d[fname_tmp])
		let rtn_str    = expand("%:h").'/'.tmps[0]

		" 並び替え - 最後に開いたファイルを優先させる
		let fname_next = substitute(expand(rtn_str), '\\', '\/', 'g')
		let fname_tmp  = s:Common.get_fname_key(file_d, fname_next)
		if exists('file_d[fname_tmp]') 
			let tmps = s:Common.get_list(file_d[fname_tmp])
			for num_ in range(len(tmps))
				let tmp = tmps[num_]
				" 移動させる
				if  fname_full =~ substitute(tmp, '\.\.\/', '', '')
					unlet tmps[num_]
					call insert(tmps, tmp)
				endif
			endfor
		endif

	elseif exists('extension_d[extension]')
		"対応する拡張子
		let rtn_str = expand("%:r").".". extension_d[extension]
	else
	endif

	return rtn_str
endfunction
"}}}

command! -nargs=* ChainFile call s:chain_file(<f-args>)
function! s:chain_file(...) "{{{
	if len(a:1) > 0
		let dicts = []
		for dict in a:000
			if dict =~ '.'
				exe 'call add(dicts, '.dict.')'
			endif
		endfor
	else
		let dicts = [{
					\ '__file'      :  get(g:, 'chain_files', {}),
					\ '__extension' :  get(g:, 'chain_extension', { 'c' : 'h', 'h' : 'c'}),
					\ }]
	endif

	exe 'edit' s:get_chain_filename(dicts)
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

