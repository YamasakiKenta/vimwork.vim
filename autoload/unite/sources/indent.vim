" =============================================================================
" FILE: indent.vim
" Creation Date: 2014/08/29 13:29:07
" Last Modified: 2014/08/29 14:02:04
" =============================================================================
"
let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#indent#define()
	return s:source
endfunction

let s:source = {
			\ 'name' : 'indent',
			\ 'default_kind' : 'jump_list',
			\ }
function! s:getFunc(lnum, indent, funcs)
	let _lnum = a:lnum
	let _indent = a:indent
	let _funcs = a:funcs
	if _indent > indent(_lnum) && len(getline(_lnum))>0
		let _indent = indent(_lnum)
		let tmp = {
					\ 'str': getline(_lnum),
					\ 'line': _lnum,
					\ }
		call add(a:funcs, tmp)
	endif
	return _indent
endfunction
function! s:source.gather_candidates(args, context)
	let _fname = expand('%')
	let _bufnr = bufnr('%')
	let _lines = readfile(_fname)
	let _funcs = []

	" 前
	let _lnum = line('.')-1
	let _indent = 99999999
	while(_lnum>0)
		let _indent = s:getFunc(_lnum, _indent, _funcs)
		if _indent == 0 
			break
		endif 
		let _lnum = _lnum - 1
	endwhile

	call reverse(_funcs)
	let _lnum = line('.')
	let tmp = {
				\ 'str': getline(_lnum),
				\ 'line': _lnum
				\ }
	call add(_funcs, tmp)

	" 後
	let _lnum = line('.')+1
	let _indent = 99999999
	let _max = line('$')
	while(_lnum<=_max)
		let _indent = s:getFunc(_lnum, _indent, _funcs)
		if _indent == 0 
			break
		endif 
		let _lnum = _lnum + 1
	endwhile

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
