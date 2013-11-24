let s:save_cpo = &cpo
set cpo&vim

function! s:neobundle() "{{{
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

	NeoBundle 'https://github.com/Shougo/neosnippet.git'

	NeoBundleLazy 'https://github.com/Shougo/unite-outline.git', { 
				\ 'autoload' : {'unite_sources' : 'outline' }
				\ }

	NeoBundle 'https://github.com/Shougo/neobundle.vim.git'

	" thinca
	NeoBundle 'https://github.com/thinca/vim-partedit.git'
	" NeoBundle 'https://github.com/thinca/vim-prettyprint.git'
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
	NeoBundleLazy 'tsukkee/unite-tag', { 
				\ 'autoload' : { 'unite_sources' : 'tag'}
				\ }

	NeoBundleLazy 'osyo-manga/unite-quickfix', { 
				\ 'autoload' : {'unite_sources' : 'quickfix'}
				\ }

	" Setting
	NeoBundle 'https://github.com/Shougo/vimproc.git', {
				\ 'build'   : {
				\   'windows' : 'make -f make_mingw32.mak',
				\   'cygwin'  : 'make -f make_cygwin.mak',
				\   'mac'     : 'make -f make_mac.mak',
				\   'unix'    : 'make -f make_unix.mak',
				\   },
				\ }
	" mind
endfunction
"}}}

function! vimwork#neobundle#init() "{{{
	if has("vim_starting")
		set rtp+=~/.vim/bundle/neobundle.vim
	endif

	call neobundle#rc()
	call s:neobundle()

	filetype plugin indent on
endfunction
"}}}
function! vimwork#neobundle#mind(root) "{{{

	let g:data = {
				\ 'base' : a:root,
				\ 'type' : 'nosync', 
				\ }

	if get(g:, 'vimwork#neobundle#mine_sync', 0) 
		unlet data.type
	endif

	NeoBundleLazy 'https://github.com/YamasakiKenta/chain-file.vim.git', extend(copy(g:data), {
				\ 'autoload' : { 'commands' : 'ChainFile' }
				\ })

	NeoBundleLazy 'https://github.com/YamasakiKenta/tree.vim.git', copy(g:data)
	NeoBundleLazy 'https://github.com/YamasakiKenta/unite-setting-ex.vim.git', extend(copy(g:data), {
				\ 'autoload' : { 'unite_sources' : 'settings/ex' }
				\ })
	NeoBundleLazy 'https://github.com/YamasakiKenta/unite-setting.vim.git', extend(copy(g:data), {
				\ 'autoload' : { 'unite_sources' : 'settings' }
				\ })

	NeoBundleLazy 'https://github.com/YamasakiKenta/tab-diff.vim.git', extend(copy(g:data), {
				\ 'hooks' : { 'on_source' : function('vimwork#map_tabdiff') },
				\ 'autoload' : { 'commands' : ['TabDiffStart', 'TabDiffEnd', 'TabDiffOrig'] },
				\ })

	NeoBundleLazy 'https://github.com/YamasakiKenta/unite-perforce.vim.git', extend(copy(g:data), {
				\ 'hooks' : { 'on_source' : function('vimwork#map_unite_perforce') },
				\ })
	
	NeoBundleLazy 'https://github.com/YamasakiKenta/vimwork.vim.git', copy(g:data)

	unlet g:data

endfunction "}}}

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
