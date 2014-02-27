let s:save_cpo = &cpo
set cpo&vim

" memo
" QuickRun -hook/time/enable 1

call vimwork#set_ctags() 

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/.vim/bundle/vimwork.vim/local/win7.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"

inoremap jk <esc>

" idea 
" <tab>で色々できるようにする
" - emmet
" - タグ移動
" - 検索
"  > 作業Windowを表示する
"
let &cpo = s:save_cpo
unlet s:save_cpo

