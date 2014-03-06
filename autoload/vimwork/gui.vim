let s:save_cpo = &cpo
set cpo&vim

function! vimwork#gui#init()
endfunction

set ruler
set nocompatible
syntax enable
filetype on
filetype indent on
filetype plugin on
nnoremap <A-Space> :<C-u>simalt ~<CR>|"
set ambiwidth=single
set list lcs=tab:»\ ,eol:←

set go-=T
set go-=m
set ambiwidth=single
set guifont=Consolas:h10
set guifontwide=MS_Gothic:h10
set list lcs=tab:»\ ,eol:←

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
