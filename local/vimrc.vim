let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
" QuickRun -hook/time/enable 1
"
"================================================================================ 

function! s:set_plugin() "{{{
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	call vimwork#neobundle#init()

	let path = substitute(expand('~/dropbox/vim/mind'), '\\', '\/', 'g')
	call vimwork#neobundle#mind(path)
endfunction
"}}}

function! s:set_header() "{{{
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
"}}}

function! s:init()  "{{{
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
"}}} 
call s:init()

function! s:set_necomplete() "{{{
	" let g:neocomplete#enable_at_startup = 1
	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
endfunction
"}}}
call s:set_necomplete()

let &cpo = s:save_cpo
unlet s:save_cpo

