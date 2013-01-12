let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
"Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
"================================================================================ 

function! s:set_header() "{{{
	set rtp+=~/Dropbox/vim/mind/sort-function.vim
	set rtp+=~/Dropbox/vim/bundle/neobundle.vim
	set rtp+=~/Dropbox/vim/mind/chain-file.vim
	set rtp+=~/Dropbox/vim/mind/tab-diff.vim
	set rtp+=~/Dropbox/vim/mind/unite-git.vim
	set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
	set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	set rtp+=~/Dropbox/vim/mind/vital.vim

	call neobundle#rc('~/Dropbox/vim/bundle')

	let s:file_ = expand('~/.vimwork_d')
	call unite_setting_ex#init('g:vimwork_d', s:file_)
	call unite_setting_ex#add('g:vimwork_d', 'g:test1', '', 'select', [[1], 'test', 'test2'])
	call unite_setting_ex#add('g:vimwork_d', 'g:test2', '', 'select', [[1], 'test', 'test2'])
	call unite_setting_ex#load('g:vimwork_d', s:file_)

	let g:pf_clients_template = [
				\ { 'clname' : 'yama_tmp_2' , 'cltmp' : 'temp_1' , 'ports' : ['localhost:1818']}
				\ ]
	let s:ext = {
				\ 'c' : 'h',
				\ 'h' : 'c',
				\ }

	aug local_vimrc
		au!
		au BufEnter *.snip setf snip
	aug END

	aug my_vimrc
		au!
		au BufRead *.h setf c
		au GUIEnter * simalt ~x        " # 最大化
	aug END
endfunction
"}}}
function! s:set_hutter() "{{{
	call vimwork#init()
	call perforce#init()
let g:chain_files = {
			\ 'vimrc.vim' : '../autoload/vimwork.vim',
			\ 'autoload/vimwork.vim' : '../local/vimrc.vim',
			\ }
endfunction
"}}}

call s:set_header()

call vimwork_neobundle#init()
let $GITTMP                       = expand('~/vimtmp')
let $LOCALWORK                    = expand('~/Dropbox/vim/mind/vimwork.vim')
let $PFTMP                        = expand('~/vimtmp')
let $VIMTMP                       = expand('~/vimtmp')
let $VIMWORK                      = expand('~/Dropbox/vim/mind/vimwork.vim')
let g:atmark_jump_is_unite        = 1
let g:perforce_merge_default_path = expand('~/Dropbox/vim/')
let g:perforce_merge_tool         = 'winmergeu /r'
nnoremap ;bp<CR>   :<C-u>call unite#start([['settings_ex', 'g:vimwork_d']])<CR>|"
nnoremap ;de<CR>   :<C-u>lcd ~/Desktop<CR>|"
nnoremap ;dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap ;m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
nnoremap <A-Space> :<C-u>simalt ~<CR>|" " Window変更
nnoremap <C-@>     :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>|"

call s:set_hutter()

let &cpo = s:save_cpo
unlet s:save_cpo

