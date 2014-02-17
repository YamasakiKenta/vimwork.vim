let s:save_cpo = &cpo
set cpo&vim


function! vimwork#neobundle#init()
endfunction

if has("vim_starting")
	set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc()

" test
NeoBundle 'ujihisa/vimshell-ssh'

" color
NeoBundle 'vim-scripts/chlordane.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'cocopon/colorswatch.vim'

" NeoBundleFetch
NeoBundleFetch 'Shougo/shougo-s-github'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'YamasakiKenta/vimwork.vim'

" NeoBundle
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'pasela/unite-webcolorname'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'sgur/vim-gitgutter'
NeoBundle 'tpope/vim-funeobugitive'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'sgur/unite-everything'

" NeoBundleLazy
NeoBundleLazy 'CCTree'
NeoBundleLazy 'Shougo/vimshell.vim'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'Shougo/vinarise.vim'
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'rbtnn/puyo.vim'
NeoBundleLazy 'thinca/vim-partedit'
NeoBundleLazy 'thinca/vim-ref'
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'vim-scripts/Align'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'osyo-manga/unite-quickfix'
NeoBundleLazy 'YamasakiKenta/chain-file.vim'
NeoBundleLazy 'YamasakiKenta/tree.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting-ex.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting.vim'
NeoBundleLazy 'YamasakiKenta/tab-diff.vim'
NeoBundleLazy 'YamasakiKenta/unite-perforce.vim'
NeoBundleLazy 'Shougo/vimfiler'
NeoBundleLazy 'ujihisa/unite-colorscheme'

if neobundle#tap('vinarise.vim') "{{{
	call neobundle#config({'autoload':{'commands': 'Vinarise'}})
endif "}}}
if neobundle#tap('unite-setting.vim') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'setting'}})
endif "}}}
if neobundle#tap('unite-setting-ex.vim') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'settings/ex'}})
endif "}}}
if neobundle#tap('chain-file.vim') "{{{
	call neobundle#config({'autoload': {'commands': 'ChainFile'}})
endif "}}}
if neobundle#tap('unite-quickfix') "{{{
	call neobundle#config({'autoload': {'commands': 'quickfix'}})
endif "}}}
if neobundle#tap('unite-tag') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'tag'}})
endif "}}}
if neobundle#tap('unite-outline') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'outline'}})
endif "}}}
if neobundle#tap('emmet-vim') "{{{
	call neobundle#config({'autoload': { 'filetypes': 'html'}})
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:user_emmet_leader_key = '<c-\>'
	endfunction
endif "}}}
if neobundle#tap('vimfiler') "{{{
	call neobundle#config({
				\ 'depends' : 'Shougo/unite.vim',
				\ 'autoload' : {
				\ 'commands' : [
				\ {'name' : 'VimFiler'         , 'complete' : 'customlist , vimfiler#complete'} , 
				\ {'name' : 'VimFilerExplorer' , 'complete' : 'customlist , vimfiler#complete'} , 
				\ {'name' : 'Edit'             , 'complete' : 'customlist , vimfiler#complete'} , 
				\ {'name' : 'Write'            , 'complete' : 'customlist , vimfiler#complete'} , 
				\ 'Read', 'Source'],
				\ 'mappings' : '<Plug>(vimfiler_',
				\ 'explorer' : 1,
				\ }})
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:vimfiler_as_default_explorer  = 1  " # 初期filer
		let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
	endfunction 
