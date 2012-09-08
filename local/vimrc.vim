nnoremap ;m<CR> :lcd ~/Dropbox/vim/mind<CR>|"
nnoremap ;dv<CR> :e ~/Dropbox/vim/mind/vimwork/local/vimrc.vim<CR>
nnoremap ;de<CR> :<C-u>lcd '~/Desktop'

" = rtp = 
set rtp+=~/Dropbox/vim/mind/tab-diff

" = neobundle.vim =
set rtp+=~/Dropbox/vim/bundle/neobundle.vim
call neobundle#rc('~/Dropbox/vim/bundle')

" = vimwork = 
set rtp+=~/Dropbox/vim/mind/vimwork
let $LOCALWORK = expand('~/Dropbox/vim/mind/vimwork')	
let $VIMWORK   = expand('~/Dropbox/vim/mind/vimwork')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1
call vimwork_neobundle#init()
call vimwork#init()

" = unite-perforce =
set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
let $PFTMP    = '~/vimtmp'
call perforce#init()

