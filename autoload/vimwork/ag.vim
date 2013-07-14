let s:save_cpo = &cpo
set cpo&vim

function! vimwork#ag#main(str)
	let cmd = 'ag --nocolor --nogroup '.a:str
	echom cmd
	let outs = split(system(cmd), "\n")
	let @/ = a:str
	cexpr outs
	cc
endfunction

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
