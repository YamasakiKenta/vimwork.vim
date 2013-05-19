let s:save_cpo = &cpo
set cpo&vim


syn match type /\*.*\*/
syn match Function /<.*>/
syn match Function /\w*()/

let &cpo = s:save_cpo
unlet s:save_cpo

