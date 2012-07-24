nnoremap <Plug>(makeHeader)
			\ :v/-(\|#pragma/d<CR>
			\ :g/^-(/s/$/;/<CR>
			\ :%s/\s\+;/;/<CR>

nmap ;xh<CR> <Plug>(makeHeader)
