let s:save_cpo = &cpo
set cpo&vim

aug vimwork_vimrc
	au!
	au BufRead,BufNewFile *.pc set filetype=c
aug END

set backupdir=~/.vim/bak
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir))
endif

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
