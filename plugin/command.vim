let s:save_cpo = &cpo
set cpo&vim

" 検索ワードの追加
command! -narg=* AddSearch call vimwork#command#add_serach(<f-args>) 

" フォルダ構造のコピー
command! -nargs=+ CopyFileDir call vimwork#command#copyFileDir(<f-args>) 
"
" 対象の文言を抽出する
command! -range -narg=1 GetWord call vimwork#command#get_word(<line1>, <line2>, <f-args>)

" 連番の作成
command! -narg=0 SetNum call vimwork#command#set_num() 

" 管理
command! -nargs=? MyGitUpdate call vimwork#command#my_git_update(<q-args>) 
command! ChangeRoot call vomwork#command#change_root()

" 初期設定 , 対応するファイル
command! -narg=* -range SortFunction call sort_function#sort_function(<line1>, <line2>)

command! Winmerge call vimwork#command#winmerge()

let &cpo = s:save_cpo
unlet s:save_cpo

