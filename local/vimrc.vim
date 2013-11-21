let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
" Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
" QuickRun -hook/time/enable 1
"
"================================================================================ 

function! s:set_plugin() 
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	call vimwork#neobundle#init()

	let path = substitute(expand('~/dropbox/vim/mind'), '\\', '\/', 'g')
	call vimwork#neobundle#mind(path)
endfunction

function! s:set_header()
	call s:set_plugin()
	call vimwork#init()
	call vimwork#set_dir(expand('~/Dropbox/vim/mind/vimwork.vim'))

	let g:chain_dict = { '__file' : {
				\ 'vimrc.vim' : '../autoload/vimwork.vim',
				\ 'autoload/vimwork.vim' : '../local/vimrc.vim',
				\ },
				\ '__pattern' : [
				\ { 'before' : 'autoload\(/.*\)\?/\(.*\.vim$\)' , 'after' : 'plugin/**/\2'},
				\ { 'before' : 'plugin\(/.*\)\?/\(.*\.vim\)'   , 'after' : 'autoload/**/\2'},
				\ ],
				\ }
endfunction

function! s:init() 
	call s:set_header()
	nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"
	nnoremap <leader>dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
	nnoremap <leader>ig<CR>   :<C-u>GetVimFunctionName<CR>|"
	nnoremap <leader>m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
	nnoremap <A-Space> :<C-u>simalt ~<CR>|" " Window変更
	set dict+=~/Dropbox/vim/mind/vimwork.vim/dict
	set ff=unix
	set fenc=utf-8

	let g:load_doxygen_syntax = 1
	let g:ref_phpmanual_path = 'C:/Users/kenta/lnk/ref/php-chunked-xhtml'
	set backupdir=~/vimbackup
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir))
	endif
endfunction 

command! -nargs=? MyGitUpdate call s:my_git_update(<q-args>) 
function! s:my_git_update(str) "{{{
	let comment = len(a:str) ? a:str : "auto update"
	echom comment

	let paths = split(glob("~/Dropbox/vim/mind/*"), "\n")
	let paths = filter(paths, "v:val !~ 'vital\\|tags'")

	for path in paths
		exe 'lcd '.path
		call system('git add -A')
		let cmd = 'git commit -am "'.comment.'"'
		echom getcwd()
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

	" echom fname
	let @" = fname
	" let @+ = fname

	return fname
endfunction 
"}}}

command! ChangeRoot call s:change_root()
function! s:change_root() "{{{
	let root = expand("%:h")
	let datas = {
				\ '.*\ze/plugin',
				\ '.*\ze/autoload',
				\ }

	for data in datas
		if root =~ data
			let next_root = matchstr(root, data)
			if isdirectory(next_root)
				exe 'cd' next_root
			endif
		endif
	endfor

endfunction "}}}

" NOT YET
function! s:set_necomplete() "{{{
	call s:init()
	" let g:neocomplete#enable_at_startup = 1

	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
	imap <C-s>     <Plug>(neocomplete_start_unite_complete)

endfunction
"}}}
"
call s:set_necomplete()
"call s:shougo()
"
call s:init()

let &cpo = s:save_cpo
unlet s:save_cpo