endif "}}}
if neobundle#tap('unite.vim') "{{{
	nmap <leader>u [unite]
	" nnoremap [unite]uK<CR>  :<C-u>Unite bookmark<CR>|"
	" nnoremap [unite]uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
	" nnoremap [unite]ub<CR>  :<C-u>Unite buffer<CR>|"
	" nnoremap [unite]uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
	nnoremap [unite]qf<CR>  :<C-u>Unite quickfix quickfix:1 quickfix:2 quickfix:3 quickfix:4<CR>|"
	nnoremap [unite]G<CR>  :<C-u>UniteResume grep<CR>|"
	nnoremap [unite]R<CR>  :<C-u>Unite resume<CR>|"
	nnoremap [unite]bt<CR> :<C-u>Unite buffer_tags<CR>|"
	nnoremap [unite]e<CR>  :<C-u>Unite outline<CR>|"
	nnoremap [unite]f<CR>  :<C-u>Unite file_rec<CR>|"
	nnoremap [unite]g<CR>  :<C-u>Unite -buffer-name=grep grep<CR>|"
	nnoremap [unite]h<CR>  :<C-u>Unite history/yank<CR>|"
	nnoremap [unite]j<CR>  :<C-u>Unite jump<CR>|"
	nnoremap [unite]l<CR>  :<C-u>Unite line/fast<CR>|"
	nnoremap [unite]m<CR>  :<C-u>Unite file_mru<CR>|"
	nnoremap [unite]om<CR> :<C-u>Unite output:message<CR>|"
	nnoremap [unite]p<CR>  :<C-u>Unite settings_var<CR>|"
	nnoremap [unite]pa<CR> :<C-u>Unite settings_var_all<CR>|"
	nnoremap [unite]pt<CR> :<C-u>Unite settings/ex<CR>|"
	nnoremap [unite]r<CR>  :<C-u>UniteResume<CR>|"
	nnoremap [unite]s<CR>  :<C-u>Unite source<CR>|"
	nnoremap [unite]t<CR>  :<C-u>Unite tag<CR>|"
	call neobundle#config({'autoload': {'commands': 'Unite'}})
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:unite_enable_start_insert        = 1
		let g:unite_source_history_yank_enable = 1
		let g:unite_source_rec_max_cache_files = 100

		let mode = "ag"
		if mode == 'findstr'
			let g:unite_source_grep_command       = 'findstr'
			let g:unite_source_grep_default_opts  = '/n'
			let g:unite_source_grep_recursive_opt = '/s'
		elseif mode == 'ag'
			if executable('ag')
				let g:unite_source_grep_command = 'ag'
				let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
				let g:unite_source_grep_recursive_opt = ''
			endif
		endif
		call vimwork#unite#init()
	endfunction 
endif "}}}
if neobundle#tap('neosnippet') "{{{
	function! neobundle#tapped.hooks.on_source(bundle) 
		imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
	endfunction
endif "}}}
if neobundle#tap('qfixgrep') "{{{
	call neobundle#config({'autoload': {'commands': ['Grep', 'RGrep']}})
	let QFix_CloseOnJump = 1
	let QFixWin_EnableMode = 1
	let mygrepprg = 'grep'
endif "}}}
if neobundle#tap('Align') "{{{
	nnoremap <C-\>z :Grep /s "<c-r>=expand("<cword>")<CR>" *.vim\ *.php\ *.js|"
	call neobundle#config({'autoload': {'commands': ['Align', 'ALign'], 'mappings': '\tsp'}})
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:Align_xstrlen = 3
		command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
	endfunction
endif "}}}
if neobundle#tap('vimproc') "{{{
	call neobundle#config({'build': {
				\ 'windows' : 'make -f make_mingw32.mak',
				\ 'cygwin'  : 'make -f make_cygwin.mak',
				\ 'mac'     : 'make -f make_mac.mak',
				\ 'unix'    : 'make -f make_unix.mak',
				\ }})
endif "}}}
if neobundle#tap('tab-diff.vim') "{{{
	nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
	nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
	nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
	call neobundle#config({'autoload': {'commands' : ['TabDiffStart','TabDiffEnd','TabDiffOrig']}})
