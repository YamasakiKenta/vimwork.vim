let s:save_cpo = &cpo
set cpo&vim

function! vimwork#ag#main(str)
	let cmd = 'ag --nocolor --nogroup '.a:str
	echom cmd
	let @/ = a:str

	cexpr ""
	call s:_end(system(cmd))
endfunction

" async "{{{
function! vimwork#ag#main_async(str)
	let cmd = 'ag --nocolor --nogroup '.a:str
	echom cmd
	let @/ = a:str

	cexpr ""
	call vimwork#async#system(cmd,
				\ function('s:_async'),
				\ function('s:_end'),
				\ )
endfunction

function! s:_async(str)
	" echo 'load...'
	return a:str
	" caddexpr a:str
	" return ''
endfunction
" }}}

function! s:_end(str)
	caddexpr a:str
	cc
endfunction

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
