let s:save_cpo = &cpo
set cpo&vim

"================================================================================
" MEMO 
"--------------------------------------------------------------------------------
"$VIMTMP 
" - backupdir
" - howm
"
" $LOCALWORK 
"  - vimrc.vim
"  |- ;v<CR>
"  |- snippets
"  |- howm
"  - command.vim
"  |- syntax
"
" $VIMWORK 
"  - vimrc.vim
"
"================================================================================
function! s:sort_ng() "{{{
	if !has('gui') 
		set ruler           " # カーソルの位置の表示
		set nocompatible    " # vimの機能が使える
		syntax enable       " # 色を付け - 設定がリセットされる
		filetype on
		filetype indent on
		filetype plugin on
	endif

	let g:toggle_pairs = {
				\ 'and'   : 'or',
				\ 'or'    : 'and',
				\ 'if'    : 'elsif',
				\ 'elsif' : 'else',
				\ 'else'  : 'if'
				\ }
endfunction
"}}}
function! s:change_unite() "{{{
	" ********************************************************************************
	" ファイルの切り替え ( unite ) 
	" ********************************************************************************
	let root = substitute(expand("%:h"), '[\\/][^\\/]*$', '', '')
	let file = expand("%:t")
	let type = substitute(expand("%:h"), '.*[\\/]\ze.\{-}[\\/]', '', '')

	echo type
	if type =~ 'unite[\\/]kinds'
		let file = substitute(file, 'k_', '', '')
		exe 'e '.root.'/sources/'.file
	elseif type =~ 'unite[\\/]sources'
		exe 'e '.root.'/kinds/k_'.file
	endif

endfunction 
"}}}
"
function! vimwork#init() "{{{
endfunction 
"}}}

let $VIMWORK   = expand(exists('$VIMWORK'  ) ? $VIMWORK   : '~/vimwork'  ) 
let $LOCALWORK = expand(exists('$LOCALWORK') ? $LOCALWORK : '~/localwork') 
let $VIMTMP    = expand(exists('$VIMTMP')    ? $VIMTMP    : '~/vimtmp'   ) 
call s:sort_ng()

