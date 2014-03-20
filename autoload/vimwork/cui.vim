let s:save_cpo = &cpo
set cpo&vim

function! vimwork#cui#init()
endfunction

if has('gui')
	finish
endif

if ( has('win32') || has('win64') )
	" コマンドブロンドの設定
	set enc=sjis
endif

" カーソルの形
let &t_SI="\e[5 q"
 let &t_EI="\e[1 q"
"
" IME制御
" let &t_SI .= "\e[<r"
" let &t_EI .= "\e[<s\e[<0t"
" let &t_te .= "\e[<0t\e[<s"
" set list lcs=tab:`> ,
set timeoutlen=100

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
