function! vimwork_neobundle#init() "{{{
endfunction
"}}}
NeoBundle "git://github.com/osyo-manga/unite-quickfix.git"
NeoBundle "git://github.com/tsukkee/unite-help.git"
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/unite-outline.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'  
NeoBundle 'git://github.com/Shougo/vesting.git'
NeoBundle 'git://github.com/Shougo/vimfiler'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/fuenor/qfixhowm.git'
NeoBundle 'git://github.com/sgur/unite-everything.git'
NeoBundle 'git://github.com/sgur/unite-qf.git'
NeoBundle 'git://github.com/thinca/vim-qfreplace.git'
NeoBundle 'git://github.com/tpope/vim-fugitive.git'
NeoBundle 'git://github.com/tsukkee/unite-tag.git'let s:save_cpo = &cpo
set cpo&vim


NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/vim-scripts/DirDiff.vim.git'


let &cpo = s:save_cpo
unlet s:save_cpo

