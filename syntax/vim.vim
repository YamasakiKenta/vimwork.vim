let s:save_cpo = &cpo
set cpo&vim


syn keyword type test
syn match Function /common#\w*/

let &cpo = s:save_cpo
unlet s:save_cpo

