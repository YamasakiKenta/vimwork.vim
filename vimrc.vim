"" ********************************************************************************
"" Readme 
"" --------------------------------------------------------------------------------
"" = tmp = 
" let $VIMTMP         = '~/vim'
"
"" = script =
" let $LOCALWORK = '~/Dropbox/vim/local'       " <- 各PC毎に設定するフォルダ         
" let $VIMWORK   = '~/Dropbox/vim/vimwork'     " <- このファイルを指定してください
""
"" = bundle =
" let $BUNDLE          = '~/Dropbox/vim/bundle'           
" let $NEOBUNDLE       = '~/Dropbox/vim/bundle/Shougo-neobundle.vim' 
" so $VIMWORK/neobundle.vim
"
"" = command =
" let $DESKTOP         = '~/Desktop'                      
" let $VIMRC           = '~/Dropbox/vim/vimwork/vimrc.vim'
" let $PFPATH          = '~/Dropbox/vim/vimwork/bundle/unite-perforce.vim'
""
"" = MyGrep = 
" let g:myGrepFileType = 'vim'
"
"" = source = 
" so $LOCALWORK/vimrc.vim
" so $VIMWORK/vimrc.vim
"
"" = unite =
" let g:atmark_jump_is_unite = 1

"" ********************************************************************************
"" [使用箇所] 
"" --------------------------------------------------------------------------------
"" $DESKTOP
""  - vimrc.vim
""  |- ;de<CR>
"" $LOCALWORK
""  - vimrc.vim
""  |- ;v<CR>
""  |- snippets
""  |- howm
""  |- rtp
""  - command.vim
""  |- syntax
"" $VIMWORK
""  - vimrc.vim
""  |- $VIMWORK_BUNDLE
""  |- rtp
""  |- snippets
""  |- ;vc<CR>
"" $VIMRC 
""  - vimrc.vim
""  |- ;dv<CR>
"" $PFPATH
""  - vimrc.vim
""  |- ;p<CR>
"" g:myGrepFileType
""  - command.vim
""  |- MyGrep
"" $BUNDLE
""  - neobundle.vim
""  |- NeoBundle
"" $NEOBUNDLE
""  - neobundle.vim
""  |- rtp
"" ********************************************************************************
let $VIMWORK_BUNDLE = $VIMWORK.'/bundle'            
"win32
if has('win32') || has('win64') "{{{
	augroup myAugroup_win32
		au!
		" Mac で使用しないもの
		au GUIEnter * simalt ~x             " # 最大化
	aug END
	nnoremap <A-Space> :simalt ~<CR>|"                                             " # Window変更
	nnoremap ;h<CR> :<C-u>call okazu#change_extension({ 'c' : 'h', 'h' : 'c' })<CR>|"

	set rtp+=$VIMWORK_BUNDLE/unite-perforce.vim
	call perforce#init()

	"}}}
elseif has('mac') "{{{
	set makeprg=xcodebuild
	nnoremap ;h<CR> :<C-u>call okazu#change_extension({ 'm' : 'h', 'h' : 'm' })<CR>|"

	augroup my_vimrc_for_mac
		au!
		autocmd BufRead *.h setf objc
		autocmd BufRead *.snip setf snip
	augroup END
