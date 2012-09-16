if 0
"if exists('g:loaded_unite')
"@ sub
function! s:add_qfix(candidates) "{{{
	for candidate in a:candidates

		let word = candidate.word
		let file = candidate.action__path
		let pattern = candidate.action__pattern

		if exists("candidate.action__line")
			let line = candidate.action__line
			caddexpr file . ":" . line .  ":" . word
		else
			setl errorformat+=%f:%s:%m
			echo
			echo pattern
			setl errorformat
			call input("")
			caddexpr file . ":" . pattern .  ":" . word
		endif

	endfor
endfunction "}}}

"@ main
let action = {
			\ 'is_selectable' : 1, 
			\ 'description' : 'add qfix',
			\ }
call unite#custom_action('file', 'add qfix', action)
call unite#custom_action('jump_list', 'add qfix', action)
function! action.func(candidates) "{{{
	call s:add_qfix(a:candidates)
endfunction "}}}
unlet action
endif
