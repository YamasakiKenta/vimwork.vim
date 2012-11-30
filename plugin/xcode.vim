let s:save_cpo = &cpo
set cpo&vim


nnoremap <Plug>(makeHeader)
			\ :v/-(\|#pragma/d<CR>
			\ :g/^-(/s/$/;/<CR>
			\ :%s/\s\+;/;/<CR>

nmap ;xh<CR> <Plug>(makeHeader)

let &cpo = s:save_cpo
unlet s:save_cpo

