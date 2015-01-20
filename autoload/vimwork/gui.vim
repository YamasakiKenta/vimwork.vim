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

set enc=utf-8
set go-=T
set go-=m
set guifontwide=MS_Gothic:h10
set guifont=MS_Gothic:h10
set guifont=@MeiryoKe_Gothic:h10
set guifont=ゆたぽん（コーディング）:h10:cSHIFTJIS
set guifont=VL_ゴシック:h10:cSHIFTJIS
set visualbell t_vb=

highlight CursorIM guibg=Magenta guifg=NONE

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
