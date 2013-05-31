let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 Ag  call vimwork#ag#main(<q-args>)

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
