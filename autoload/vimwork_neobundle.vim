let s:save_cpo = &cpo
set cpo&vim

function! vimwork_neobundle#init() 
endfunction

NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/gregsexton/gitv.git'
NeoBundle 'git://github.com/osyo-manga/unite-quickfix.git'
NeoBundle 'git://github.com/tsukkee/unite-help.git'
NeoBundle 'git://github.com/Shougo/neocomplete.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/unite-outline.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'  
NeoBundle 'git://github.com/Shougo/vesting.git'
NeoBundle 'git://github.com/Shougo/vimfiler'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/fuenor/qfixhowm.git'
NeoBundle 'git://github.com/sgur/unite-everything.git'
NeoBundle 'git://github.com/sgur/unite-qf.git'
NeoBundle 'git://github.com/thinca/vim-partedit.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tsukkee/unite-tag.git'
NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/vim-scripts/DirDiff.vim.git'
NeoBundle 'git://github.com/mfumi/snake.vim.git'

NeoBundle 'git://github.com/Shougo/vimproc.git', {
			\ 'build'   : {
			\ 'windows' : 'make -f make_mingw64.mak',
			\ 'cygwin'  : 'make -f make_cygwin.mak',
			\ 'mac'     : 'make -f make_mac.mak',
			\ 'unix'    : 'make -f make_unix.mak',
			\ },
			\ }

let &cpo = s:save_cpo
unlet s:save_cpo
