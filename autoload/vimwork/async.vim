let s:save_cpo = &cpo
set cpo&vim

let s:cache = {}

let data = {}
function data.update(...)
	echo a:000
endfunction
function data.complete(...)
	echo a:000
endfunction
call vimwork#async#system('ls', data )

function! vimwork#async#system(cmd, data) "{{{
	let s:cache[a:cmd] = {
				\ 'vimproc' : vimproc#plineopen2(a:cmd),
				\ 'data'    : deepcopy(a:data),
				\ 'result'  : '',
				\ }

    exe 'augroup vimproc-async-receive-test-'.a:cmd
        autocmd! CursorHold,CursorHoldI * call s:receive_vimproc_result(a:cmd)
    augroup END
endfunction
"}}}
function! s:receive_vimproc_result(cmd) "{{{
	if !has_key(s:cache, a:cmd)
		return 
	endif

	let cache = s:cache[a:cmd]

    if !has_key(cache, "vimproc")
        return
    endif

    let vimproc = cache.vimproc

	try
		let result = cache.result

		if !vimproc.stdout.eof
			let result .= vimproc.stdout.read()
		endif

		if !vimproc.stderr.eof
			let result .= vimproc.stderr.read()
		endif

		let result = call(get(cache, 'update', ''), [result])

		 let cache.result = result

		if !(vimproc.stdout.eof && vimproc.stderr.eof)
			return 0
		endif
	catch
		echom v:throwpoint
	endtry

    " 終了時に呼ぶ
	let result = call(get(cache, 'complete', ''), [result])
    
    exe 'augroup vimproc-async-receive-test-'.a:cmd
        autocmd!
    augroup END

    call vimproc.stdout.close()
    call vimproc.stderr.close()
    call vimproc.waitpid()
endfunction
"}}}

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
