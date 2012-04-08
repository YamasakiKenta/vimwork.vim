" ********************************************************************************
" Readme
" --------------------------------------------------------------------------------
"
" let $DESKTOP         = '~/Desktop'                      
" let $IVIM            = '~/Dropbox/vim'                  
" let $IVIMWORK        = '~/Dropbox/vim/vimwork'          
" let $IVIMWORKCOMMON  = '~/Dropbox/vim/vimwork'          
" let g:myGrepFileType = 'vim'
"
" let $BUNDLE          = '~/Dropbox/vim/bundle'           
" let $NEOBUNDLE       = $BUNDLE.'/Shougo-neobundle.vim' 
"
" so $IVIMWORKCOMMON/neobundle.vim
" so $IVIMWORKCOMMON/vimrc
"
" set rtp+=$IVIMWORK  " NeoBundle 'https://YamasakiKenta@github.com/YamasakiKenta/vimwork.git'
"
" ********************************************************************************
"
"Setting
"set - myBundle "{{{
let $IMYBUNDLE = $IVIMWORKCOMMON.'/myBundle'            
set rtp+=$IVIMWORKCOMMON
set rtp+=$IMYBUNDLE/okazu
set rtp+=$IMYBUNDLE/unite-perforce.vim
set rtp+=$IMYBUNDLE/cells
"}}}
"set - Autoload {{{
augroup myAugroup
	au!
	if has('win32')
		au GUIEnter * simalt ~x             " # 最大化
	endif
	au Filetype help call okazu#MyQuit() " # help用のキーバインド
aug END
"}}}
"set - Normal {{{

set modeline                                                                                             " # 読み込み時の設定
set number                                                                                               " # 番号入力
set ignorecase                                                                                           " # 検索で大文字小文字を区別しない
set cursorline                                                                                           " # カーソル行の強調
set hlsearch                                                                                             " # 検索
set incsearch                                                                                            " # |
set smartcase                                                                                            " # |
set autoread                                                                                             " # 自動更新
set list                                                                                                 " # |
set hidden                                                                                               " # ファイルを保存せず移動
set noswapfile                                                                                           " # SwapFile
set nowrap                                                                                               " # 折り返し
set grepprg=grep\ -nH                                                                                    " # Grep
set guioptions-=T                                                                                        " # メニューバーを削除
set guioptions-=m                                                                                        " # ツールバーを削除
set laststatus=2                                                                                         " # ステータス行の表示
set tabstop=4                                                                                            " # tabの設定
set shiftwidth=4                                                                                         " # |
set lcs=tab:`\                                                                                           " # 記号の表示
set fdm=marker                                                                                           " # 自動的に折りたたみ
set backupdir=~/vim/backup                                                                               " # Backupフォルダのパス
set tw=0                                                                                                 " # 自動改行 OFF
"set enc=utf-8                                                                                           " # エンコードの設定
"set fenc=utf-8                                                                                          " # |

"}}}
"set - Terminal {{{
if !has('gui')
	set ruler                                                                                                " # カーソルの位置の表示
	set nocompatible                                                                                         " # vimの機能が使える
	syntax enable                                                                                            " # 色を付け - 設定がリセットされる
	filetype on
	filetype indent on
	filetype plugin on
endif
"}}}
"
"plugin
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - マッチの強化
let g:Align_xstrlen = 3                                                                                  " # Align - 縦に整形
let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if' }               " # Toggle
"}}}
"plugin - QFixHowm{{{
let howm_dir = $IVIM.'/howm'
let QFix_CloseOnJump = 1                                                                                 " # QFixHown - を自動的に終了する
"}}}
"plugin - hsp {{{
autocmd BufRead *.hsp call FileTypeHsp()
function! FileTypeHsp()
	compiler hsp
	set filetype=hsp
	se omnifunc=hspcomplete#Complete
	map <buffer> <F5> :make<CR>
	map <buffer> <F1> :execute "!\"c:\\Local\\hsp32\\hsphelp\\helpman.exe\"" . " " . expand( "<cword>" )<CR>
endfunction
"}}}
"plugin - Twitter {{{
map ;tw<CR> :<C-u>PosttoTwitter<CR>
"}}}
"plugin - perforce "{{{
let g:myGrepFileType = 'vim'
"let g:pf_client_changes_only = 1                                                                        " # 1 - クライアントでフィルタ
"let g:pf_user_changes_only = 1                                                                          " # 1 - ユーザーでフィルタ
"let g:pf_is_submit_flg = 1                                                                              " # サブミットするかどうか
"let g:pf_ports = ['1668']                                                                               " # ポートの設定
"let g:pf_is_out_flg = 1                                                                                 " # 結果出力を行う
"}}}

"plugin - Shogo
"Shogo - unite{{{
let g:unite_enable_start_insert = 0         " # 自動起動
let g:unite_source_history_yank_enable = 0
map ;ur<CR>  :<C-u>UniteResume<CR>
map ;us<CR>  :<C-u>Unite source<CR>
map ;um<CR>  :<C-u>Unite file_mru<CR>
map ;uf<CR>  :<C-u>Unite file<CR>
map ;ut<CR>  :<C-u>Unite tag<CR>
map ;ug<CR>  :<C-u>Unite grep -no-quit<CR>
map ;ub<CR>  :<C-u>Unite buffer<CR>
map ;ubt<CR> :<C-u>Unite buffer_tags<CR>
map ;uh<CR>  :<C-u>Unite history/yank<CR>
map ;ul<CR>  :<C-u>Unite line<CR>
"}}}
"Shogo - vimfiler{{{
let g:vimfiler_as_default_explorer = 1                                                                   " # 初期filer
let g:vimfiler_safe_mode_by_default = 0                                                                  " # safe_mode
"}}}
"Shogo - neocomplcache{{{
"neocomplcache - Init {{{
let g:neocomplcache_snippets_dir = $IVIMWORK.'/snippets'                                                 " # snippet ファイル作成場所
let g:neocomplcache_enable_at_startup = 1                                                                " # 起動
let g:neocomplcache_disable_auto_complete = 1                                                            " # 自動補完無効
"let g:neocomplcache_auto_completion_start_length = 3                                                    " # 自動補完開始長さ
"}}}
"neocomplcache - Mapping {{{
map ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>
imap <C-s>  <Plug>(neocomplcache_start_unite_complete)|"                                                 " # Uniteを使用する
imap <C-Space> <Plug>(neocomplcache_snippets_expand)|"                                                   " # Snippetを使用する
smap <C-Space> <Plug>(neocomplcache_snippets_expand)|"                                                   " # 同上
"}}}
"neocomplcache - caching "{{{
"\:NeoComplCacheCachingBuffer<CR>
"\:NeoComplCacheCachingSyntax<CR>
"\:NeoComplCacheCachingTags<CR>
"\:NeoComplCacheCachingTags<CR>
"\:NeoComplCacheCachingSnippets<CR>
"}}}
"}}}

"********************************************************************************
" mapping
"********************************************************************************
"map - simple {{{
map <C-n> :<C-u>cn<CR>|"                                                                                 " # Grepに移動 ( 次 )
map <C-p> :<C-u>cN<CR>|"                                                                                 " # Grepに移動 ( 前 )
map <A-Space> :simalt ~<CR>|"                                                                            " # Window変更
map v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"                                     " # 検索値の選択
map j gj|"                                                                                               " # カーソル移動
map k gk|"                                                                                               " # カーソル移動
map <C-]> <C-]>zz|"                                                                                      " # タグジャンプ
map <S-Space> za|"                                                                                       " # 折畳み
nmap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                                                     " # ハイライト
vmap * "ty:let @/=@t<CR>N|"                                                                              " # 選択文字を検索
vmap < <gv|"                                                                                             " # カーソル移動
vmap > >gv|"                                                                                             " # 再選択
"}}}
"map - diff {{{
map ;dy<CR> :<C-u>windo diffthis<CR>:windo call okazu#Map_diff()<CR>|"
map ;do<CR> :<C-u>DiffOrig<CR>:windo call okazu#Map_diff()<CR>|"
map ;dn<CR> :<C-u>diffoff!<CR>:windo call okazu#Map_diff_reset()<CR>|"
"}}}
"map - window {{{
map <S-LEFT> <C-w><|"
map <S-RIGHT> <C-w>>|"
map <S-UP> <C-w>-|"
map <S-DOWN> <C-w>+|"
"}}}
"map - nop {{{
" map qの入力が遅くなる
"map q: <nop>|"
"map q/ <nop>|"
"}}}
"map - Normal "{{{
map ;ry<CR> :<C-u>windo set scrollbind<CR>|"
map ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
map ;v<CR> :<C-u>lcd $IVIM<CR>|"                                                                         " # VIM をcd にする
map ;sy<CR> :MySyntaxFile<CR>|"                                                                          " # シンタックスファイルの編集
map ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"                                                           " # ファイル名の取得
map ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"                                                           " # ファイル名の取得 ( フルパス )
map ;de<CR> :<C-u>lcd $IDESKTOP<CR>
"}}}
"map - typo {{{
map <F1> <ESC>
com! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
"}}}
"map - Find {{{
map ;vc<CR> :<C-u>MyGrep <C-r>"<CR>
map ;vv<CR> :<C-u>MyGrep <C-r>+<CR>
map ;v/<CR> :<C-u>MyGrep <C-r>/<CR>
map ;vx<CR> :<C-u>MyGrep <C-r>/<CR>

map ;tc<CR> :<C-u>ta <C-r>"<CR>
map ;tv<CR> :<C-u>ta <C-r>+<CR>
map ;tx<CR> :<C-u>ta <C-r>/<CR>
map ;t/<CR> :<C-u>ta <C-r>/<CR>
"}}}
" map - c {{{
map ;h<CR> :<C-u>e %:r.h<CR>|"                                                                           " # ファイルの切り替え
map ;m<CR> :<C-u>e %:r.m<CR>|"                                                                           " # ファイルの切り替え
map ;c<CR> :<C-u>e %:r.c<CR>|"                                                                           " # ファイルの切り替え
" }}}

