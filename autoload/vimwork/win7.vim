let s:save_cpo = &cpo
set cpo&vim

function! vimwork#win7#init()
endfunction

call vimwork#set_ctags() 

" 環境で変更する
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"

let &cpo = s:save_cpo
unlet s:save_cpo

