let s:save_cpo = &cpo
set cpo&vim

function! vimwork#neobundle#init()
endfunction

if has("vim_starting")
	set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc()

" Test

" color
" NeoBundle 'vim-scripts/chlordane.vim'
" NeoBundle 'nanotech/jellybeans.vim'
" NeoBundle 'w0ng/vim-hybrid'
" NeoBundle 'vim-scripts/twilight'
" NeoBundle 'jonathanfilip/vim-lucius'
" NeoBundle 'jpo/vim-railscasts-theme'
" NeoBundle 'altercation/vim-colors-solarized'
" NeoBundle 'vim-scripts/Wombat'
" NeoBundle 'tomasr/molokai'
" NeoBundle 'vim-scripts/rdark'
" NeoBundle 'cocopon/colorswatch.vim'
" NeoBundle 'gh:svjunic/RadicalGoodSpeed.vim.git'
" NeoBundle 'altercation/vim-colors-solarized'

" NeoBundleFetch
" NeoBundleFetch 'Shougo/shougo-s-github'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'YamasakiKenta/vimwork.vim'

" NeoBundle
" NeoBundle 'violetyk/cake.vim'
" NeoBundle 'sgur/vim-gitgutter'
" NeoBundle 'lilydjwg/colorizer' " CSS PREVIEW
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundle 'fuenor/qfixgrep'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'thinca/vim-qfreplace'

" Unite 
NeoBundleLazy 'Shougo/unite.vim'
NeoBundleLazy 'pasela/unite-webcolorname'
NeoBundleLazy 'sgur/unite-everything'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'osyo-manga/unite-quickfix'
NeoBundleLazy 'YamasakiKenta/unite-setting-ex.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting.vim'
NeoBundleLazy 'YamasakiKenta/unite-perforce.vim'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'Shougo/neomru.vim'

" NeoBundleLazy
" NeoBundleLazy 'Shougo/vimproc.vim' " gvimでは、初期のやつを使用する
" NeoBundleLazy 'Shougo/vinarise.vim'
" NeoBundleLazy 'rbtnn/puyo.vim'
" NeoBundleLazy 'thinca/vim-ref'
" NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-partedit'
NeoBundleLazy 'rbtnn/vbnet_indent.vim'
NeoBundleLazy 'kien/rainbow_parentheses.vim'
NeoBundleLazy 'itchyny/lightline.vim'
NeoBundleLazy 'CCTree'
NeoBundleLazy 'Shougo/vimshell.vim'
NeoBundleLazy 'thinca/vim-quickrun'
NeoBundleLazy 'mattn/emmet-vim'
NeoBundleLazy 'vim-scripts/Align'
NeoBundleLazy 'YamasakiKenta/chain-file.vim'
NeoBundleLazy 'YamasakiKenta/tree.vim'
NeoBundleLazy 'YamasakiKenta/tab-diff.vim'
NeoBundleLazy 'Shougo/vimfiler'

function! s:is_win()
	return has('GUI') && ( has('win32') || has('win64') )
endfunction
if neobundle#tap('chain-file.vim') "{{{
	call neobundle#config({'autoload': {'commands': 'ChainFile'}})
	let g:chain_dict = { '__file' : {
				\ 'win7.vim' : '../autoload/vimwork.vim',
				\ 'autoload/vimwork.vim' : '../local/win7.vim',
				\ },'__pattern': [
				\ { 'before': 'autoload\(/.*\)\?/\(.*\.vim$\)'         , 'after': 'plugin/**/\2'}                   , 
				\ { 'before': 'plugin\(/.*\)\?/\(.*\.vim\)'            , 'after': 'autoload/**/\2'}                 , 
				\ { 'before': '/coffee/\(.*\)\.coffee$'                , 'after': '/*/\1.js'}                       , 
				\ { 'before': '/coffee2js/\(.*\)\.js$'                 , 'after': '/coffee/\1.coffee'}              , 
				\ { 'before': '/View/\(.*\)s/\(.*\).ctp$'              , 'after': '/Model/\1.php'}                  , 
				\ { 'before': '/Model/\(.*\).php$'                     , 'after': '/Controller/\1sController.php'}  , 
				\ { 'before': '/Controller/\(.*\)Controller.php$'      , 'after': '/View/\1/index.ctp'}             , 
				\ ],'__extension' : { 
				\ 'sql': 'xml',
				\ 'xml': 'sql' 
				\ },
				\ }
	"C:\xampp\htdocs\yamasaki\cake\app\Model\MySampleData.php
endif "}}}
if neobundle#tap('emmet-vim') "{{{
	call neobundle#config({'autoload': { 
				\ 'filetypes': ['html','css','php'],
				\ 'mappings' : [
				\ '<Plug>(emmet-',
				\ '<Plug>(emmmet-',
				\ ],
				\ }})
	function! neobundle#tapped.hooks.on_source(bundle) 
		" let g:user_emmet_leader_key = '<c-\>'
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
if neobundle#tap('neosnippet') "{{{
	function! neobundle#tapped.hooks.on_source(bundle) 
		" For snippet_complete marker.
		" Plugin key-mappings.
		imap <C-k>     <Plug>(neosnippet_expand_or_jump)
		smap <C-k>     <Plug>(neosnippet_expand_or_jump)
		xmap <C-k>     <Plug>(neosnippet_expand_target)
		xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)
		imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
		imap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-TAB>"
	endfunction
endif "}}}
if neobundle#tap('qfixgrep') "{{{
	call neobundle#config({'autoload': {'commands': ['Grep', 'RGrep']}})
	let QFix_CloseOnJump = 1
	let QFixWin_EnableMode = 1
	let mygrepprg = 'grep'
