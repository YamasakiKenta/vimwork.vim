let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
" Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
" QuickRun -hook/time/enable 1
"
"================================================================================ 
function! s:set_plugin() "{{{

	set rtp+=~/Dropbox/vim/bundle/neobundle.vim
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	" set rtp+=~/Dropbox/vim/mind/vital.vim
	" set rtp+=~/Dropbox/vim/mind/tree.vim
	" set rtp+=~/Dropbox/vim/mind/sort-function.vim
	" set rtp+=~/Dropbox/vim/mind/chain-file.vim
	" set rtp+=~/Dropbox/vim/mind/tab-diff.vim
	" set rtp+=~/Dropbox/vim/mind/unite-perforce.vim 
	" set rtp+=~/Dropbox/vim/mind/unite-setting.vim 
	" set rtp+=~/Dropbox/vim/mind/unite-setting-ex.vim 

	call neobundle#rc("~/Dropbox/vim/bundle")
	call vimwork#neobundle()
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
function! s:map() "{{{
	nmap ;a<CR>   ,a<CR>|"
	nmap ;cl<CR>  ,cl<CR>|"
	nmap ;cr<CR>  ,cr<CR>|"
	nmap ;de<CR>  ,de<CR>|"
	nmap ;dn<CR>  ,dn<CR>|"
	nmap ;do<CR>  ,do<CR>|"
	nmap ;dv<CR>  ,dv<CR>|"
	nmap ;dy<CR>  ,dy<CR>|"
	nmap ;es<CR>  ,es<CR>|"
	nmap ;ff<CR>  ,ff<CR>|"
	nmap ;fp<CR>  ,fp<CR>|"
	nmap ;ft<CR>  ,ft<CR>|"
	nmap ;id<CR>  ,id<CR>|"
	nmap ;ig<CR>  ,ig<CR>|"
	nmap ;m<CR>   ,m<CR>|"
	nmap ;pC<CR>  ,pC<CR>|"
	nmap ;pE<CR>  ,pE<CR>|"
	nmap ;pF<CR>  ,pF<CR>|"
	nmap ;pa<CR>  ,pa<CR>|"
	nmap ;pan<CR> ,pan<CR>|"
	nmap ;pc<CR>  ,pc<CR>|"
	nmap ;pd<CR>  ,pd<CR>|"
	nmap ;pda<CR> ,pda<CR>|"
	nmap ;pe<CR>  ,pe<CR>|"
	nmap ;pf<CR>  ,pf<CR>|"
	nmap ;ph<CR>  ,ph<CR>|"
	nmap ;pi<CR>  ,pi<CR>|"
	nmap ;pj<CR>  ,pj<CR>|"
	nmap ;pl<CR>  ,pl<CR>|"
	nmap ;po<CR>  ,po<CR>|"
	nmap ;pp<CR>  ,pp<CR>|"
	nmap ;pr<CR>  ,pr<CR>|"
	nmap ;ps<CR>  ,ps<CR>|"
	nmap ;pt<CR>  ,pt<CR>|"
	nmap ;pte<CR> ,pte<CR>|"
	nmap ;rn<CR>  ,rn<CR>|"
	nmap ;ry<CR>  ,ry<CR>|"
	nmap ;sy<CR>  ,sy<CR>|"
	nmap ;uG<CR>  ,uG<CR>|"
	nmap ;uR<CR>  ,uR<CR>|"
	nmap ;ubt<CR> ,ubt<CR>|"
	nmap ;ue<CR>  ,ue<CR>|"
	nmap ;uf<CR>  ,uf<CR>|"
	nmap ;ug<CR>  ,ug<CR>|"
	nmap ;uh<CR>  ,uh<CR>|"
	nmap ;uj<CR>  ,uj<CR>|"
	nmap ;ul<CR>  ,ul<CR>|"
	nmap ;um<CR>  ,um<CR>|"
	nmap ;uom<CR> ,uom<CR>|"
	nmap ;up<CR>  ,up<CR>|"
	nmap ;upa<CR> ,upa<CR>|"
	nmap ;upt<CR> ,upt<CR>|"
	nmap ;uq<CR>  ,uq<CR>|"
	nmap ;ur<CR>  ,ur<CR>|"
	nmap ;us<CR>  ,us<CR>|"
	nmap ;ut<CR>  ,ut<CR>|"
	nmap ;wd<CR>  ,wd<CR>|"
endfunction "}}}
function s:init() "{{{
	call s:set_header()
	nnoremap ,de<CR>   :<C-u>lcd ~/Desktop<CR>|"
	nnoremap ,dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
	nnoremap ,ig<CR>   :<C-u>GetVimFunctionName<CR>|"
	nnoremap ,m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
	nnoremap <A-Space> :<C-u>simalt ~<CR>|" " Window変更
	" call s:map()
	set ff=unix
	set fenc=utf-8

	let g:load_doxygen_syntax = 1
	let g:ref_phpmanual_path = 'C:/Users/kenta/lnk/ref/php-chunked-xhtml'
	set backupdir=~/vimbackup
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir))
	endif
endfunction "}}}
call s:init()
command! MyVitalUpdate call s:my_vital_update()
function! s:my_vital_update() "{{{
	let paths = [
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
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
				\ '~/Dropbox/vim/bundle/chain-file.vim',
				\ '~/Dropbox/vim/bundle/sort-function.vim',
				\ '~/Dropbox/vim/bundle/tab-diff.vim',
				\ '~/Dropbox/vim/bundle/tree.vim',
				\ '~/Dropbox/vim/bundle/unite-args.vim',
				\ '~/Dropbox/vim/bundle/unite-perforce.vim',
				\ '~/Dropbox/vim/bundle/unite-setting-ex.vim',
				\ '~/Dropbox/vim/bundle/unite-setting.vim',
				\ '~/Dropbox/vim/mind/vimwork.vim',
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
	" let @+ = fname

	return fname
endfunction 
"}}}

function! GvimrcInit() "{{{
	set gfn=Terminal:h10:cSHIFTJIS
	set guioptions-=Tm
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

