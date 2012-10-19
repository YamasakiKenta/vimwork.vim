if 0

" = rtp = 

" = vimwork = 
let $LOCALWORK = expand('~/Dropbox/vim/mind/vimwork')	
let $VIMWORK   = expand('~/Dropbox/vim/mind/vimwork')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1


endif

" = rtp =
set rtp+=~/Dropbox/vim/bundle/neobundle.vim
set rtp+=~/Dropbox/vim/mind/sort-function.vim
set rtp+=~/Dropbox/vim/mind/tab-diff
set rtp+=~/Dropbox/vim/mind/unite-git.vim
set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
set rtp+=~/Dropbox/vim/mind/vimwork

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
nnoremap ;up<CR> :<c-u>Unite settings:g\:unite_data<CR>
nnoremap ;up<CR> :<c-u>Unite -input=test settings_var<CR>

" = unite-perforce =
let $PFTMP    = '~/vimtmp'
let g:perforce_merge_tool         = 'winmergeu /r'
let g:perforce_merge_default_path = 'C:/Users/yamasaki.mac/Dropbox/vim/'
call perforce#init()

"set fenc=utf-8
"set enc=utf-8
nnoremap ;de<CR> :<C-u>lcd ~/Desktop<CR>|"

"let g:unite_source_grep_command = 'findstr'
"let g:unite_source_grep_default_opts = '/N'
let g:unite_source_grep_recursive_opt = '-r'

"
