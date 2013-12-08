let s:save_cpo = &cpo
set cpo&vim

" QuickRun -hook/time/enable 1
"
call vimwork#set_ctags()
call vimwork#set_cscope()

let g:chain_dict = { '__file' : {
			\ 'vimrc.vim' : '../autoload/vimwork.vim',
			\ 'autoload/vimwork.vim' : '../local/vimrc.vim',
			\ },
			\ '__pattern' : [
			\ { 'before' : 'autoload\(/.*\)\?/\(.*\.vim$\)' , 'after' : 'plugin/**/\2'},
			\ { 'before' : 'plugin\(/.*\)\?/\(.*\.vim\)'   , 'after' : 'autoload/**/\2'},
			\ ],
			\ }

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"

let &cpo = s:save_cpo
unlet s:save_cpo

