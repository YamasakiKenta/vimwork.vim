let s:save_cpo = &cpo
set cpo&vim


function! s:init() "{{{
	if !exists('s:cache_init')
		return 1
	endif

	let s:cache_init = 1
	let $VIMWORK   = expand(exists('$VIMWORK'  ) ? $VIMWORK   : '~/vimwork'  )
	let $LOCALWORK = expand(exists('$LOCALWORK') ? $LOCALWORK : '~/localwork')
	return 0
endfunction
"}}}

function! vimwork#set_gui() "{{{
	if !has('gui')
		set ruler           " # カーソルの位置の表示
		set nocompatible    " # vimの機能が使える
		syntax enable       " # 色を付け - 設定がリセットされる
		filetype on
		filetype indent on
		filetype plugin on
	endif
endfunction
"}}}

function! vimwork#map_misc()
	call s:init()
	so $VIMRUNTIME/macros/matchit.vim " VIMRUNTIME is default var 
	" map {{{
	map + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>|"
	map * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'<CR>|"
	"}}}
	" nmap {{{
	nmap ;sy<CR> 	<Plug>(edit_syntax_file)
	nmap ;uq<CR> 	<Plug>(uniq_line)
	nmap v/ 		<Plug>(select_search)
	"}}}
	" let {{{
	let g:Align_xstrlen = 3
	let g:mygrepprg = 'findstr'
	"}}}
	" set {{{
	"set hidden                                             " # ファイルを保存せず移動
	set autoread                                            " # 自動更新
	set backupdir=~/vimbackup                               " # Backupフォルダのパス
	set cursorline                                          " # カーソル行の強調
	set dip=filler,icase,iwhite,vertical
	set fdm=marker                                          " # 自動的に折りたたみ
	set fo+=ro                                              " # 自動でコメント挿入
	set grepprg=findstr\ /n
	" set grepprg=grep\ -nH
	set guioptions-=T                                       " # メニューバーを削除
	set guioptions-=m                                       " # ツールバーを削除
	set hlsearch                                            " # 検索
	set ignorecase                                          " # 検索で大文字小文字を区別しない
	set incsearch
	set laststatus=2                                        " # ステータス行の表示
	set lcs=tab:`\                                          " # 記号の表示
	set list
	set modeline                                            " # 読み込み時の設定
	set noswapfile                                          " # SwapFile
	set nowrap                                              " # 折り返し
	set number                                              " # 番号入力
	set shiftwidth=4
	set smartcase
	set stl=[%{&ff}][%n]%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	set tabstop=4                                           " # tabの設定
	set tw=0                                                " # 自動改行 OFF
	set ve=block

	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir))
	endif
	"}}}
	"nnoremap - normal "{{{
	nnoremap <C-s> 	 :<C-u>SetNum<CR>|"
	nnoremap ;a<CR>  :<C-u>ChainFile<CR>|"
	nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
	nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
	nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # ファイル名の取得
	nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # ファイル名の取得 ( フルパス )
	"}}}
	"nnoremap - simple {{{
	nnoremap <C-j> j.|"
	nnoremap <C-k> n.|"
	nnoremap <C-n> :<C-u>cn<CR>|"
	nnoremap <C-p> :<C-u>cN<CR>|"
	nnoremap j gj|" 
	nnoremap k gk|"
	nnoremap <C-]> <C-]>zz|"    
	nnoremap <S-Space> za|"    
	nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|" 
	nnoremap [[ [[zz|"
	nnoremap ]] ]]zz|"
	"}}}
	"nnoremap - typo {{{
	nnoremap <F1> <ESC>
	command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
	"}}}
	"vnoremap - simple "{{{
	vnoremap < <gv|"
	vnoremap > >gv|
	"}}}
endfunction

function! vimwork#set_qfixhowm() "{{{
	let QFix_CloseOnJump = 1" # QFixHown - を自動的に終了する
endfunction
"}}}
function! vimwork#map_unite_perforce() "{{{
	nmap ;cl<CR> <PLUG>(p4_echo_client_data)
	nmap ;cr<CR> <PLUG>(p4_lcd_clentpath)
	nmap ;ff<CR> <PLUG>(p4_find)
	nmap ;pl<CR> <PLUG>(p4_filelog)
	nmap ;pd<CR> <PLUG>(p4_diff)
	nmap ;id<CR> <PLUG>(p4_get_depot)

	nnoremap ;pan<CR> :<C-u>PfAnnotate<CR>|"
	nnoremap ;pda<CR> :<c-u>Unite p4/diff<CR>|"
	nnoremap ;pp<CR>  :<c-u>PfSetting<CR>|"
	nnoremap ;pr<CR>  :<c-u>PfRevert<CR>|"
	nnoremap ;pe<CR>  :<c-u>PfEdit<CR>|"
	nnoremap ;pE<CR>  :<c-u>PfAdd<CR>|"
	nnoremap ;wd<CR>  :<c-u>PfDiff<CR>|"
	nnoremap ;pi<CR>  :<C-u>Unite p4/info<CR>|"
	nnoremap ;pt<CR>  :<C-u>Unite p4/clients -default-action=a_p4_client_set<CR>|"
	nnoremap ;pc<CR>  :<C-u>Unite p4/changes_pending<CR>|"
	nnoremap ;ps<CR>  :<C-u>Unite p4/changes_submitted<CR>|"
	nnoremap ;po<CR>  :<C-u>Unite p4/opened<CR>|"
	nnoremap ;pj<CR>  :<C-u>Unite p4/jobs<CR>|"
	nnoremap ;ph<CR>  :<C-u>Unite p4/have_reset<CR>|"
	nnoremap ;pa<CR>  :<C-u>Unite p4/annotate<CR>|"
	nnoremap ;pC<CR>  :<C-u>Unite p4/changes_pending_reopen<CR>|"
	nnoremap ;pte<CR> :<C-u>Unite p4/template<CR>|"
	nnoremap ;pf<CR>  :call unite#start([['p4/files', getcwd()]])<CR>|"
	nnoremap ;pF<CR>  :call unite#start([['p4/files', expand("%:h")]])<CR>|"
endfunction
"}}}
function! vimwork#map_cscope() "{{{
	set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
	nnoremap <C-\>L :cs kill -1<CR>:call system("cscope -b -R -q")<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>l :cs kill -1<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>K :call system("ctags -R --excmd=number")<CR>|"
	nnoremap <C-\>G :call system("gtags -v")<CR>|"

	nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"

	nnoremap <C-\>a :Ag <c-r>=expand("<cword>")<CR>|"
	nnoremap <C-\>z :grep /s <c-r>=expand("<cword>")<CR>|"

endfunction
"}}}
function! vimwork#map_tabdiff() "{{{
	nnoremap ;dy<CR> :<C-u>TabDiffStart<CR>
	nnoremap ;dn<CR> :<C-u>TabDiffEnd<CR>
	nnoremap ;do<CR> :<C-u>TabDiffOrig<CR>
endfunction
"}}}
function! vimwork#map_unite() "{{{
	let g:unite_enable_start_insert        = 0
	let g:unite_source_history_yank_enable = 0
	let g:unite_source_history_yank_enable = 0
	let g:unite_source_rec_max_cache_files = 3000


	nnoremap ;ur<CR>  :<C-u>UniteResume<CR>|"
	nnoremap ;uR<CR>  :<C-u>Unite resume<CR>|"

	nnoremap ;cw<CR>  :<C-u>Unite qf<CR>|"
	nnoremap ;et<CR>  :<C-u>Unite everything<CR>|"
	nnoremap ;uK<CR>  :<C-u>Unite bookmark<CR>|"
	nnoremap ;ub<CR>  :<C-u>Unite buffer<CR>|"
	nnoremap ;ubt<CR> :<C-u>Unite buffer_tags<CR>|"
	nnoremap ;ue<CR>  :<C-u>Unite outline<CR>|"
	nnoremap ;uf<CR>  :<C-u>Unite file_rec<CR>|"
	nnoremap ;uh<CR>  :<C-u>Unite history/yank<CR>|"
	nnoremap ;uj<CR>  :<C-u>Unite jump<CR>|"
	nnoremap ;uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
	nnoremap ;ul<CR>  :<C-u>Unite line/fast<CR>|"
	nnoremap ;um<CR>  :<C-u>Unite file_mru<CR>|"
	nnoremap ;uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
	nnoremap ;uom<CR> :<C-u>Unite output:message<CR>|"
	nnoremap ;upt<CR> :<C-u>Unite settings_ex<CR>|"
	nnoremap ;us<CR>  :<C-u>Unite source<CR>|"
	nnoremap ;ut<CR>  :<C-u>Unite tag<CR>|"
	nnoremap ;ug<CR>  :<C-u>Unite grep<CR>|"

	nnoremap ;up<CR>  :<C-u>Unite settings_var<CR>|"
	nnoremap ;upa<CR> :<C-u>Unite settings_var_all<CR>|"

endfunction
"}}}
function! vimwork#set_vimwfiler() "{{{
	let g:vimfiler_as_default_explorer  = 1  " # 初期filer
	let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
endfunction
"}}}
function! vimwork#set_necomplete() "{{{
	let g:neocomplete#enable_at_startup = 1
	" imap <C-k>  <Plug>(neocomplete_start_unite_complete)|"
	" imap <C-q>  <Plug>(neocomplete_start_unite_quick_match)|"
	inoremap <C-s> <c-o>:Unite neocomplete snippet<CR>|"
endfunction
"}}}
function! vimwork#map_neosnip() "{{{
	call s:init()
	let g:neosnippet#snippets_directory = join(map([$VIMWORK, $LOCALWORK], "v:val.'/snippets'"),',')
	nnoremap ;es<CR> :<C-u>NeoSnippetEdit<CR>|"
	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)|"
endfunction
"}}}
function! vimwork#neobundle()  "{{{
	" colos
	" NeoBundle 'https://github.com/altercation/vim-colors-solarized.git'
	" NeoBundle 'https://github.com/flazz/vim-colorschemes.git'
	" NeoBundle 'https://github.com/nanotech/jellybeans.vim.git'
	" NeoBundle 'https://github.com/tomasr/molokai.git'
	" NeoBundle 'https://github.com/vim-scripts/chlordane.vim.git'
	" NeoBundle 'https://github.com/w0ng/vim-hybrid.git'

	" Unite 
	NeoBundle 'https://github.com/sgur/unite-qf.git'
	NeoBundle 'https://github.com/Shougo/unite-outline.git'
	NeoBundle 'https://github.com/Shougo/unite.vim.git'  
	" NeoBundle 'https://github.com/tsukkee/unite-help.git'
	NeoBundle 'https://github.com/tsukkee/unite-tag.git'
	NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'

	" Normal
	" NeoBundle 'https://github.com/Shougo/shougo-s-github.git'
	" NeoBundle 'https://github.com/Shougo/vinarise.vim.git'
	" NeoBundle 'https://github.com/othree/html5.vim.git'
	" NeoBundle 'https://github.com/rbtnn/vimconsole.vim.git'
	" NeoBundle 'https://github.com/rbtnn/vimconsole.vim.git'
	" NeoBundle 'https://github.com/tpope/vim-git.git'
	" NeoBundle 'https://github.com/tyru/open-browser.vim.git'
	" NeoBundle 'https://github.com/vim-scripts/CCTree.git'
	" NeoBundle 'alpaca-tc/alpaca_powertabline'
	NeoBundle 'https://github.com/fuenor/qfixgrep.git'
	NeoBundle 'https://github.com/Shougo/neocomplete.git'
	NeoBundle 'https://github.com/Shougo/neosnippet.git'
	NeoBundle 'https://github.com/Shougo/vimfiler'
	NeoBundle 'https://github.com/Shougo/vimshell.git'
	NeoBundle 'https://github.com/jelera/vim-javascript-syntax.git'
	NeoBundle 'https://github.com/kannokanno/previm.git'
	NeoBundle 'https://github.com/thinca/vim-partedit.git'
	NeoBundle 'https://github.com/thinca/vim-prettyprint.git'
	NeoBundle 'https://github.com/thinca/vim-qfreplace.git'
	NeoBundle 'https://github.com/thinca/vim-quickrun.git'
	NeoBundle 'https://github.com/tpope/vim-fugitive.git'
	NeoBundle 'https://github.com/vim-scripts/Align.git'
	" NeoBundle 'https://https://github.com/vim-jp/vital.vim.git' " たまにマー
	" ジする

	" Setting
	NeoBundle 'https://github.com/Shougo/vimproc.git', {
				\ 'build'   : {
				\ 'windows' : 'make -f make_mingw64.mak',
				\ 'cygwin'  : 'make -f make_cygwin.mak',
				\ 'mac'     : 'make -f make_mac.mak',
				\ 'unix'    : 'make -f make_unix.mak',
				\ },
				\ }
endfunction
"}}}
function! vimwork#unite_grep() "{{{
	let mode = 'ag'
	if mode == 'findstr'
		let g:unite_source_grep_command       = 'findstr'
		let g:unite_source_grep_default_opts  = '/n'
		let g:unite_source_grep_recursive_opt = '/s'
	elseif mode == 'ag'
		let g:unite_source_grep_command       = 'Ag'
		let g:unite_source_grep_default_opts  = '--nocolor --nogroup'
		let g:unite_source_grep_recursive_opt = ''
	endif
endfunction
"}}}
function! vimwork#vimshell() "{{{
	let g:vimshell_prompt_expr = 'getcwd()." > "'
	let g:vimshell_prompt_pattern = '^\f\+ > '
endfunction
"}}}

function! vimwork#init()
	call vimwork#set_gui()
	call vimwork#map_unite()
	call vimwork#set_necomplete()
	call vimwork#map_neosnip()
	call vimwork#map_cscope()
	call vimwork#set_vimwfiler()
	call vimwork#map_unite_perforce()
	call vimwork#map_tabdiff()
	call vimwork#set_qfixhowm()
	call vimwork#map_misc()
	call vimwork#unite_grep()
	call vimwork#vimshell()
endfunction

" call vimwork#init()

let &cpo = s:save_cpo
unlet s:save_cpo

