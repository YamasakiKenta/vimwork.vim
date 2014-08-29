let s:save_cpo = &cpo
set cpo&vim

let s:files = {}
let s:cache_file = {}
function! s:get_fnames(lines)
		let line = join(a:lines,'')
		let rn = '\ze\(href\|src\)'
		let lines = split(line, rn)
		if len(lines)==0
			return []
		endif
		let lines = map(lines[1:], 'matchstr(v:val, '''.rn.'\s*=\s*[''''"]\zs.\{-}\ze[''''"]'')')
		return lines
endfunction
function! s:chain_file()
	if &ft == 'html'
		let fname = expand("%")
		let s:cache_file[fname] = {}
		let files = s:get_fnames(readfile(fname))
		echo files
	endif
endfunction

command! NewChainFile call <SID>chain_file()

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
