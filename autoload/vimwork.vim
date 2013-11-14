let s:save_cpo = &cpo
set cpo&vim

let s:fname = substitute(expand("<sfile>"), '\\', '\/', 'g')

function! s:init() "{{{
	if !exists('s:cache_init')
		return
	endif

	let s:cache_init = 1
	set backupdir=~/vimbackup
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir))
	endif
endfunction
"}}}

function! vimwork#set_gui() "{{{
	if !has('gui')
		set ruler           " # カーソルの位置の表示
		set nocompatible    " # vimの機?が使える
		syntax enable       " # 色を付け - 設定がリセッ?され??
		filetype on
		filetype indent on
		filetype plugin on
	endif
endfunction
"}}}

function! s:set() "{{{
	set autoread                                            " # 自動更新
	set cursorline                                          " # カーソル行?強調
	set dip=filler,icase,iwhite,vertical
	set fdm=marker                                          " # 自動的に折りたたみ
	set fo+=ro                                              " # 自動でコメント挿入
	set grepprg=findstr\ /n
	set guioptions-=T                                       " # メニューバ?を削除
	set guioptions-=m                                       " # ??ルバ?を削除
	set hlsearch                                            " # 検索
	set ignorecase                                          " # 検索で大断?小文字を区別しな??
	set incsearch
	set laststatus=2                                        " # ス??タス行?表示
	set lcs=tab:`\                                          " # 記号の表示
	set list
	set modeline                                            " # 読み込み時?設??
	set noswapfile                                          " # SwapFile
	set nowrap                                              " # 折り返し
	set number                                              " # 番号入??
	set shiftwidth=4
	set smartcase
	set stl=%{fugitive#statusline()}\ %n\ >\ %{&ff}\ >\ %{&enc}\ >\ %{&fenc}\ >\ %Y\ >\ \ %{vimwork#pwd()}\ >\ %t\ %q%h%m%r%=%-14.(%l/%L%)
	set tabstop=4                                           " # tabの設??
	set tw=0                                                " # 自動改??OFF
	set ve=block
endfunction "}}}
function! s:nnoremap() "{{{
	" nnoremap j gj|" 
	" nnoremap k gk|"
	nnoremap <S-Space> za|"    
	nnoremap <C-]> <C-]>zz|"    
	nnoremap <C-j> j.|"
	nnoremap <C-k> n.|"
	nnoremap <C-n> :<C-u>cn<CR>|"
	nnoremap <C-p> :<C-u>cN<CR>|"
	nnoremap <C-s> 	 :<C-u>SetNum<CR>|"
	nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|" 
	nnoremap <F1> <ESC>
	nnoremap <c-]> g<c-]>|"
	nnoremap <leader>a<CR>  :<C-u>ChainFile<CR>|"
	nnoremap <leader>fh<CR> :<C-u>let @+ = expand("%:p:h")<CR>|"
	nnoremap <leader>fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"
	nnoremap <leader>ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"
	nnoremap <leader>rn<CR> :<C-u>windo set noscrollbind<CR>|"
	nnoremap <leader>ry<CR> :<C-u>windo set scrollbind<CR>|"
	nnoremap [[ [[zz|"
	nnoremap ]] ]]zz|"
endfunction "}}}
function! s:map() "{{{
	map + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>|"
	map * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'<CR>|"
endfunction"}}}
function! s:let() "{{{
	let g:Align_xstrlen = 3
	let g:mygrepprg = 'findstr'
endfunction "}}}
function! s:nmap() "{{{
	nmap <leader>sy<CR> 	<Plug>(edit_syntax_file)
	nmap <leader>uq<CR> 	<Plug>(uniq_line)
	nmap v/ 		<Plug>(select_search)
endfunction"}}}
function! s:typo() "{{{
	command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endfunction"}}}
function! s:vnoremap() "{{{
	vnoremap < <gv|"
	vnoremap > >gv|"
endfunction"}}}
function! vimwork#map_misc() "{{{
	call s:init()
	call s:set()
	call s:nnoremap()
	call s:map()
	call s:let()
	call s:nmap()
	call s:typo()
	call s:vnoremap()
	so $VIMRUNTIME/macros/matchit.vim
	"set hidden
endfunction "}}}
function! vimwork#set_qfixgrep(...) "{{{
	let QFix_CloseOnJump = 1
endfunction
"}}}
function! vimwork#map_unite_perforce(...) "{{{
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
endfunction
"}}}
function! vimwork#map_grep() "{{{
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
function! vimwork#map_tabdiff(...) "{{{
	nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
	nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
	nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
endfunction
"}}}
function! vimwork#map_unite() "{{{
	let g:unite_enable_start_insert        = 0
	let g:unite_source_history_yank_enable = 1
	let g:unite_source_rec_max_cache_files = 100

	nnoremap <leader>ur<CR>  :<C-u>UniteResume<CR>|"
	nnoremap <leader>uR<CR>  :<C-u>Unite resume<CR>|"

	" nnoremap <leader>uK<CR>  :<C-u>Unite bookmark<CR>|"
	" nnoremap <leader>uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
	" nnoremap <leader>uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
	" nnoremap <leader>ub<CR>  :<C-u>Unite buffer<CR>|"
	nnoremap <leader>ubt<CR> :<C-u>Unite buffer_tags<CR>|"
	nnoremap <leader>ue<CR>  :<C-u>Unite outline<CR>|"
	nnoremap <leader>uf<CR>  :<C-u>Unite file_rec -input=<C-r>=substitute(getcwd(), "\\", "\/", 'g').'/**/'<CR><CR>|"
	nnoremap <leader>ug<CR>  :<C-u>Unite -buffer-name=grep grep<CR>|"
	nnoremap <leader>uG<CR>  :<C-u>UniteResume grep<CR>|"
	nnoremap <leader>uh<CR>  :<C-u>Unite history/yank<CR>|"
	nnoremap <leader>uj<CR>  :<C-u>Unite jump<CR>|"
	nnoremap <leader>ul<CR>  :<C-u>Unite line/fast<CR>|"
	nnoremap <leader>um<CR>  :<C-u>Unite file_mru<CR>|"
	nnoremap <leader>uom<CR> :<C-u>Unite output:message<CR>|"
	nnoremap <leader>upt<CR> :<C-u>Unite settings/ex<CR>|"
	nnoremap <leader>us<CR>  :<C-u>Unite source<CR>|"
	nnoremap <leader>ut<CR>  :<C-u>Unite tag<CR>|"
	nnoremap <leader>qf<CR>  :<C-u>Unite quickfix quickfix:1 quickfix:2 quickfix:3 quickfix:4<CR>|"

	nnoremap <leader>up<CR>  :<C-u>Unite settings_var<CR>|"
	nnoremap <leader>upa<CR> :<C-u>Unite settings_var_all<CR>|"

endfunction
"}}}
function! vimwork#set_vimfiler(...) "{{{
	let g:vimfiler_as_default_explorer  = 1  " # 初期filer
	let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
endfunction
"}}}
function! vimwork#set_necomplete(...) "{{{
endfunction
"}}}
function! vimwork#map_neosnip() "{{{
endfunction
"}}}

function! vimwork#pwd() 
	return substitute(pathshorten(getcwd()),"\\\\","\\/","g")
endfunction

function! vimwork#unite_grep() "{{{
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
endfunction
"}}}
function! vimwork#set_dir(local_path) "{{{
	let path       = substitute(substitute(s:fname, '\\', '\/', 'g'), 'autoload[\\\/].*', '', '')
	let local_path = substitute(a:local_path, '\\', '\/', 'g')
	let g:neosnippet#snippets_directory = join(map([path, local_path], "v:val.'/snippets'"),',')
endfunction "}}}
function! vimwork#set_unite(...)
	" call vimwork#unite_grep()
	call vimwork#map_unite()
endfunction

function! vimwork#init()
	call vimwork#set_gui()
	call vimwork#map_grep()
	call vimwork#map_misc()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

