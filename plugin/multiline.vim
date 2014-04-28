"=============================================================================
" FILE: multiline.vim
" AUTHOR:  Yamasaki Kenta
" Creation Date: 2014/04/27 23:52:39
" Last Modifid: 2014/04/27 23:53:22
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim

aug vimwork_vimrc
	au!
	au BufRead,BufNewFile *.pc set filetype=c
	au BufWrite * call vimwork#command#update_time(['call cursor(6,0)'])
aug END

set backupdir=~/.vim/bak
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir))
endif

set undodir=~/.vim/undo
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir))
endif

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
