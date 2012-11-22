" = rtp =
set rtp+=~/Dropbox/vim/bundle/neobundle.vim
set rtp+=~/Dropbox/vim/mind/sort-function.vim
set rtp+=~/Dropbox/vim/mind/tab-diff.vim
set rtp+=~/Dropbox/vim/mind/unite-git.vim
set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
set rtp+=~/Dropbox/vim/mind/vimwork.vim
set rtp+=~/Dropbox/vim/mind/yamaken.vim
set rtp+=~/Dropbox/vim/mind/vital.vim

" = vimwork = 
let $LOCALWORK = expand('~/Dropbox/vim/mind/vimwork.vim')	
let $VIMWORK   = expand('~/Dropbox/vim/mind/vimwork.vim')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1
call vimwork#init()

" = neobundle.vim =
call neobundle#rc('~/Dropbox/vim/bundle')
call vimwork_neobundle#init()

" = unite-git.vim = 
let $GITTMP = '~/vimtmp'

" = mapping = 
nnoremap ;dv<CR>  :e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap ;m<CR>   :lcd ~/Dropbox/vim/mind<CR>|"
nnoremap <C-@>    :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>

nnoremap ;up<CR>  :<C-u>Unite settings_var<CR>
nnoremap ;upa<CR> :<C-u>Unite settings_var_all<CR>
nnoremap ;upt<CR> :<C-u>Unite settings_ex<CR>

" = unite-perforce =
let $PFTMP    = '~/vimtmp'
let g:perforce_merge_tool         = 'winmergeu /r'
let g:perforce_merge_default_path = 'C:/Users/yamasaki.mac/Dropbox/vim/'
call perforce#init()

"set fenc=utf-8
"set enc=utf-8
nnoremap ;de<CR> :<C-u>lcd ~/Desktop<CR>|"


function! s:move_unite_tags(str) "{{{
	let str = a:str

	if str =~ '^s:'
		let str = matchstr(str, 's:\zs.*')
	endif

	echo '--'.expand("<sfile>").':'.expand("<slnum>").'--'.str
	exe 'ta' str
endfunction "}}}

" windows 
nnoremap <A-Space> :simalt ~<CR>|" " # Window変更
aug my_vimrc
	au!
	au BufRead *.h setf c
	au GUIEnter * simalt ~x        " # 最大化
aug END
let s:ext = {
			\ 'c' : 'h',
			\ 'h' : 'c',
			\ }

aug local_vimrc
au!
au BufEnter *.snip setf snip
aug END
