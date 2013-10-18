let s:save_cpo = &cpo
set cpo&vim

" 初期設定 , 対応するファイル


command! -narg=* -range SortFunction call sort_function#sort_function(<line1>, <line2>, <q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

