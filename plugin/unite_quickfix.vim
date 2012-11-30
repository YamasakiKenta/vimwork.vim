let s:save_cpo = &cpo
set cpo&vim


let action = {
			\ 'is_selectable' : 1, 
			\ 'description' : 'add qfix[file, jump_list]',
			\ }
call unite#custom_action('file', 'add qfix', action)
call unite#custom_action('jump_list', 'add qfix', action)
function! action.func(candidates) "{{{

	for candidate in a:candidates

		let word = candidate.word
		let file = get(candidate, 'action__path', expand("%"))

		if exists("candidate.action__line")
			let line = candidate.action__line
			caddexpr file . ":" . line .  ":" . word
		else
			setl errorformat+=%f:%s:%m
			let pattern = candidate.action__pattern
			setl errorformat
			call input("")
			caddexpr file . ":" . pattern .  ":" . word
		endif

	endfor
endfunction "}}}
unlet action

let &cpo = s:save_cpo
unlet s:save_cpo

