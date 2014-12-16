"=============================================================================
" FILE: multiline.vim
" AUTHOR:  Yamasaki Kenta
" Creation Date: 2014/04/27 23:52:39
" Last Modified: 2014/12/04 09:58:41
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim

" aug vimwork_vimrc
    " au!
    " au BufRead,BufNewFile *.pc set filetype=c
    " au BufWrite * call vimwork#command#update_time(['call cursor(6,0)'])
    " au BufEnter * syn sync fromstart
" aug END

set backupdir=~/.vim/bak
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir))
endif

" dir 
let s:dir = substitute(substitute(expand("<sfile>"), '\\', '\/', 'g'), '/plugin/.*$', '', '')
let g:neosnippet#snippets_directory = s:dir.'/snippets'
let g:vimwork#syntax_directory = s:dir
exe 'set dict+='.s:dir.'/dict/*'

if has('persistent_undo')
    set undodir=~/.vim/undo
    set noudf
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir))
    endif
endif 

if has('win32') && !has('gui')
    set enc=sjis
    set fenc=utf-8
else
    set enc=utf-8
    set fenc=utf-8
endif

nnoremap <PLUG>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <PLUG>(select_search)
			\ //e<cr>??s<cr><c-v>//e<cr>

nnoremap <PLUG>(edit_syntax_file)
			\ :exe 'e '.g:vimwork#syntax_directory.'/syntax/'.&filetype.'.vim'<CR>

" 検索ワードの追加
command! -narg=* AddSearch call vimwork#command#add_serach(<f-args>) 

" 連番の作成
command! -narg=0 SetNum call vimwork#command#set_num() 

" シンタックスの表示
command! EchoSyntax echo synIDattr(synID(line("."), col("."), 1), "name")

" 管理
command! ChangeRoot call vimwork#command#change_root()

" フォルダ構造のコピー
command! -nargs=+ CopyFileDir call vimwork#command#copyFileDir(<f-args>) 
"
" 対象の文言を抽出する
command! -range -narg=1 GetWord call vimwork#command#get_word(<line1>, <line2>, <f-args>)

" 初期設定 , 対応するファイル
command! -narg=* -range SortFunction call sort_function#sort_function(<line1>, <line2>)

" WinMerge
command! WinMerge call vimwork#command#winmerge()

" Last Modified を更新する
command! MyUpdateTimer call vimwork#command#update_time([''])

" c_CTRL-X
"   Input current buffer's directory on command line.
cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>
function! s:GetBufferDirectory()
  let dir = expand('%:p:h')
  return dir . (exists('+shellslash') && !&shellslash ? '\' : '/')
endfunction


if exists('s:save_cpo')
    let &cpo = s:save_cpo
    unlet s:save_cpo
endif

