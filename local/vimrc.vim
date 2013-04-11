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
	set rtp+=~/Dropbox/vim/mind/cediter.vim
	" set rtp=+~/Dropbox/vim/mind/vital.vim

	call neobundle#rc('~/Dropbox/vim/bundle')

	if 0
		let s:file_ = expand('~/.vimwork_d')
		call unite_setting_ex#init('g:vimwork_d', s:file_)
		call unite_setting_ex#add('g:vimwork_d' , 'g:test1' , '' , 'bool'    , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test2' , '' , 'list_ex' , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test3' , '' , 'select'  , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test4' , '' , 'var'     , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test5' , '' , 'list'    , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test6' , '' , 'var'     , {'a': 'test' , 'b': 'test'} ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test7' , '' , 'list'    , {'a': 'test' , 'b': 'test'} ) 
		call unite_setting_ex#add('g:vimwork_d' , 'g:test8' , '' , ''        , [[1]         , 'test'       , 'test2'] ) 
		call unite_setting_ex#load('g:vimwork_d')
	endif



	let g:pf_clients_template = [
				\ { 'clname' : 'temp_copy_1', 'cltmp' : 'temp_1', 'ports' : ['mac:1819']},
				\ { 'clname' : 'temp_copy_2', 'cltmp' : 'temp_2', 'ports' : ['mac:1819']},
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
		au GUIEnter * simalt ~x        " # ç≈ëÂâª
	aug END
endfunction
"}}}
function! s:set_hutter() "{{{
	call vimwork#init()
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
nnoremap ;bb<CR>   :<C-u>Unite settings_ex<CR>|"
nnoremap ;de<CR>   :<C-u>lcd ~/Desktop<CR>|"
nnoremap ;dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap ;m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
nnoremap <A-Space> :<C-u>simalt ~<CR>|" " WindowïœçX
nnoremap <C-@>     :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>|"

call s:set_hutter()

let g:test_test1 = 0
let g:test_test2 = 'hello'
let g:test_test3 = [1, 2]
let g:test_test4 = { 'a' : 1 , 'b' : 2 }
let g:test_test5 = 314

" call unite_setting_ex#init2()
" call unite_setting_ex#add2('g:test_test1', 'g:test_test2')

command! MyVitalUpdate call s:my_vital_update()
function! s:my_vital_update()
	let paths = [
				\ '~/Dropbox/vim/mind/cediter.vim',
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
				\ '~/Dropbox/vim/mind/unite-perforce.vim',
				\ '~/Dropbox/vim/mind/unite-setting.vim',
				\ ]

	for path in paths
		exe 'Vitalize' path
	endfor
endfunction

command! MyGitUpdate call s:my_git_update()
function! s:my_git_update()
	
	let paths = [
				\ '~/Dropbox/vim/mind/cediter.vim',
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
				\ '~/Dropbox/vim/mind/unite-perforce.vim',
				\ '~/Dropbox/vim/mind/unite-setting.vim',
				\ '~/Dropbox/vim/mind/sort-function.vim',
				\ ]

	for path in paths
		exe 'lcd '.path
		call system('git add -A')
		call system('git commit -am "auto update"')
		call system('git push')
	endfor
	
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
