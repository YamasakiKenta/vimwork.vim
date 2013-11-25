let s:save_cpo = &cpo
set cpo&vim

nnoremap <PLUG>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <PLUG>(select_search)
			\ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a

nnoremap <PLUG>(edit_syntax_file)
			\ :exe 'e '.g:vimwork#syntax_directory.'/syntax/'.&filetype.'.vim'<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

