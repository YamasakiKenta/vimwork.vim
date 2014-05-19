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
" おしゃれだが、標準文字が面倒
if 0
	set ambiwidth=single
	set list lcs=tab:»\ ,eol:←
else 
	set list lcs=tab:\|\ 
endif

set go-=T
set go-=m
set guifont=Consolas:h10
set guifontwide=MS_Gothic:h10
set visualbell t_vb=

highlight CursorIM guibg=Magenta guifg=NONE

colorscheme Solarized
set bg=light

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
