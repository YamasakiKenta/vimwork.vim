let s:save_cpo = &cpo
set cpo&vim

function! vimwork_2#neobundle_startup() "{{{
	set nocompatible
	if has("vim_starting")
		set rtp+=~/.vim/bundle/neobundle.vim
	endif

	call neobundle#rc()
	call vimwork#neobundle()

	filetype plugin indent on
endfunction
"}}}
function! vimwork_2#neobundle() "{{{
	" Shougo
	NeoBundleFetch 'https://github.com/Shougo/shougo-s-github.git'

	NeoBundle 'https://github.com/Shougo/vimfiler', {
				\ 'depends' : 'https://github.com/Shougo/unite.vim.git' ,
				\ 'hooks' : { 'on_source' : function('vimwork#set_vimfiler') },
				\ }

	NeoBundle 'https://github.com/Shougo/unite.vim.git' , {
				\ 'hooks' : { 'on_source' : function('vimwork#set_unite') },
				\ }

	NeoBundle 'https://github.com/Shougo/neocomplete.git' , {
				\ 'hooks' : { 'on_source' : function('vimwork#set_necomplete') },
				\ }

	NeoBundleLazy 'https://github.com/Shougo/unite-outline.git', { 'autoload' : {
				\ 'unite_sources' : 'outline',
				\ }}

	NeoBundle 'https://github.com/Shougo/neobundle.vim.git'
	NeoBundle 'https://github.com/Shougo/neosnippet.git'
	NeoBundle 'https://github.com/Shougo/neobundle-vim-recipes.git'

	" thinca
	NeoBundle 'https://github.com/thinca/vim-partedit.git'
	NeoBundle 'https://github.com/thinca/vim-prettyprint.git'
	NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
	NeoBundle 'https://github.com/thinca/vim-quickrun.git'
	NeoBundle 'https://github.com/thinca/vim-ref.git'

	" Normal
	NeoBundle 'https://github.com/fuenor/qfixgrep.git', {
				\ 'hooks' : { 'on_source' : function('vimwork#set_qfixgrep') },
				\ }

	NeoBundle 'https://github.com/rbtnn/puyo.vim.git'
	NeoBundle 'https://github.com/tpope/vim-fugitive.git'
	NeoBundle 'https://github.com/vim-jp/vital.vim.git'
	NeoBundle 'https://github.com/vim-scripts/Align.git'

	" Unite 
	NeoBundleLazy 'tsukkee/unite-tag', { 'autoload' : {
				\ 'unite_sources' : 'tag'
				\ }}

	NeoBundleLazy 'osyo-manga/unite-quickfix', { 'autoload' : {
				\ 'unite_sources' : 'quickfix',
				\ }}

	" Setting
	NeoBundle 'https://github.com/Shougo/vimproc.git', {
				\ 'build'   : {
				\   'windows' : 'make -f make_mingw32.mak',
				\   'cygwin'  : 'make -f make_cygwin.mak',
				\   'mac'     : 'make -f make_mac.mak',
				\   'unix'    : 'make -f make_unix.mak',
				\   },
				\ }
endfunction
"}}}
function! vimwork_2#neobundle_mind(root) "{{{

	NeoBundle 'https://github.com/YamasakiKenta/chain-file.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ }

	NeoBundle 'https://github.com/YamasakiKenta/tree.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ }

	NeoBundle 'https://github.com/YamasakiKenta/unite-setting-ex.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ }

	NeoBundle 'https://github.com/YamasakiKenta/unite-setting.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ }

	NeoBundle 'https://github.com/YamasakiKenta/tab-diff.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ 'hooks' : { 'on_source' : function('vimwork#map_tabdiff') },
				\ }

	NeoBundleLazy 'https://github.com/YamasakiKenta/unite-perforce.vim.git', {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ 'hooks' : { 'on_source' : function('vimwork#map_unite_perforce') },
				\ }

endfunction "}}}

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
function

