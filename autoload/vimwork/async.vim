let s:save_cpo = &cpo
set cpo&vim

augroup vimproc-async-receive-test
augroup END

function! vimwork#async#system(cmd, func_async, func_end) "{{{
    let vimproc = vimproc#plineopen2(a:cmd)
    
    let s:vimproc = vimproc
    let s:result = ""

	let s:func_end   = a:func_end
	let s:func_async = a:func_async

    augroup vimproc-async-receive-test
        autocmd! CursorHold,CursorHoldI * call s:receive_vimproc_result()
    augroup END
endfunction
"}}}
function! s:receive_vimproc_result() "{{{
    if !has_key(s:, "vimproc")
        return
    endif

    let vimproc = s:vimproc

    try
        if !vimproc.stdout.eof
            let s:result .= vimproc.stdout.read()
        endif

        if !vimproc.stderr.eof
            let s:result .= vimproc.stderr.read()
        endif

		" let s:result = call(s:async_func, [s:result])

        if !(vimproc.stdout.eof && vimproc.stderr.eof)
            return 0
        endif
    catch
        echom v:throwpoint
    endtry

    " èIóπéûÇ…åƒÇ‘
	call call(s:func_end, [s:result])
    
    augroup vimproc-async-receive-test
        autocmd!
    augroup END

    call vimproc.stdout.close()
    call vimproc.stderr.close()
    call vimproc.waitpid()
    unlet s:vimproc
    unlet s:result
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
