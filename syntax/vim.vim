let s:save_cpo = &cpo
set cpo&vim

syn keyword type PP

let &cpo = s:save_cpo
unlet s:save_cpo