endif "}}}
if neobundle#tap('unite-perforce.vim') "{{{
	nmap <leader>cl<CR> <PLUG>(p4_echo_client_data)
	nmap <leader>cr<CR> <PLUG>(p4_lcd_clentpath)
	nmap <leader>ff<CR> <PLUG>(p4_find)
	nmap <leader>pl<CR> <PLUG>(p4_filelog)
	nmap <leader>pd<CR> <PLUG>(p4_diff)
	nmap <leader>id<CR> <PLUG>(p4_get_depot)
	nnoremap <leader>pan<CR> :<C-u>PfAnnotate<CR>|"
	nnoremap <leader>pda<CR> :<c-u>Unite p4/diff<CR>|"
	nnoremap <leader>pp<CR>  :<c-u>PfSetting<CR>|"
	nnoremap <leader>pr<CR>  :<c-u>PfRevert<CR>|"
	nnoremap <leader>pe<CR>  :<c-u>PfEdit<CR>|"
	nnoremap <leader>pE<CR>  :<c-u>PfAdd<CR>|"
	nnoremap <leader>wd<CR>  :<c-u>PfDiff<CR>|"
	nnoremap <leader>pi<CR>  :<C-u>Unite p4/info<CR>|"
	nnoremap <leader>pt<CR>  :<C-u>Unite p4/clients -default-action=a_p4_client_set<CR>|"
	nnoremap <leader>pc<CR>  :<C-u>Unite p4/changes_pending<CR>|"
	nnoremap <leader>ps<CR>  :<C-u>Unite p4/changes_submitted<CR>|"
	nnoremap <leader>po<CR>  :<C-u>Unite p4/opened<CR>|"
	nnoremap <leader>pj<CR>  :<C-u>Unite p4/jobs<CR>|"
	nnoremap <leader>ph<CR>  :<C-u>Unite p4/have_reset<CR>|"
	nnoremap <leader>pa<CR>  :<C-u>Unite p4/annotate<CR>|"
	nnoremap <leader>pC<CR>  :<C-u>Unite p4/changes_pending_reopen<CR>|"
	nnoremap <leader>pte<CR> :<C-u>Unite p4/template<CR>|"
	nnoremap <leader>pf<CR>  :call unite#start([['p4/files', getcwd()]])<CR>|"
	nnoremap <leader>pF<CR>  :call unite#start([['p4/files', expand("%:h")]])<CR>|"
	call neobundle#config({'autoload': {
				\ 'unite_sources': 'p4',
				\ 'commands': 'Pf',
				\ 'mappings': '<PLUG>(p4_'
				\ }})
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:neocomplete#auto_completion_start_length = 4
	endfunction
endif "}}}
if neobundle#tap('vim-fugitive') "{{{
	call neobundle#config({'autoload': {'functions': ['fugitive#statusline']}})
endif "}}}
if neobundle#tap('vaxe') "{{{
    call neobundle#config({'autoload': {'filetypes': 'haxe'}})
endif "}}}
if neobundle#tap('vim-coffee-script') "{{{
	aug _vim_coffee_script
		au!
		au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
	aug END
    call neobundle#config({'autoload':{'filetypes': 'coffee'}})
endif "}}}
if neobundle#tap('vim-quickrun') "{{{
	call neobundle#config({'autoload': {'commands': 'QuickRun'}})
endif "}}}
if neobundle#tap('vimshell.vim') "{{{
	call neobundle#config({'autoload': {'commands': 'VimShell'}})
endif "}}}
if neobundle#tap('ujihisa/unite-colorscheme') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'colorscheme'}})
endif "}}}
if neobundle#tap('CCTree') "{{{
    call neobundle#config({'autoload': {'filetypes': 'c'}})
endif "}}}
if neobundle#tap('unite-everything') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'everything'}})
endif "}}}
if neobundle#tap('rainbow_parentheses.vim') " {{{
	aug _rainbow_parentheses
		au!
		au VimEnter * RainbowParenthesesToggle
		au Syntax * RainbowParenthesesLoadRound
		au Syntax * RainbowParenthesesLoadSquare
		au Syntax * RainbowParenthesesLoadBraces
	aug END
	let g:rbpt_colorpairs = [
				\ ['brown',       'RoyalBlue3'],
				\ ['Darkblue',    'SeaGreen3'],
				\ ['darkgray',    'DarkOrchid3'],
				\ ['darkgreen',   'firebrick3'],
				\ ['darkcyan',    'RoyalBlue3'],
				\ ['darkred',     'SeaGreen3'],
				\ ['darkmagenta', 'DarkOrchid3'],
				\ ['brown',       'firebrick3'],
				\ ['gray',        'RoyalBlue3'],
				\ ['black',       'SeaGreen3'],
				\ ['darkmagenta', 'DarkOrchid3'],
				\ ['Darkblue',    'firebrick3'],
				\ ['darkgreen',   'RoyalBlue3'],
				\ ['darkcyan',    'SeaGreen3'],
				\ ['darkred',     'DarkOrchid3'],
				\ ['red',         'firebrick3'],
				\ ]

endif "}}}
if neobundle#tap('lightline.vim') "{{{
	call vimwork#lightline#init()
endif "}}}

call neobundle#call_hook('on_source')

filetype plugin indent on

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