" sort ok "{{{

map + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>|"
nmap ;sy<CR> 	<Plug>(edit_syntax_file)
nmap ;uq<CR> 	<Plug>(uniq_line)
nmap v/ 		<Plug>(select_search)
set autoread                                            " # 自動更新
set backupdir=$VIMTMP/backup                            " # Backupフォルダのパス
set cursorline                                          " # カーソル行の強調
set fdm=marker                                          " # 自動的に折りたたみ
set fo+=ro                                              " # 自動でコメント挿入
set guioptions-=T                                       " # メニューバーを削除
set guioptions-=m                                       " # ツールバーを削除
set hidden                                              " # ファイルを保存せず移動
set hlsearch                                            " # 検索
set ignorecase                                          " # 検索で大文字小文字を区別しない
set incsearch
set laststatus=2                                        " # ステータス行の表示
set lcs=tab:`\                                          " # 記号の表示
set list
set modeline                                            " # 読み込み時の設定
set noswapfile                                          " # SwapFile
set nowrap                                              " # 折り返し
set number                                              " # 番号入力
set shiftwidth=4
set smartcase
set stl=[%{&ff}][%n]%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set tabstop=4                                           " # tabの設定
set tw=0                                                " # 自動改行 OFF
set ve=block
set dip=filler,icase,iwhite,vertical

"}}}

" nnoremap - c {{{
nnoremap ;k<CR> :<C-u>call <SID>change_unite()<CR>|"
" }}}
" nnoremap - call "{{{
nnoremap ;h<CR> :<C-u>ChainFile<CR>
"}}}
" nnoremap - other "{{{
nnoremap <C-s> 	:<C-u>SetNum<CR>
" }}}
"nnoremap - find {{{
nnoremap ;tc<CR> :<C-u>ta <C-r>"<CR>
nnoremap ;tv<CR> :<C-u>ta <C-r>+<CR>
nnoremap ;tx<CR> :<C-u>ta <C-r>/<CR>
nnoremap ;t/<CR> :<C-u>ta <C-r>/<CR>
"}}}
"nnoremap - lcd "{{{
nnoremap ;l<CR>  :<C-u>lcd <C-r>=expand($LOCALWORK)<CR><CR>|"
nnoremap ;v<CR>  :<C-u>lcd <C-r>=expand($VIMWORK)<CR><CR>|"
"}}}
"nnoremap - normal "{{{
nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # ファイル名の取得
nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # ファイル名の取得 ( フルパス )
"}}}
"nnoremap - simple {{{
nnoremap <C-j> j.|"                                                            " # 作業の繰り返し                     
nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grepに移動 ( 次 )
nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grepに移動 ( 前 )
nnoremap v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"      " # 検索値の選択
nnoremap j gj|"                                                                " # カーソル移動
nnoremap k gk|"                                                                " # カーソル移動
nnoremap <C-]> <C-]>zz|"                                                       " # タグジャンプ
nnoremap <S-Space> za|"                                                        " # 折畳み
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                       " # ハイライト
nnoremap [[ [[zz|"
nnoremap ]] ]]zz|"
"}}}
"nnoremap - typo {{{
nnoremap <F1> <ESC>
command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
"}}}
"nnoremap - window {{{
nnoremap <S-LEFT> <C-w><|"
nnoremap <S-RIGHT> <C-w>>|"
nnoremap <S-UP> <C-w>-|"
nnoremap <S-DOWN> <C-w>+|"
"}}}
"vnoremap - simple "{{{
vnoremap * "ty:let @/=@t<CR>N|"                                                " # 選択文字を検索
vnoremap < <gv|"                                                               " # カーソル移動
vnoremap > >gv|"                                                               " # 再選択
"}}}
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - マッチの強化
let g:Align_xstrlen = 3                                                                                  " # Align - 縦に整形
"}}}
"plugin - QFixHowm{{{
let howm_dir = $VIMTMP.'/howm'
let QFix_CloseOnJump = 1" # QFixHown - を自動的に終了する
"}}}
"map - perforce "{{{
nmap ;cl<CR> <PLUG>(p4_echo_client_data)
nmap ;cr<CR> <PLUG>(p4_cd_clentpath)
nmap ;ff<CR> <PLUG>(p4_find)
nmap ;pl<CR> <PLUG>(p4_filelog)
nmap ;pd<CR> <PLUG>(p4_diff)
nmap ;id<CR> <PLUG>(p4_get_depot)

nnoremap ;pp<CR> :<c-u>PfSetting<CR>|"
nnoremap ;pr<CR>  :<c-u>PfRevert<CR>|"
nnoremap ;pe<CR>  :<c-u>PfEdit<CR>|"
nnoremap ;pE<CR>  :<c-u>PfAdd<CR>|"
nnoremap ;wd<CR>  :<c-u>PfDiff<CR>|"
nnoremap ;pi<CR>  :<C-u>Unite p4_info<CR>|"
nnoremap ;pt<CR>  :<C-u>Unite p4_clients<CR>|"
nnoremap ;pc<CR>  :<C-u>Unite p4_changes_pending<CR>|"
nnoremap ;ps<CR>  :<C-u>Unite p4_changes_submitted<CR>|"
nnoremap ;po<CR>  :<C-u>Unite p4_opened<CR>|"
nnoremap ;pj<CR>  :<C-u>Unite p4_jobs<CR>|"
nnoremap ;ph<CR>  :<C-u>Unite p4_have<CR>|"
nnoremap ;pa<CR>  :<C-u>Unite p4_annotate<CR>|"
nnoremap ;pC<CR>  :<C-u>Unite p4_changes_pending_reopen<CR>|"
nnoremap ;pte<CR> :<C-u>Unite p4_template<CR>|"
"}}}
"@plugin - Shogo
"Shogo - unite{{{
let g:unite_enable_start_insert = 0
let g:unite_source_history_yank_enable = 0
nnoremap ;ur<CR>  :<C-u>UniteResume<CR>
nnoremap ;us<CR>  :<C-u>Unite source<CR>
nnoremap ;um<CR>  :<C-u>Unite file_mru<CR>
nnoremap ;uf<CR>  :<C-u>Unite file_rec<CR>
nnoremap ;ut<CR>  :<C-u>Unite tag<CR>
nnoremap ;ub<CR>  :<C-u>Unite buffer<CR>
nnoremap ;ubt<CR> :<C-u>Unite buffer_tags<CR>
nnoremap ;uh<CR>  :<C-u>Unite history/yank<CR>
nnoremap ;ul<CR>  :<C-u>Unite line/fast<CR>
nnoremap ;uj<CR>  :<C-u>Unite jump<CR>
nnoremap ;uK<CR>  :<C-u>Unite bookmark<CR>
nnoremap ;uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>
nnoremap ;cw<CR>  :<C-u>Unite qf<CR>
nnoremap ;ue<CR>  :<C-u>Unite -immediately -input=<C-r>=expand("<cword>")<CR> outline<CR>
nnoremap ;et<CR>  :<C-u>Unite everything<CR>
nnoremap ;up<CR>  :<C-u>Unite settings_var<CR>
nnoremap ;upa<CR> :<C-u>Unite settings_var_all<CR>
nnoremap ;upt<CR> :<C-u>Unite settings_ex<CR>

"}}}
"Shogo - vimfiler{{{
let g:vimfiler_as_default_explorer = 1   " # 初期filer
let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
"}}}
"Shogo - neocomplcache{{{
let g:neosnippet#snippets_directory = $VIMWORK.'/snippets'.','.$LOCALWORK.'/snippets'                    " # snippet ファイル作成場所
let g:neocomplcache_enable_at_startup = 1                                                                " # 起動
nnoremap ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>|"
imap <C-s>     <PLUG>(neocomplcache_start_unite_complete)|"                                              " # Uniteを使用する
imap <C-Space> <PLUG>(neosnippet_expand_or_jump)|"                                                       " # Snippetを使用する
"}}}
"@script
" nnoremap - cscope "{{{
set cscopequickfix=s-,g-,d-,c-,t-,e-,f-,i-
nnoremap <C-\>L :cs kill -1<CR>:call system("cscope -b -R")<CR>:cs add cscope.out<CR>|"
nnoremap <C-\>i :cs find i <C-R>=expand("%:p:t")<CR><CR>|"
nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"

nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
nnoremap <C-\>f :cs find f <C-R>=expand("%:p:t")<CR><CR>|"
nnoremap <C-\>l :cs kill -1<CR>:cs add cscope.out<CR>|"
nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"

nnoremap ;cv<CR> :<C-u>cs f s <C-R>+<CR>|"
nnoremap ;cc<CR> :<C-u>cs f s <C-R>"<CR>|"

nnoremap <C-\>K :call system("ctags -R")<CR>|"
" }}}
" grep "{{{
let mygrepprg = 'grep'
nnoremap <C-\>v :RGrep <C-R>=expand("<cword>")<CR> *.vim\ *.c\ *.h<CR>
nnoremap ;ug<CR> :<C-u>call unite#start([['grep', '*', '--include="*.c" --include="*.h" --include="*.vim"', '<C-r>=expand('<cword>')<CR>']])<CR>
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

