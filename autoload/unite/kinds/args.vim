let s:save_cpo = &cpo
set cpo&vim

function! unite#kinds#args#define()
	return s:kind
endfunction

let s:kind = {
			\ 'name' : 'args',
			\ 'parents' : ['file'],
			\ 'default_action': 'open',
			\ 'action_table' : {},
			\ }
let s:kind.action_table.delete = {
			\ 'is_selectable' : 1,
			\ 'is_quit' : 0,
			\ }
function s:kind.action_table.delete.func(candidates)
	for candidate in a:candidates
		silent! exe 'argd '.candidate.action__path
	endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