endif "}}}
if neobundle#tap('Align') "{{{
	call neobundle#config({'autoload': {'commands': ['Align', 'ALign'], 'mappings': '\tsp'}})
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:Align_xstrlen = 3
		command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
	endfunction
endif "}}}
if neobundle#tap('vimproc.vim') "{{{
	if !s:is_win()
		call neobundle#config({'build': {
					\ 'windows' : 'make -f make_mingw32.mak',
					\ 'cygwin'  : 'make -f make_cygwin.mak',
					\ 'mac'     : 'make -f make_mac.mak',
					\ 'unix'    : 'make -f make_unix.mak',
					\ }})
	endif
endif "}}}
if neobundle#tap('tab-diff.vim') "{{{
	nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
	nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
	nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
	call neobundle#config({'autoload': {'commands' : ['TabDiffStart','TabDiffEnd','TabDiffOrig']}})
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
	function! neobundle#tapped.hooks.on_source(bundle) 
		let g:neocomplete#enable_at_startup = 1
		let g:neocomplete#auto_completion_start_length = 3
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
if neobundle#tap('CCTree') "{{{
    call neobundle#config({'autoload': {'filetypes': 'c'}})
endif "}}}
if neobundle#tap('rainbow_parentheses.vim') " {{{
	if s:is_win()
		call neobundle#config({'lazy':0})
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
	endif

endif "}}}
if neobundle#tap('lightline.vim') "{{{

	if s:is_win()
		" とりあえずOFFにする
		" call neobundle#config({'lazy': 0})
		call vimwork#lightline#init()
	endif 
endif "}}}lightline.vim
" Command
if neobundle#tap('vim-partedit') "{{{
	call neobundle#config({'autoload': {'commands': 'Partedit'}})
endif "}}}thinca/vim-partedit
if neobundle#tap('vinarise.vim') "{{{
	call neobundle#config({'autoload':{'commands': 'Vinarise'}})
endif "}}}
if neobundle#tap('puyo.vim') "{{{
	call neobundle#config({'autoload':{'commands': 'Puyo'}})
endif "}}}
" Unite ( 自動でなる ) 
if neobundle#tap('unite.vim') "{{{
	nmap <leader>u [unite]
	" nnoremap [unite]uK<CR>  :<C-u>Unite bookmark<CR>|"
	" nnoremap [unite]uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
	" nnoremap [unite]ub<CR>  :<C-u>Unite buffer<CR>|"
	" nnoremap [unite]uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
	nnoremap [unite]qf  :<C-u>Unite quickfix quickfix:1 quickfix:2 quickfix:3 quickfix:4|"
	nnoremap [unite]G  :<C-u>UniteResume grep|"
	nnoremap [unite]R  :<C-u>Unite resume|"
	nnoremap [unite]bt :<C-u>Unite buffer_tags|"
	nnoremap [unite]e  :<C-u>Unite outline|"
	nnoremap [unite]f  :<C-u>Unite file_rec|"
	nnoremap [unite]g  :<C-u>Unite -buffer-name=grep grep|"
	nnoremap [unite]h  :<C-u>Unite history/yank|"
	nnoremap [unite]j  :<C-u>Unite jump|	
	nnoremap [unite]l  :<C-u>Unite line/fast|"
	nnoremap [unite]m  :<C-u>Unite file_mru|"
	nnoremap [unite]om :<C-u>Unite output:message|"
	nnoremap [unite]p  :<C-u>Unite settings_var|"
	nnoremap [unite]pa :<C-u>Unite settings_var_all|"
	nnoremap [unite]pt :<C-u>Unite settings/ex|"
	nnoremap [unite]r  :<C-u>UniteResume|"
	nnoremap [unite]s  :<C-u>Unite source|"
	nnoremap [unite]t  :<C-u>Unite tag|"
	nnoremap [unite]c  :<C-u>Unite cake_behavior cake_component cake_config cake_controller cake_core cake_fixture cake_helper cake_lib cake_model cake_shell cake_task cake_view
	call neobundle#config({'autoload': {'commands':[{'name': 'Unite', 'complete': 'customlist,unite#complete_source'}]}})
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
" Unite 
if neobundle#tap('neomru.vim') "{{{
	call neobundle#config({'autoload':{'unite_sources': 'file_mru'}})
endif "}}}
if 0 
if neobundle#tap('unite-everything') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'everything'}})
endif "}}}
if neobundle#tap('ujihisa/unite-colorscheme') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'colorscheme'}})
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
if neobundle#tap('unite-setting.vim') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'setting'}})
endif "}}}
if neobundle#tap('unite-setting-ex.vim') "{{{
	call neobundle#config({'autoload': {'unite_sources': 'settings/ex'}})
endif "}}}
if neobundle#tap('pasela/unite-webcolorname') "{{{
	" call neobundle#config({'autoload': {'unite_sources': 'webcolorname'}})
endif "}}}
endif
call neobundle#call_hook('on_source')
filetype plugin indent on

" 文法確認 "{{{
" function! vimwork#neobundle#is_comment(line, col)
    " echo synIDattr(synIDtrans(synID(a:line, a:col, 1)), 'name')
" endfunction
" call vimwork#neobundle#is_comment(line("."), col("."))
"}}}

if 1  "{{{ NeoSnip
	" SuperTab like snippets behavior.
	imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\ :pumvisible() ? "\<C-n>"
				\ :emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
				\ :"\<TAB>"
	smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
				\ "\<Plug>(neosnippet_expand_or_jump)"
				\ :"\<TAB>"
endif  "}}}


if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
