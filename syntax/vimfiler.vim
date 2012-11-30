let s:save_cpo = &cpo
set cpo&vim


hi vimfilerCurrentDirectory  guifg=#800000 guibg=NONE

let &cpo = s:save_cpo
unlet s:save_cpo

