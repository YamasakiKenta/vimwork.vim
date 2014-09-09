let s:save_cpo = &cpo
set cpo&vim

" MEMO 
" set grepprg=findstr\ /n
" set grepprg=grep\ -inH

so $VIMRUNTIME/macros/matchit.vim

" set 
set noshellslash
set autoread
set cursorline
set dip=filler,icase,iwhite,vertical
set fdm=marker
set fo+=ro
set grepprg=ag\ --nogroup\ --nocolor\ --column\ --smart-case
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set list
set modeline
set noswapfile
set nowrap
set number
set shiftwidth=4
set smartcase
set expandtab
set tabstop=4
set tw=0
set ve=block
set list lcs=tab:`\ 

" map 
nnoremap <leader>v :<C-u>noa vim /<C-r><C-w>/ **/*<left><left><left><left><left><left><left>|"
nnoremap <C-/>v :<C-u>noa vim /<C-r><C-w>/ **/*<left><left><left><left><left><left><left>|"
nnoremap <leader>/ :<C-u>Unite line<CR>|"
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
highlight CursorIM guibg=Magenta guifg=NONE
nnoremap <f5> :<c-u>MyUpdateTimer<cr>
nnoremap <leader>ufd :<C-u>Unite file:~/.vim/bundle/vimwork.vim/dict

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif

