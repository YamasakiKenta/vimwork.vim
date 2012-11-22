
set makeprg=xcodebuild
let s:ext = {
			\ 'c' : 'h',
			\ 'h' : 'c',
			\ }

aug my_vimrc
	au!
	aut BufRead *.h setf objc
aug END

" = rtp =
set rtp+=~/vim/bundle/neobundle.vim
set rtp+=~/vim/mind/sort-function.vim
set rtp+=~/vim/mind/tab-diff.vim
set rtp+=~/vim/mind/unite-git.vim
set rtp+=~/vim/mind/unite-perforce.vim 
set rtp+=~/vim/mind/unite-setting.vim 
set rtp+=~/vim/mind/vimwork.vim

" = vimwork = 
let $LOCALWORK = expand('~/vim/mind/vimwork.vim')	
let $VIMWORK   = expand('~/vim/mind/vimwork.vim')
let $VIMTMP    = expand('~/vimtmp')
let g:atmark_jump_is_unite = 1
call vimwork#init()

" = neobundle.vim =
call neobundle#rc('~/vim/bundle')
call vimwork_neobundle#init()

" = unite-git.vim = 
let $GITTMP = '~/vimtmp'

" = mapping = 
nnoremap ;dv<CR>  :e ~/vim/mind/vimwork.vim/local/vimrc_mac.vim<CR>|"
nnoremap ;m<CR>   :lcd ~/vim/mind<CR>|"
nnoremap <C-@>    :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>
nnoremap ;up<CR>  :<c-u>Unite settings_var<CR>
nnoremap ;upa<CR> :<c-u>Unite settings_var_all<CR>

" = unite-perforce =
let $PFTMP    = '~/vimtmp'
let g:perforce_merge_tool         = 'winmergeu /r'
let g:perforce_merge_default_path = 'C:/Users/yamasaki.mac/vim/'
call perforce#init()

"set fenc=utf-8
"set enc=utf-8
nnoremap ;de<CR> :<C-u>lcd ~/Desktop<CR>|"

"let g:unite_source_grep_command = 'findstr'
"let g:unite_source_grep_default_opts = '/N'
let g:unite_source_grep_recursive_opt = '-r'

function! s:move_unite_tags(str) "{{{
	let str = a:str

	if str =~ '^s:'
		let str = matchstr(str, 's:\zs.*')
	endif

	echo '--'.expand("<sfile>").':'.expand("<slnum>").'--'.str
	exe 'ta' str
endfunction "}}}
