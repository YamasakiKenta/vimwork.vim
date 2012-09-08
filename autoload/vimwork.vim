function! vimwork#init() "{{{
let $VIMWORK   = expand(exists('$VIMWORK'  ) ? $VIMWORK   : '~/vimwork'  ) 
let $LOCALWORK = expand(exists('$LOCALWORK') ? $LOCALWORK : '~/localwork') 
let $VIMTMP    = expand(exists('$LOCALWORK') ? $VIMTMP    : '~/vimtmp'   ) 
endfunction "}}}
"@point of use
"$VIMTMP "{{{
" - backupdir
" - howm
" }}}
" $LOCALWORK "{{{
"  - vimrc.vim
"  |- ;v<CR>
"  |- snippets
"  |- howm
"  |- rtp
"  - command.vim
"  |- syntax
"}}}
" $VIMWORK "{{{
"  - vimrc.vim
"  |- rtp
"}}}
"rtp - bundle "{{{
" vimwork に含まれるスクリプトの入力
set rtp+=$LOCALWORK
set rtp+=$VIMWORK
set rtp+=$VIMWORK/bundle/diff
set rtp+=$VIMWORK/bundle/cells
set rtp+=$VIMWORK/bundle/git
"}}}
"@setting
" set - os "{{{
"set - windows "{{{
if has('win32') || has('win64') 
	nnoremap <A-Space> :simalt ~<CR>|" " # Window変更
	aug my_vimrc
		au!
		au BufRead *.h setf c
		au GUIEnter * simalt ~x        " # 最大化
	aug END
	let s:ext = {
				\ 'c' : 'h',
				\ 'h' : 'c',
				\ }

	"}}}
	"set - mac "{{{
elseif has('mac') 
	set makeprg=xcodebuild
	let s:ext = {
				\ 'c' : 'h',
				\ 'h' : 'c',
				\ }

	aug my_vimrc
		au!
		aut BufRead *.h setf objc
	aug END
endif "}}}
"}}}
"set - Autoload {{{
augroup myAugroup
	au!
	aut BufRead *.snip setf snip
	au FileType unite nmap <buffer> P <PLUG>(unite_toggle_auto_preview)
aug END
"}}}
"set - normal "{{{
"set enc=utf-8                                                                                           " # エンコードの設定
"set fenc=utf-8                                                                                          " # |
"set grepprg=grep\ -nH                                                                                   " # Grep
set fdm=marker                                                                                           " # 自動的に折りたたみ
set fo+=ro                                                                                               " # 自動でコメント挿入
set guioptions-=T                                                                                        " # メニューバーを削除
set guioptions-=m                                                                                        " # ツールバーを削除
set laststatus=2                                                                                         " # ステータス行の表示
set lcs=tab:`\                                                                                           " # 記号の表示
set shiftwidth=4                                                                                         " # |
set tabstop=4                                                                                            " # tabの設定
set tw=0                                                                                                 " # 自動改行 OFF
set backupdir=$VIMTMP/backup                                                                 " # Backupフォルダのパス
"}}}
"set - Normal {{{
set autoread                                                                                             " # 自動更新
set cursorline                                                                                           " # カーソル行の強調
set hidden                                                                                               " # ファイルを保存せず移動
set hlsearch                                                                                             " # 検索
set ignorecase                                                                                           " # 検索で大文字小文字を区別しない
set incsearch                                                                                            " # |
set list                                                                                                 " # |
set modeline                                                                                             " # 読み込み時の設定
set noswapfile                                                                                           " # SwapFile
set nowrap                                                                                               " # 折り返し
set number                                                                                               " # 番号入力
set smartcase                                                                                            " # |
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
"set - cscope "{{{
set cscopequickfix=s-,c-,d-,i-,t-,e-
"}}}
"set - Tlist "{{{
let Tlist_Show_One_File = 1
""}}}
"@mapping
" nmap - <PLUG>"{{{
nmap v/ 		<PLUG>(select_search)
nmap ;uq<CR> 	<PLUG>(uniq_line)
nmap ;sy<CR> 	<PLUG>(edit_syntax_file)
" "}}}
"nnoremap - simple {{{
map + :<C-u>ASearch <C-r>=expand("<cword>")<CR><CR>|"
nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grepに移動 ( 次 )
nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grepに移動 ( 前 )
nnoremap v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"      " # 検索値の選択
nnoremap j gj|"                                                                " # カーソル移動
nnoremap k gk|"                                                                " # カーソル移動
nnoremap <C-]> <C-]>zz|"                                                       " # タグジャンプ
nnoremap <S-Space> za|"                                                        " # 折畳み
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                       " # ハイライト
vnoremap * "ty:let @/=@t<CR>N|"                                                " # 選択文字を検索
vnoremap < <gv|"                                                               " # カーソル移動
vnoremap > >gv|"                                                               " # 再選択
"}}}
"nnoremap - window {{{
nnoremap <S-LEFT> <C-w><|"
nnoremap <S-RIGHT> <C-w>>|"
nnoremap <S-UP> <C-w>-|"
nnoremap <S-DOWN> <C-w>+|"
"}}}
"nnoremap - normal "{{{
nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # ファイル名の取得
nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # ファイル名の取得 ( フルパス )
"}}}
"nnoremap - lcd "{{{
nnoremap ;l<CR>  :<C-u>lcd $LOCALWORK<CR>|"
nnoremap ;v<CR>  :<C-u>lcd $VIMWORK<CR>|"
"}}}
"nnoremap - typo {{{
nnoremap <F1> <ESC>
command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
"}}}
"nnoremap - find {{{
nnoremap ;vc<CR> :<C-u>MyGrep <C-r>"<CR>
nnoremap ;vv<CR> :<C-u>MyGrep <C-r>+<CR>
nnoremap ;v/<CR> :<C-u>MyGrep <C-r>/<CR>
nnoremap ;vx<CR> :<C-u>MyGrep <C-r>/<CR>

nnoremap ;tc<CR> :<C-u>ta <C-r>"<CR>
nnoremap ;tv<CR> :<C-u>ta <C-r>+<CR>
nnoremap ;tx<CR> :<C-u>ta <C-r>/<CR>
nnoremap ;t/<CR> :<C-u>ta <C-r>/<CR>
"}}}
" nnoremap - cscope "{{{
noremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>|"
noremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>|"
nnoremap <C-\>L :call system("cscope -b -R")<CR>:cs kill -1<CR>:cs add cscope.out<CR>|"
nnoremap <C-\>l :cs kill -1<CR>:cs add cscope.out<CR>|"
nnoremap <C-\>K :call system("ctags -R")<CR>|"
nnoremap <C-\>v :vim /<C-R>=expand("<cword>")<CR>/ **/*.vim **.*.[ch]<CR>
nnoremap <expr> <C-\>t  ':echo'.expand('<cword>')
" }}}
" nnoremap - call "{{{
nnoremap ;h<CR> :<C-u>call common#change_extension(s:ext)<CR>|"
"}}}
" nnoremap - c {{{
nnoremap ;k<CR> :<C-u>call common#change_unite()<CR>|"
" }}}
" nnoremap - other "{{{
nnoremap <C-s> 	:<C-u>SetNum<CR>
" }}}
"@plugin
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - マッチの強化
let g:Align_xstrlen = 3                                                                                  " # Align - 縦に整形
let g:toggle_pairs = {
			\ 'and'   : 'or',
			\ 'or'    : 'and',
			\ 'if'    : 'elsif',
			\ 'elsif' : 'else',
			\ 'else'  : 'if'
			\ }
"}}}
"plugin - QFixHowm{{{
let howm_dir = $VIMTMP.'/howm'
let QFix_CloseOnJump = 1" # QFixHown - を自動的に終了する
"}}}
"plugin - hsp {{{
if 0
autocmd BufRead *.hsp call FileTypeHsp()
function! FileTypeHsp()
	compiler hsp
	set filetype=hsp
	se omnifunc=hspcomplete#Complete
	nnoremap <buffer> <F5> :make<CR>
	nnoremap <buffer> <F1> :execute "!\"c:\\Local\\hsp32\\hsphelp\\helpman.exe\"" . " " . expand( "<cword>" )<CR>
endfunction
endif
"}}}
"@plugin - Shogo
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
let g:vimfiler_as_default_explorer = 1   " # 初期filer
let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
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
imap <C-s>  <PLUG>(neocomplcache_start_unite_complete)|"                                                 " # Uniteを使用する
imap <C-Space> <PLUG>(neocomplcache_snippets_expand)|"                                                   " # Snippetを使用する
smap <C-Space> <PLUG>(neocomplcache_snippets_expand)|"                                                   " # 同上
"}}}
"neocomplcache - caching "{{{
"\:NeoComplCacheCachingBuffer<CR>
"\:NeoComplCacheCachingSyntax<CR>
"\:NeoComplCacheCachingTags<CR>
"\:NeoComplCacheCachingTags<CR>
"\:NeoComplCacheCachingSnippets<CR>
"}}}
"}}}
"@script
" script - unite jump "{{{
if get(g:, 'atmark_jump_is_unite', 0) "{{{
	nmap <C-@> :<C-u>call s:move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>
endif "}}}
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
"}}}
