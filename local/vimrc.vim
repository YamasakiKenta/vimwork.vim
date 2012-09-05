"let - $ {{{
let $DESKTOP   = '~/Desktop'
let $BUNDLE    = '~/Dropbox/vim/bundle'
let $NEOBUNDLE = '~/Dropbox/vim/bundle/neobundle.vim'
let $LOCALWORK = '~/Dropbox/vim/local'       " <- �ePC���ɐݒ肷��t�H���_
let $VIMWORK   = '~/Dropbox/vim/mind/vimwork'     " <- ���̃t�@�C�����w�肵�Ă�������
let $VIMTMP    = '~/vimtmp'
"}}}
" let - g: "{{{
let g:atmark_jump_is_unite = 1
"}}}
"map "{{{
nnoremap ;dv<CR> :e ~/Dropbox/vim/mind/vimwork/vimrc.vim<CR>|"
nnoremap ;m<CR> :lcd ~/Dropbox/vim/mind<CR>|"
"}}}
" sourse {{{
so ~/Dropbox/vim/mind/vimwork/neobundle.vim
so ~/Dropbox/vim/mind/vimwork/vimrc.vim
"}}}
"plugin - rtp "{{{
set rtp+=~/Dropbox/vim/mind/rtp/unite-perforce.vim 
call perforce#init()
set rtp+=~/Dropbox/vim/mind/rtp/tab-diff
"}}}

