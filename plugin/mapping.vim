nnoremap <PLUG>(set_number)
			\ :<C-u>call <SID>set_num()<CR>

nnoremap <PLUG>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <PLUG>(select_search)
			\ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a

nnoremap <PLUG>(open_syntax_file)
	exe 'e '.$LOCALWORK.'/syntax/'.&filetype.'.vim'

