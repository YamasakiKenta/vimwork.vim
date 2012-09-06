let $LOCALWORK = '~/vimtmp'       				  " <- 各PC毎に設定するフォルダ
let $VIMWORK   = '~/Dropbox/vim/mind/vimwork'     " <- このファイルを指定してください

let g:atmark_jump_is_unite = 1

nnoremap ;m<CR> :lcd ~/Dropbox/vim/mind<CR>|"
nnoremap ;dv<CR> :e ~/Dropbox/vim/mind/vimwork/vimrc.vim<CR>|"
nnoremap ;de<CR> :<C-u>lcd '~/Desktop'

so ~/Dropbox/vim/mind/vimwork/neobundle.vim

set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
set rtp+=~/Dropbox/vim/mind/tab-diff
set rtp+=~/Dropbox/vim/mind/vimwork
set rtp+=~/Dropbox/vim/bundle/neobundle.vim

call neobundle#rc('~/Dropbox/vim/bundle')

call vimrc#init()
call perforce#init()
call myneobundle#init()
