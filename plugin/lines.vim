"=============================================================================
" FILE: multiline.vim
" AUTHOR:  Yamasaki Kenta
" Creation Date: 2014/04/27 23:52:39
" Last Modified: 
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim

aug vimwork_vimrc
    au!
    au BufRead,BufNewFile *.pc set filetype=c
    au BufWrite * call vimwork#command#update_time(['call cursor(6,0)'])
    au BufEnter * syn sync fromstart
aug END

set backupdir=~/.vim/bak
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir))
endif

" dir 
let s:dir = substitute(substitute(expand("<sfile>"), '\\', '\/', 'g'), '/plugin/.*$', '', '')
let g:neosnippet#snippets_directory = s:dir.'/snippets'
let g:vimwork#syntax_directory = s:dir
let g:load_doxygen_syntax = 1
let g:did_install_default_menus = 1
exe 'set dict+='.s:dir.'/dict/*'

if has('persistent_undo')
    set undodir=~/.vim/undo
    set noudf
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir))
    endif
endif 

if has('win32') && !has('gui')
    set enc=sjis
    set fenc=utf-8
else
    set enc=utf-8
    set fenc=utf-8
endif

nnoremap <PLUG>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <PLUG>(select_search)
			\ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a

nnoremap <PLUG>(edit_syntax_file)
			\ :exe 'e '.g:vimwork#syntax_directory.'/syntax/'.&filetype.'.vim'<CR>


if exists('s:save_cpo')
    let &cpo = s:save_cpo
    unlet s:save_cpo
endif
