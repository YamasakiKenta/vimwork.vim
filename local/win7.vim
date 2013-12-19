let s:save_cpo = &cpo
set cpo&vim

" QuickRun -hook/time/enable 1
"
call vimwork#set_ctags()
call vimwork#set_cscope()

let g:chain_dict = { '__file' : {
			\ 'win7.vim' : '../autoload/vimwork.vim',
			\ 'autoload/vimwork.vim' : '../local/win7.vim',
			\ },
			\ '__pattern': [
			\ { 'before': 'autoload\(/.*\)\?/\(.*\.vim$\)', 'after': 'plugin/**/\2'},
			\ { 'before': 'plugin\(/.*\)\?/\(.*\.vim\)',    'after': 'autoload/**/\2'},
			\ { 'before': '/cf/\(.*\)\.coffee$',            'after': '/*js/\1.js'},
			\ { 'before': '/[^/]*js/\(.*\)\.js$', 'after': '/cf/\1.coffee'},
			\ ],
			\ }

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/.vim/bundle/vimwork.vim/local/win7.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"


cd ~

let &cpo = s:save_cpo
unlet s:save_cpo