endif "}}}
"rtp
"rtp - myBundle "{{{
set rtp+=$VIMWORK
set rtp+=$LOCALWORK
set rtp+=$VIMWORK_BUNDLE/cells
set rtp+=$VIMWORK_BUNDLE/git
set rtp+=$VIMWORK_BUNDLE/bit
set rtp+=$VIMWORK_BUNDLE/okazu
"}}}
"Setting
"set - ClientMove "{{{
let g:ClientMove_recursive_flg = 1
"}}}
"set - Autoload {{{
augroup myAugroup
	au!
	au FileType unite nmap <buffer> P <Plug>(unite_toggle_auto_preview)
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
set fo+=ro " # 自動でコメント挿入
set laststatus=2                                                                                         " # ステータス行の表示
set tabstop=4                                                                                            " # tabの設定
set shiftwidth=4                                                                                         " # |
set lcs=tab:`\                                                                                           " # 記号の表示
set fdm=marker                                                                                           " # 自動的に折りたたみ
set tw=0                                                                                                 " # 自動改行 OFF
set ve=block
"set enc=utf-8                                                                                           " # エンコードの設定
"set fenc=utf-8                                                                                          " # |
exe 'set backupdir='.$VIMTMP.'/backup'                                                                 |" # Backupフォルダのパス

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
"set - Tlist
let Tlist_Show_One_File = 1

"plugin
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - マッチの強化
let g:Align_xstrlen = 3                                                                                  " # Align - 縦に整形
let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if' }               " # Toggle
"}}}
"plugin - QFixHowm{{{
let howm_dir = $VIMTMP.'/howm'
let QFix_CloseOnJump = 1                                                                                 " # QFixHown - を自動的に終了する
"}}}
"plugin - hsp {{{
autocmd BufRead *.hsp call FileTypeHsp()
function! FileTypeHsp()
	compiler hsp
	set filetype=hsp
	se omnifunc=hspcomplete#Complete
	nnoremap <buffer> <F5> :make<CR>
	nnoremap <buffer> <F1> :execute "!\"c:\\Local\\hsp32\\hsphelp\\helpman.exe\"" . " " . expand( "<cword>" )<CR>
endfunction
"}}}
"plugin - Twitter {{{
nnoremap ;tw<CR> :<C-u>PosttoTwitter<CR>
"}}}

"plugin - Shogo
"Shogo - unite{{{
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 0
nnoremap ;ur<CR>  :<C-u>UniteResume<CR>
nnoremap ;us<CR>  :<C-u>Unite source<CR>
nnoremap ;um<CR>  :<C-u>Unite file_mru<CR>
nnoremap ;uf<CR>  :<C-u>Unite file<CR>
nnoremap ;ut<CR>  :<C-u>Unite tag<CR>
nnoremap ;ug<CR>  :<C-u>Unite grep -no-quit<CR>
nnoremap ;ub<CR>  :<C-u>Unite buffer<CR>
nnoremap ;ubt<CR> :<C-u>Unite buffer_tags<CR>
nnoremap ;uh<CR>  :<C-u>Unite history/yank<CR>
nnoremap ;ul<CR>  :<C-u>Unite line<CR>
nnoremap ;uj<CR>  :<C-u>Unite jump<CR>
nnoremap ;uK<CR>  :<C-u>Unite bookmark<CR>
nnoremap ;uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>
nnoremap ;cw<CR>  :<C-u>Unite qf<CR>
"}}}
"Shogo - vimfiler{{{
let g:vimfiler_as_default_explorer = 1                                                                   " # 初期filer
let g:vimfiler_safe_mode_by_default = 0                                                                  " # safe_mode
"}}}
"Shogo - neocomplcache{{{
"neocomplcache - Init {{{
let g:neocomplcache_snippets_dir = $VIMWORK.'/snippets'.','.$LOCALWORK.'/snippets'                 " # snippet ファイル作成場所
let g:neocomplcache_enable_at_startup = 1                                                                " # 起動
let g:neocomplcache_disable_auto_complete = 1                                                            " # 自動補完無効
"let g:neocomplcache_auto_completion_start_length = 3                                                    " # 自動補完開始長さ
"}}}
"neocomplcache - Mapping {{{
nnoremap ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>
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
" nmap - <Plug>"{{{
nmap <C-s> 		<Plug>(set_number)
nmap v/ 		<Plug>(select_search)
nmap ;uq<CR> 	<Plug>(uniq_line)
" "}}}
"nnoremap - simple {{{
nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grepに移動 ( 次 )
nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grepに移動 ( 前 )
nnoremap v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"      " # 検索値の選択
nnoremap j gj|"                                                                " # カーソル移動
nnoremap k gk|"                                                                " # カーソル移動
nnoremap <C-]> <C-]>zz|"                                                       " # タグジャンプ
nnoremap <S-Space> za|"                                                        " # 折畳み
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                           " # ハイライト
map + :<C-u>ASearch <C-r>=expand("<cword>")<CR><CR>|"
vnoremap * "ty:let @/=@t<CR>N|"                                                    " # 選択文字を検索
vnoremap < <gv|"                                                                   " # カーソル移動
vnoremap > >gv|"                                                                   " # 再選択
"}}}
"nnoremap - window {{{
nnoremap <S-LEFT> <C-w><|"
nnoremap <S-RIGHT> <C-w>>|"
nnoremap <S-UP> <C-w>-|"
nnoremap <S-DOWN> <C-w>+|"
"}}}
"nnoremap - Normal "{{{
nnoremap ;sy<CR> :MySyntaxFile<CR>|"                   " # シンタックスファイルの編集
nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # ファイル名の取得
nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # ファイル名の取得 ( フルパス )
"}}}
"nnoremap - lcd "{{{
nnoremap ;l<CR>  :<C-u>lcd $LOCALWORK<CR>|"
nnoremap ;v<CR>  :<C-u>lcd $VIMWORK<CR>|"
nnoremap ;p<CR>  :<C-u>lcd $PFPATH<CR>|"
nnoremap ;de<CR> :<C-u>lcd $DESKTOP<CR>|"
nnoremap ;dv<CR> :<C-u>e $VIMRC<CR>|"
"}}}
"nnoremap - typo {{{
nnoremap <F1> <ESC>
com! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
"}}}
"nnoremap - Find {{{
nnoremap ;vc<CR> :<C-u>MyGrep <C-r>"<CR>
nnoremap ;vv<CR> :<C-u>MyGrep <C-r>+<CR>
nnoremap ;v/<CR> :<C-u>MyGrep <C-r>/<CR>
nnoremap ;vx<CR> :<C-u>MyGrep <C-r>/<CR>

nnoremap ;tc<CR> :<C-u>ta <C-r>"<CR>
nnoremap ;tv<CR> :<C-u>ta <C-r>+<CR>
nnoremap ;tx<CR> :<C-u>ta <C-r>/<CR>
nnoremap ;t/<CR> :<C-u>ta <C-r>/<CR>
"}}}
" nnoremap - c {{{
nnoremap ;k<CR> :<C-u>call okazu#change_unite()<CR>|"
" }}}
"
"********************************************************************************
" Unite Jump
"********************************************************************************
function! s:move_unite_tags(str) "{{{
	if a:str =~ '^k_'
		exe 'ta unite#kinds#'.a:str.'#define'
	elseif a:str =~ 'a_'
		exe 'ta kind.action_table.'.a:str.'.func'
	else
		" unite source の場合
		let source_flg = unite#get_sources(a:str)
		if len(source_flg) > 0
			let fnc = 's:source_'.a:str
			exe 'ta' fnc
		endif

	endif
endfunction "}}}
if get(g:, 'atmark_jump_is_unite', 0)
	nmap <C-@> :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>
endif

" ********************************************************************************
" diff
" ********************************************************************************
nnoremap ;dy<CR> :<C-u>call okazu#tabcopy()<CR>:windo diffthis<CR>:windo call okazu#Map_diff()<CR>|"
nnoremap ;do<CR> :<C-u>call okazu#tabcopy()<CR>:DiffOrig<CR>:windo call okazu#Map_diff()<CR>|"
nnoremap ;dn<CR> :<C-u>diffoff!<CR>:windo call okazu#Map_diff_reset()<CR>:tabc<CR>|"

"********************************************************************************
" MEMO
"--------------------------------------------------------------------------------
" ctags 対策
" unite ソースに移動するために、変数名と関連付けする
" source_*
" kind_*
" action_*
"
" 自動改行回避
" set tw=0
