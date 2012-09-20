function! git#cmds(cmd, ...) "{{{
	let head = ''
	let hip = ''

	if a:0 == 1
		let head = a:1
	endif

	if a:0 > 1
		let hip = join(a[2:])
	endif

	let cmd = "git ".head."".a:cmd."".hip
	let lines = split(system(cmd), "\n")
	return lines
endfunction "}}}
