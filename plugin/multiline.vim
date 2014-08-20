"=============================================================================
" FILE: multiline.vim
" AUTHOR:  Yamasaki Kenta
" Creation Date: 2014/04/27 23:52:39
" Last Modified: 2014/08/20 11:20:41
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

set undodir=~/.vim/undo
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir))
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
