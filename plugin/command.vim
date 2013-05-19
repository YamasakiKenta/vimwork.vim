let s:save_cpo = &cpo
set cpo&vim

" 前後の入れ替え
command! -range -nargs=? MySwap <line1>,<line2>call vimwork#command#mySwap(<q-args>) 

" 検索ワードの追加
command! -narg=* AddSearch call vimwork#command#add_serach(<f-args>) 

" howm に追加する
command! -narg=* QuickMemo call vimwork#command#quickMemo(<f-args>) 

" フォルダ構造のコピー
command! -nargs=+ CopyFileDir call vimwork#command#copyFileDir(<f-args>) 
"
" 対象の文言を抽出する
command! -range -narg=1 GetWord call vimwork#command#get_word(<line1>, <line2>, <f-args>)

" 連番の作成
command! -narg=0 SetNum call vimwork#command#set_num() 

let &cpo = s:save_cpo
unlet s:save_cpo

