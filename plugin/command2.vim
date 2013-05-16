let s:save_cpo = &cpo
set cpo&vim

let &cpo = s:save_cpo

command! GetVimFunctionName call vimwork#command2#get_vim_function_name()

unlet s:save_cpo
