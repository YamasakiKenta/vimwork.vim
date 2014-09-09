"=============================================================================
" FILE: multiline.vim
" AUTHOR:  Yamasaki Kenta
" Creation Date: 2014/04/27 23:52:39
" Last Modified: 2014/09/09 11:27:25
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim

aug vimwork_vimrc
	au!
	au BufRead,BufNewFile *.pc set filetype=c
	au BufWrite * call vimwork#command#update_time(['call cursor(6,0)'])
	au BufEnter * syn sync fromstart
aug END

set backupdir=~/.vim/bak
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir))
endif

" dir 
let s:dir = substitute(substitute(expand("<sfile>"), '\\', '\/', 'g'), '/plugin/.*$', '', '')
let g:neosnippet#snippets_directory = s:dir.'/snippets'
let g:vimwork#syntax_directory = s:dir
let g:load_doxygen_syntax = 1
let g:did_install_default_menus = 1
exe 'set dict+='.s:dir.'/dict/*'

if has('persistent_undo')
	set undodir=~/.vim/undo
	if !isdirectory(expand(&undodir))
		call mkdir(expand(&undodir))
	endif
endif 

if has('win32') && !has('gui')
	set enc=sjis
	set fenc=utf-8
else
	set enc=utf-8
	set fenc=utf-8
endif

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
