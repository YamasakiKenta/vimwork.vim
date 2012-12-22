let s:save_cpo = &cpo
set cpo&vim

" = rtp =
"set rtp+=~/vimfiler-ver.3.1
set rtp+=~/Dropbox/vim/bundle/neobundle.vim
set rtp+=~/Dropbox/vim/mind/vital.vim
set rtp+=~/Dropbox/vim/mind/sort-function.vim
set rtp+=~/Dropbox/vim/mind/tab-diff.vim
set rtp+=~/Dropbox/vim/mind/unite-git.vim
set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
set rtp+=~/Dropbox/vim/mind/vimwork.vim
set rtp+=~/Dropbox/vim/mind/chain-file.vim

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
nnoremap <A-Space> :simalt ~<CR>|" " Window変更
nnoremap ;de<CR> :<C-u>lcd ~/Desktop<CR>|"
nnoremap ;bp<CR> :<C-u>call unite#start([['settings_ex', 'g:vimwork_d']])<CR>|"

let s:file_ = '~/vimtmp/.vimwork_d'
call unite_setting_ex#init('g:vimwork_d', s:file_)
call unite_setting_ex#add('g:vimwork_d', 'g:test1', '', 'select', [[1], 'test', 'test2'])
call unite_setting_ex#add('g:vimwork_d', 'g:test2', '', 'select', [[1], 'test', 'test2'])
call unite_setting_ex#load('g:vimwork_d', s:file_)

" = unite-perforce =
let $PFTMP    = '~/vimtmp'
let g:perforce_merge_tool         = 'winmergeu /r'
let g:perforce_merge_default_path = 'C:/Users/yamasaki.mac/Dropbox/vim/'
call perforce#init()


"set fenc=utf-8
"set enc=utf-8


function! s:move_unite_tags(str) "{{{
	let str = a:str

	if str =~ '^s:'
		let str = matchstr(str, 's:\zs.*')
	endif

	echo str
	exe 'ta' str
endfunction "}}}

" windows 
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
"Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
"
let g:pf_clients_template = [
			\ { 'clname' : 'yama_tmp_2' , 'cltmp' : 'temp_1' , 'ports' : ['localhost:1818']}
			\ ]
"
let &cpo = s:save_cpo
unlet s:save_cpo

