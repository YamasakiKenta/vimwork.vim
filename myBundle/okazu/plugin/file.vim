" file ‚É’Ç‰Á

call input("")
 
let action = {
			\ 'is_selectable' : 1, 
			\ 'description' : 'qfix‚É’Ç‰Á',
			\ }

call unite#custom_action('file', 'add qfix', action)
call unite#custom_action('jump_list', 'add qfix', action)

function! action.func(candidates) "{{{
	for candidate in a:candidates

		let word = candidate.word
		let file = candidate.action__path
		let pattern = candidate.action__pattern

		if exists("candidate.action__line")
			let line = candidate.action__line
		else
			exe 'edit' file
			call search(pattern,'')
			let line = line(".")
		endif

		caddexpr file . ":" . line .  ":" . word
	endfor
endfunction "}}}

unlet action

