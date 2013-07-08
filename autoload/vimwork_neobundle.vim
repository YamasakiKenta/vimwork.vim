let s:save_cpo = &cpo
set cpo&vim

function! vimwork_neobundle#init() 
endfunction

NeoBundle 'https://github.com/w0ng/vim-hybrid.git'
NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'https://github.com/gregsexton/gitv.git'
NeoBundle 'https://github.com/osyo-manga/unite-quickfix.git'
NeoBundle 'https://github.com/tsukkee/unite-help.git'
NeoBundle 'https://github.com/Shougo/neocomplete.git'
NeoBundle 'https://github.com/thinca/vim-quickrun.git'
NeoBundle 'https://github.com/Shougo/neosnippet.git'
NeoBundle 'https://github.com/Shougo/unite-outline.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'  
NeoBundle 'https://github.com/Shougo/vesting.git'
NeoBundle 'https://github.com/Shougo/vimfiler'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/fuenor/qfixhowm.git'
NeoBundle 'https://github.com/sgur/unite-everything.git'
NeoBundle 'https://github.com/sgur/unite-qf.git'
NeoBundle 'https://github.com/thinca/vim-partedit.git'
NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
NeoBundle 'https://github.com/tpope/vim-fugitive.git'
NeoBundle 'https://github.com/tsukkee/unite-tag.git'
NeoBundle 'https://github.com/vim-scripts/Align.git'
NeoBundle 'https://github.com/vim-scripts/DirDiff.vim.git'
NeoBundle 'https://github.com/mfumi/snake.vim.git'

NeoBundle 'https://github.com/Shougo/vimproc.git', {
			\ 'build'   : {
			\ 'windows' : 'make -f make_mingw64.mak',
			\ 'cygwin'  : 'make -f make_cygwin.mak',
			\ 'mac'     : 'make -f make_mac.mak',
			\ 'unix'    : 'make -f make_unix.mak',
			\ },
			\ }

NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
" NeoBundle 'https://github.com/skammer/vim-css-color.git'
NeoBundle 'https://github.com/tomasr/molokai.git'
NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
NeoBundle 'https://github.com/flazz/vim-colorschemes.git'
NeoBundle 'https://github.com/vim-scripts/chlordane.vim.git'
NeoBundle 'https://github.com/jelera/vim-javascript-syntax.git'

let &cpo = s:save_cpo
unlet s:save_cpo
