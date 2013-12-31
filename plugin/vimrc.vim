let s:save_cpo = &cpo
set cpo&vim

so $VIMRUNTIME/macros/matchit.vim

" set {{{
set backupdir=~/.vim/bak
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
set lcs=tab:\|\ |"
set list
set modeline
set noswapfile
set nowrap
set number
set shiftwidth=4
set smartcase
set stl=%{fugitive#statusline()}\ %n\ >\ %{&ff}\ >\ %{&enc}\ >\ %{&fenc}\ >\ %Y\ >\ \ %f\ %h%m%r%=%-14.(%l/%L%)
set tabstop=4
set tw=0
set ve=block
set ff=unix
set fenc=utf-8
" }}}
" map {{{
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
map + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>:echo @/<CR>|"
map * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'\|echo @/<CR>|"
nmap <leader>sy<CR> 	<Plug>(edit_syntax_file)
nmap <leader>uq<CR> 	<Plug>(uniq_line)
nmap v/ 		<Plug>(select_search)
vnoremap < <gv|"
vnoremap > >gv|"
" }}}
" dir "{{{
" let s:dir = simplify(substitute(expand("<sfile>"), '\\', '\/', 'g').'/../..')
let s:dir = substitute(expand("<sfile>"), '\\', '\/', 'g')
let s:dir = substitute(s:dir, '/plugin/vimrc.vim$', '', '')
let g:neosnippet#snippets_directory = s:dir.'/snippets'
let g:vimwork#syntax_directory = s:dir
let g:load_doxygen_syntax = 1
let g:ref_phpmanual_path = '~/lnk/ref/php-chunked-xhtml'
exe 'set dict+='.s:dir.'/dict'
" }}}

if !isdirectory(expand(&backupdir))
	call mkdir(expand(&backupdir))
endif

if has('gui')
	set ruler      
	set nocompatible
	syntax enable 
	filetype on
	filetype indent on
	filetype plugin on
	nnoremap <A-Space> :<C-u>simalt ~<CR>|" 
endif

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
