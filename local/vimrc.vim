let s:save_cpo = &cpo
set cpo&vim

" MEMO "{{{
" QuickRun -hook/time/enable 1
" }}}

set rtp+=~/Dropbox/vim/mind/vimwork.vim
call vimwork#neobundle#init()

let path = substitute(expand('~/dropbox/vim/mind'), '\\', '\/', 'g')
call vimwork#neobundle#mind(path)

call vimwork#main()

call vimwork#set_gui()
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

function! s:set_necomplete() 
	" let g:neocomplete#enable_at_startup = 1
	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
endfunction
call s:set_necomplete()

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"
nnoremap <leader>m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
" let g:neosnippet#snippets_directory = s:fname.'/snippets'


let &cpo = s:save_cpo
unlet s:save_cpo

