let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
"Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
"================================================================================ 
function! s:set_plugin() "{{{
	set rtp+=~/Dropbox/vim/bundle/neobundle.vim
	set rtp+=~/Dropbox/vim/mind/sort-function.vim
	set rtp+=~/Dropbox/vim/mind/chain-file.vim
	set rtp+=~/Dropbox/vim/mind/tab-diff.vim
	set rtp+=~/Dropbox/vim/mind/unite-git.vim
	set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
	set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
	set rtp+=~/Dropbox/vim/mind/unite-setting-ex.vim 
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	set rtp+=~/Dropbox/vim/mind/vital.vim
	set rtp+=~/Dropbox/vim/mind/unite-args.vim


	call neobundle#rc("~/Dropbox/vim/bundle")
	call vimwork#neobundle()
endfunction 
"}}}
function! s:set_vimwork_init() "{{{
	let $LOCALWORK = expand("~/Dropbox/vim/mind/vimwork.vim")
	let $VIMWORK   = expand("~/Dropbox/vim/mind/vimwork.vim")
	let $VIMTMP    = expand("~/vimtmp")

	call vimwork#init()
endfunction
"}}}
function! s:set_header() "{{{
	call s:set_plugin()
	call s:set_vimwork_init()

	let g:chain_dict = { '__file' : {
				\ 'vimrc.vim' : '../autoload/vimwork.vim',
				\ 'autoload/vimwork.vim' : '../local/vimrc.vim',
				\ }}
endfunction
"}}}

call s:set_header()
nnoremap ;de<CR>   :<C-u>lcd ~/Desktop<CR>|"
nnoremap ;dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
nnoremap ;ig<CR>   :<C-u>GetVimFunctionName<CR>|"
nnoremap ;m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
nnoremap <A-Space> :<C-u>simalt ~<CR>|" " WindowïœçX
nnoremap ;dh<CR>   :<C-u>lcd ~/Dropbox/Public<CR>|"

command! MyVitalUpdate call s:my_vital_update()
function! s:my_vital_update() "{{{
	let paths = [
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
				\ '~/Dropbox/vim/mind/unite-perforce.vim',
				\ '~/Dropbox/vim/mind/unite-setting.vim',
				\ '~/Dropbox/vim/mind/unite-setting-ex.vim',
				\ ]

	for path in paths
		exe 'Vitalize' path
	endfor
endfunction
"}}}

command! -nargs=? MyGitUpdate call s:my_git_update(<q-args>) 
function! s:my_git_update(str) "{{{
	" @param[in] a:str commit comment

	let paths = [
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
				\ '~/Dropbox/vim/mind/unite-perforce.vim',
				\ '~/Dropbox/vim/mind/unite-setting.vim',
				\ '~/Dropbox/vim/mind/sort-function.vim',
				\ '~/Dropbox/vim/mind/vimwork.vim',
				\ '~/Dropbox/vim/mind/unite-setting-ex.vim',
				\ '~/Dropbox/vim/mind/unite-args.vim',
				\ ]


	let comment = len(a:str) ? a:str : "auto update"
	echom comment

	for path in paths
		exe 'lcd '.path
		call system('git add -A')
		let cmd = 'git commit -am "'.comment.'"'
		echom cmd
		call system(cmd)
		call system('git push')
	endfor

endfunction
"}}}

command! GetVimFunctionName call s:get_vim_function_name()
function! s:get_vim_function_name() "{{{
	let lnum  = searchpair('^\<function\>', '', '^\<endfunction\>', 'bn')
	let line  = getline(lnum)
	let fname = matchstr(line, '\s\zs.*\ze(')

	echom fname
	let @" = fname
	let @+ = fname

	return fname
endfunction 
"}}}

" .gvimrc
function! GvimrcInit() "{{{
	set gfn=Terminal:h10:cSHIFTJIS
	set guioptions-=Tm
endfunction
"}}}
"
command!  Test call s:test()
function s:test()
	echo expand("<sfile>")
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
