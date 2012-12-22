let s:save_cpo = &cpo
set cpo&vim

" todo : enum
" todo : struct

function s:get_struct_member(str) "{{{
	" { 'type' : 'int' , 'name' : 'count' }
endfunction
"}}}
function s:get_enum(str) "{{{
	"{ 'name' : 'ret' , 'num' : 1 }
endfunction
"}}}
"
let &cpo = s:save_cpo
unlet s:save_cpo

