function! s:init() "{{{
	aug tree_init
		au!
		" �ړ������ꍇ
		au CursorMoved call <SID>reload()
	aug END
	setf tree
	set fdm=indent
	set shiftwidth=1
	set tabstop=1
	set expandtab
	nnoremap <buffer> <C-l> :<C-u>call <CR>force_reload()<CR>
endfunction "}}}
function! s:reload() "{{{

endfunction "}}}
aug tree "{{{
	au!
	" ������
	au BufRead *.tree call <SID>init()
aug END "}}}

" syntax - 
" ����������
