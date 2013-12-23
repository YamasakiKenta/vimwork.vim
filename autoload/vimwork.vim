let s:save_cpo = &cpo
set cpo&vim

function! vimwork#set_ctags() 
	nnoremap <C-\>K :call system("ctags -R --excmd=number")<CR>|"
endfunction 
function! vimwork#set_cscope() 
	set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
	nnoremap <C-\>L :cs kill -1<CR>:call system("cscope -b -R -q")<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>l :cs kill -1<CR>:cs add cscope.out<CR>|"
	nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>|"
	nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
	nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
