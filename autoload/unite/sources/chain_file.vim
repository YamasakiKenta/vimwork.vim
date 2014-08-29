" =============================================================================
" FILE: chain-file.vim
" Creation Date: 2014/08/29 10:03:43
" Last Modified: 2014/08/29 10:54:21
" =============================================================================
"
let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#chain_file#define()
	return s:source
endfunction

let s:source = {
			\ 'name' : 'chain_file',
			\ 'default_kind' : 'file',
			\ }
function! s:source.gather_candidates(args, context)
	let _files = s:chain_file()
	let _files = map(_files, "substitute(v:val, '\\', '/', 'g')")

	let _cmn = get(_files, 0, '')
	for _f in _files
		while _f !~ _cmn && match(_cmn, '/')+1
			let _cmn = substitute(_cmn, '.*\zs/.*', '', '')
		endwhile
	endfor
	return map(_files, "{
				\ 'word' : v:val,
				\ 'abbr' : substitute(v:val, '^'._cmn, '', ''),
				\ 'action__path' : v:val,
				\ }")
endfunction

" ### メイン処理 ###
let s:files = {}
let s:cache_file = {}

" --- HTML ---
function! s:getFnamesHtml(lines)
		let line = join(a:lines,'')
		let rn = '\ze\(href\|src\)'
		let lines = split(line, rn)
		if len(lines)==0
			return []
		endif
		let lines = map(lines[1:], 'matchstr(v:val, '''.rn.'\s*=\s*[''''"]\zs.\{-}\ze[''''"]'')')
		return lines
endfunction

" --- JavaScript ---
function! s:getFnamesJavaScript(fname)
	let _dir = fnamemodify(a:fname, '%:h')
	return split(glob(_dir.'**/*.html'), "\n")
endfunction

" --- vim ---
function! s:getFnamesVim(fname)
	let _dir = fnamemodify(a:fname, '%:h')
	let _dir = substitute(_dir, '\\', '\/', 'g')
	let _dir = substitute(_dir, '/autoload/.*', '', '')
	let _dir = substitute(_dir, '/plugin/.*', '', '')
	return split(glob(_dir.'**/*.vim'), "\n")
endfunction

function! s:chain_file()
	let _files = []
	let fname = expand("%:p")
	let s:cache_file[fname] = get(s:cache_file, fname, {})
	if &ft == 'html'
		let _files = s:getFnamesHtml(readfile(fname))
	elseif &ft == 'javascript'
		let _files = s:getFnamesJavaScript(fnamemodify(fname, ":h"))
	elseif &ft == 'vim'
		let _files = s:getFnamesVim(fnamemodify(fname, ":h"))
	endif
	return _files
endfunction

call unite#define_source(s:source)

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
