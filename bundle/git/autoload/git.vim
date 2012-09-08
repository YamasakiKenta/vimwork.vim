function! git#cmds(cmd, head, ...) "{{{
	let cmd = "git a:head a:cmd ".join(a:000)
	let lines = split(system(cmd), "\n")
	return lines
endfunction "}}}

