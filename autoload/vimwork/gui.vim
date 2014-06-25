let s:save_cpo = &cpo
set cpo&vim

function! vimwork#gui#init()
endfunction

if !has('gui')
	finish
endif

set ruler
set nocompatible
syntax enable
filetype on
filetype indent on
filetype plugin on
nnoremap <A-Space> :<C-u>simalt ~<CR>|"

set go-=T
set go-=m
if 0
	set guifont=Consolas:h10
	set guifontwide=MS_Gothic:h10
else
	set guifont=MS_Gothic:h10
endif

" 音なし
set visualbell t_vb=

highlight CursorIM guibg=Magenta guifg=NONE

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
