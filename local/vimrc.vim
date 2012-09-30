if 0
nnoremap ;de<CR> :<C-u>lcd ~/Desktop<CR>|"

" = rtp = 
set rtp+=~/Dropbox/vim/mind/tab-diff

" = vimwork = 
let $LOCALWORK = expand('~/Dropbox/vim/mind/vimwork')	
let $VIMWORK   = expand('~/Dropbox/vim/mind/vimwork')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1


" = unite-perforce =
set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
let $PFTMP    = '~/vimtmp'
call perforce#init()

let g:perforce_merge_tool         = 'winmergeu /r'
let g:perforce_merge_default_path = 'C:/Users/yamasaki.mac/Dropbox/vim/'
endif

" = rtp =
set rtp+=~/Dropbox/vim/mind/vimwork
set rtp+=~/Dropbox/vim/bundle/neobundle.vim
set rtp+=~/Dropbox/vim/mind/unite-git.vim

" = vimwork = 
let $LOCALWORK = expand('~/Dropbox/vim/mind/vimwork')	
let $VIMWORK   = expand('~/Dropbox/vim/mind/vimwork')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1
call vimwork#init()

" = neobundle.vim =
call neobundle#rc('~/Dropbox/vim/bundle')
call vimwork_neobundle#init()

" = unite-git.vim = 
let $GITTMP = '~/vimtmp'

" = mapping = 
function! s:move_unite_tags(str) "{{{
	let str = a:str

	if str =~ '^s:'
		let str = matchstr(str, 's:\zs.*')
	endif

	echo str
	exe 'ta' str
endfunction "}}}
nnoremap ;dv<CR> :e ~/Dropbox/vim/mind/vimwork/local/vimrc.vim<CR>|"
nnoremap ;m<CR> :lcd ~/Dropbox/vim/mind<CR>|"
nnoremap <C-@> :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>
nnoremap ;up<CR> :<c-u>Unite settings<CR>
