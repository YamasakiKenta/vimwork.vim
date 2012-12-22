let s:save_cpo = &cpo
set cpo&vim

let s:Common = vital#of('vimwork.vim').import('Mind/Common')
function! s:get_kk(str) "{{{
	"return substitute(a:str,'^\"?\(.*\)\"?','"\1"','')
	return len(a:str) ? '"'.a:str.'"' : ''
endfunction "}}}

function! common#change_unite() "{{{
" ********************************************************************************
" ファイルの切り替え ( unite ) 
" ********************************************************************************
	let root = substitute(expand("%:h"), '[\\/][^\\/]*$', '', '')
	let file = expand("%:t")
	let type = substitute(expand("%:h"), '.*[\\/]\ze.\{-}[\\/]', '', '')

	echo type
	if type =~ 'unite[\\/]kinds'
		let file = substitute(file, 'k_', '', '')
		exe 'e '.root.'/sources/'.file
	elseif type =~ 'unite[\\/]sources'
		exe 'e '.root.'/kinds/k_'.file
	endif

endfunction "}}}
function! common#map_diff_reset() "{{{
	map <buffer> <A-up> <A-up>
	map <buffer> <A-down> <A-down>
	map <buffer> <A-left> <A-left>
	map <buffer> <A-right> <A-right>
endfunction "}}}
function! common#map_diff_tab() "{{{
	"********************************************************************************
	" タブ切り替え時に処理を追加するため作成した
	"********************************************************************************
	wincmd w
endfunction "}}}
function! common#map_diff() "{{{
	map <buffer> <A-up> [c
	map <buffer> <A-down> ]c
	map <buffer> <A-left>  :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <A-right> :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <tab> :<C-u>call common#map_diff_tab()<CR>|"
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

