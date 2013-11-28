let s:save_cpo = &cpo
set cpo&vim

" fname
let s:fname = substitute(expand("<sfile>"), '\\', '\/', 'g')

" init
set backupdir=~/vimbackup
if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir))
endif

function! s:set() "{{{
	set autoread
	set cursorline
	set dip=filler,icase,iwhite,vertical
	set fdm=marker
	set fo+=ro
	set grepprg=findstr\ /n
	set guioptions-=m
	set guioptions-=T
	set hlsearch
	set ignorecase
	set incsearch
	set laststatus=2
	set lcs=tab:`\ |"
	set list
	set modeline
	set noswapfile
	set nowrap
	set number
	set shiftwidth=4
	set smartcase
	set stl=%{fugitive#statusline()}\ %n\ >\ %{&ff}\ >\ %{&enc}\ >\ %{&fenc}\ >\ %Y\ >\ \ %f\ %q%h%m%r%=%-14.(%l/%L%)
	set tabstop=4
	set tw=0
	set ve=block
endfunction "}}}
function! s:nnoremap() "{{{
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
	nnoremap <leader>fp<CR> :<C-u>let @+ = expand("%:p")\|echo @+<CR>|"
	nnoremap <leader>ft<CR> :<C-u>let @+ = expand("%:t")\|echo @+<CR>|"
	nnoremap <leader>rn<CR> :<C-u>windo set noscrollbind<CR>|"
	nnoremap <leader>ry<CR> :<C-u>windo set scrollbind<CR>|"
	nnoremap [[ [[zz|"
	nnoremap ]] ]]zz|"
endfunction "}}}
function! s:map() "{{{
	map + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>:echo @/<CR>|"
	map * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'\|echo @/<CR>|"
endfunction"}}}
function! s:nmap() "{{{
	nmap <leader>sy<CR> 	<Plug>(edit_syntax_file)
	nmap <leader>uq<CR> 	<Plug>(uniq_line)
	nmap v/ 		<Plug>(select_search)
endfunction"}}}
function! s:vnoremap() "{{{
	vnoremap < <gv|"
	vnoremap > >gv|"
endfunction"}}}

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
function! vimwork#map_misc() "{{{
	call s:set()
	call s:nnoremap()
	call s:map()
	call s:nmap()
	call s:vnoremap()
	"so $VIMRUNTIME/macros/matchit.vim
	"set hidden
endfunction "}}}
function! vimwork#set_ctags() "{{{
	nnoremap <C-\>z :Grep /s <c-r>=expand("<cword>") *.vim *.php *.js<CR>|"
	nnoremap <C-\>K :call system("ctags -R --excmd=number")<CR>|"
endfunction 
"}}}
function! vimwork#set_cscope() "{{{
	set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
	nnoremap <C-\>L :cs kill -1<CR>:call system("cscope -b -R -q")<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>l :cs kill -1<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"
endfunction
"}}}
" plugin
function! vimwork#set_dir(local_path) "{{{
	let path       = substitute(substitute(s:fname, '\\', '\/', 'g'), 'autoload[\\\/].*', '', '')
	let local_path = substitute(a:local_path, '\\', '\/', 'g')
	let g:neosnippet#snippets_directory = join(map([path, local_path], "v:val.'/snippets'"),',')
	let g:vimwork#syntax_directory = path
endfunction "}}}

function! vimwork#init()
	call vimwork#set_gui()
	call vimwork#map_misc()
	call vimwork#set_ctags()
	call vimwork#set_cscope()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

