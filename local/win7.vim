let s:save_cpo = &cpo
set cpo&vim

" memo
" QuickRun -hook/time/enable 1

call vimwork#set_ctags() 
let g:chain_dict = { '__file' : {
			\ 'win7.vim' : '../autoload/vimwork.vim',
			\ 'autoload/vimwork.vim' : '../local/win7.vim',
			\ },
			\ '__pattern': [
			\ { 'before': 'autoload\(/.*\)\?/\(.*\.vim$\)' , 'after': 'plugin/**/\2'}, 
			\ { 'before': 'plugin\(/.*\)\?/\(.*\.vim\)'    , 'after': 'autoload/**/\2'}, 
			\ { 'before': '/coffee/\(.*\)\.coffee$'        , 'after': '/*/\1.js'}, 
			\ { 'before': '/coffee2js/\(.*\)\.js$'         , 'after': '/coffee/\1.coffee'}, 
			\ ],
			\ }

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/.vim/bundle/vimwork.vim/local/win7.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"

let g:neocomplete#enable_at_startup = 1
inoremap jk <esc>

let &cpo = s:save_cpo
unlet s:save_cpo

