" =============================================================================
" FILE: js_outline.vim
" Creation Date: 2014/08/29 11:10:20
" Last Modified: 2014/08/29 13:27:23
" =============================================================================
"
let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#js_outline#define()
	return s:source
endfunction

let s:source = {
			\ 'name' : 'js_outline',
			\ 'default_kind' : 'jump_list',
			\ }
function! s:source.gather_candidates(args, context)
	let _fname = expand('%')
	let _bufnr = bufnr('%')
	let _lines = readfile(_fname)
	let _funcs = []
	let _i = 1
	let _w = '[_a-zA-Z0-1\.]'
	for _line in _lines
		if _line =~ 'func' || _line =~ 'prototype'
			let _func = ''
			let _func = _func . matchstr(_line, 'function\s\+\zs'._w.'\+\ze\s*(') 
			let _func = _func . ' .'. matchstr(_line, _w.'\+\ze\s*=\s*function') 
			let _func = _func . ' .'. matchstr(_line, _w.'\+\ze\.\<prototype\>')
			let _func = _func . ' .'. matchstr(_line, _w.'\+\ze\s*:\s*function')
			let cnt = 3
			if len(_func) > cnt*2
				let tmp = {
							\ 'str': _func,
							\ 'line': _i,
							\ }
				call add(_funcs, tmp)
			endif 
		endif 
		let _i = _i + 1
	endfor
	return map(_funcs, "{
				\ 'word' : v:val.line . ': '. v:val.str,
				\ 'action__line' : v:val.line,
				\ 'action__buffer_nr' : _bufnr,
				\ }")
endfunction

call unite#define_source(s:source)

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
