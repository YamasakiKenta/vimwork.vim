let s:save_cpo = &cpo
set cpo&vim

function! vimwork#neobundle#init()
endfunction

if has("vim_starting")
	set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc()

" Fetch
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'YamasakiKenta/vimwork.vim'

" Shougo
NeoBundleFetch 'Shougo/shougo-s-github'
NeoBundle 'Shougo/vimfiler', {
			\ 'depends' : 'Shougo/unite.vim' ,
			\ }
let bundle = neobundle#get('vimfiler')
function! bundle.hooks.on_source(bundle) "{{{
	let g:vimfiler_as_default_explorer  = 1  " # 初期filer
	let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
endfunction
unlet bundle
"}}}
"
NeoBundle 'Shougo/unite.vim'
let bundle = neobundle#get('unite.vim')
function! bundle.hooks.on_source(bundle) "{{{
	let g:unite_enable_start_insert        = 1
	let g:unite_source_history_yank_enable = 1
	let g:unite_source_rec_max_cache_files = 100

	" nnoremap <leader>uK<CR>  :<C-u>Unite bookmark<CR>|"
	" nnoremap <leader>uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
	" nnoremap <leader>ub<CR>  :<C-u>Unite buffer<CR>|"
	" nnoremap <leader>uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
	nnoremap <leader>qf<CR>  :<C-u>Unite quickfix quickfix:1 quickfix:2 quickfix:3 quickfix:4<CR>|"
	nnoremap <leader>uG<CR>  :<C-u>UniteResume grep<CR>|"
	nnoremap <leader>uR<CR>  :<C-u>Unite resume<CR>|"
	nnoremap <leader>ubt<CR> :<C-u>Unite buffer_tags<CR>|"
	nnoremap <leader>ue<CR>  :<C-u>Unite outline<CR>|"
	nnoremap <leader>uf<CR>  :<C-u>Unite file_rec<CR>|"
	nnoremap <leader>ug<CR>  :<C-u>Unite -buffer-name=grep grep<CR>|"
	nnoremap <leader>uh<CR>  :<C-u>Unite history/yank<CR>|"
	nnoremap <leader>uj<CR>  :<C-u>Unite jump<CR>|"
	nnoremap <leader>ul<CR>  :<C-u>Unite line/fast<CR>|"
	nnoremap <leader>um<CR>  :<C-u>Unite file_mru<CR>|"
	nnoremap <leader>uom<CR> :<C-u>Unite output:message<CR>|"
	nnoremap <leader>up<CR>  :<C-u>Unite settings_var<CR>|"
	nnoremap <leader>upa<CR> :<C-u>Unite settings_var_all<CR>|"
	nnoremap <leader>upt<CR> :<C-u>Unite settings/ex<CR>|"
	nnoremap <leader>ur<CR>  :<C-u>UniteResume<CR>|"
	nnoremap <leader>us<CR>  :<C-u>Unite source<CR>|"
	nnoremap <leader>ut<CR>  :<C-u>Unite tag<CR>|"

	let mode = 'ag'
	let mode = ""
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
endfunction "}}}
function! bundle.hooks.on_post_source(bundle) "{{{
	call vimwork#unite#init()
endfunction "}}}

NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
let bundle = neobundle#get('neosnippet')
function! bundle.hooks.on_source(bundle)
	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
endfunction
unlet bundle

NeoBundleLazy 'Shougo/unite-outline', { 
			\ 'autoload' : {'unite_sources' : 'outline' }
			\ }


" thinca
NeoBundle 'thinca/vim-partedit'
" NeoBundle 'thinca/vim-prettyprint'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'

" Normal
NeoBundle 'fuenor/qfixgrep'
let bundle = neobundle#get('qfixgrep')
function! bundle.hooks.on_source(bundle) "{{{
	let QFix_CloseOnJump = 1
endfunction "}}}
unlet bundle

NeoBundle 'rbtnn/puyo.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'vim-scripts/Align', {
			\ 'autoload': {
			\	'functions': 'Align#Align',
			\	'commands': ['ALign', 'Align'],
			\ }}
let bundle = neobundle#get('Align')
function! bundle.hooks.on_source(bundle) "{{{
	let g:Align_xstrlen = 3
	command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endfunction "}}}
unlet bundle

" Unite 
NeoBundleLazy 'tsukkee/unite-tag', { 
			\ 'autoload' : { 'unite_sources' : 'tag'}
			\ }

NeoBundleLazy 'osyo-manga/unite-quickfix', { 
			\ 'autoload' : {'unite_sources' : 'quickfix'}
			\ }

" Setting
NeoBundle 'Shougo/vimproc', {
			\ 'build'   : {
			\   'windows' : 'make -f make_mingw32.mak',
			\   'cygwin'  : 'make -f make_cygwin.mak',
			\   'mac'     : 'make -f make_mac.mak',
			\   'unix'    : 'make -f make_unix.mak',
			\   },
			\ }
" mind
NeoBundleLazy 'YamasakiKenta/chain-file.vim', {
			\ 'autoload' : { 'commands' : 'ChainFile' }
			\ }
NeoBundleLazy 'YamasakiKenta/tree.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting-ex.vim', {
			\ 'autoload' : { 'unite_sources' : 'settings/ex' }
			\ }
NeoBundleLazy 'YamasakiKenta/unite-setting.vim', {
			\ 'autoload' : { 'unite_sources' : 'settings' }
			\ }

NeoBundleLazy 'YamasakiKenta/tab-diff.vim', {
			\ 'autoload' : { 'commands' : ['TabDiffStart', 'TabDiffEnd', 'TabDiffOrig'] },
			\ }
let bundle = neobundle#get('tab-diff.vim')
function! bundle.hooks.on_source(bundle) "{{{
	nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
	nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
	nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
endfunction "}}}
unlet bundle

NeoBundleLazy 'YamasakiKenta/unite-perforce.vim'
let bundle = neobundle#get('unite-perforce.vim')
function bundle.hooks.on_source(bundle) "{{{
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
endfunction "}}}

unlet bundle

filetype plugin indent on

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
