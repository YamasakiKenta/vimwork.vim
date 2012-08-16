" = tmp = 
 let $VIMTMP         = '~/vimtmp'

" = script =
 let $LOCALWORK   = '~/vim/macwork'   
 let $VIMWORK     = '~/github/vimwork'   
"
" = bundle =
 let $BUNDLE          = '~/vim/bundle'           
 let $NEOBUNDLE       = '~/vim/bundle/neobundle.vim' 
 so $VIMWORK/neobundle.vim

" = command =
 let $DESKTOP         = '~/Desktop'                      
 let $VIMRC           = '~/github/vimwork/vimrc.vim'
 let $PFPATH          = '~/github/unite-perforce.vim'
"
" = MyGrep = 
 let g:myGrepFileType = 'vim'

" = source = 
so $LOCALWORK/vimrc.vim
so $VIMWORK/vimrc.vim

" = rtp =
set rtp+=~/github/plugins

" = perforce =
 set rtp+=/Users/ymknjugg/github/unite-perforce.vim/
 call perforce#init()
