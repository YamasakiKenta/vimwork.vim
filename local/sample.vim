set updatetime=100

augroup vimproc-async-receive-test
augroup END

" コマンド終了時に呼ばれる関数
function! s:finish(result)
	call input("END")
    echo a:result
endfunction

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

        if !(vimproc.stdout.eof && vimproc.stderr.eof)
            return 0
        endif
    catch
        echom v:throwpoint
    endtry

    " 終了時に呼ぶ
    call s:finish(s:result)
    
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


function! s:system_async(cmd)
    let cmd = a:cmd
	let s:str = '.'
	echom 'start : '. cmd
    let vimproc = vimproc#pgroup_open(cmd)
    call vimproc.stdin.close()
    
    let s:vimproc = vimproc
    let s:result = ""
    
    augroup vimproc-async-receive-test
        execute "autocmd! CursorHold,CursorHoldI * call"
\               "s:receive_vimproc_result()"
    augroup END
endfunction

" let cmd = 'ag --nocolor --nogroup "function"'
let cmd = 'ag --nocolor --nogroup "function" .'
" let cmd = 'findstr /n /s function "C:\Users\kenta\Dropbox\vim\mind\vimwork.vim\sample\vimproc2.vim"'
" let cmd = "ruby -e \"sleep 3; puts 'homu'; puts 'mado'\""
call s:system_async(cmd)


