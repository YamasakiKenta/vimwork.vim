" --------------------
" dain.vim
" --------------------
if &compatible
    set nocompatible
endif

set rtp^=~/.cache/plugin/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('~/.cache/plugin/dein.vim')
call dein#add('~/.cache/plugin/vimwork.vim', {'rtp': ''})
call dein#add('Shougo/neomru.vim')
call dein#add('Yggdroot/indentLine') " 2014.12.20
call dein#add('thinca/vim-qfreplace')
call dein#add('tpope/vim-fugitive')
" call dein#add('thinca/vim-prettyprint') " 2016.04.20

" color
call dein#add('ujihisa/unite-colorscheme')
" call dein#add('morhetz/gruvbox')
" call dein#add('altercation/vim-colors-solarized')
" call dein#add('w0ng/vim-hybrid')
" call dein#add('sjl/badwolf') " 2016.6.23
" call dein#add('dracula/vim') " 2016.6.27

call dein#add('itchyny/vim-parenmatch')
if dein#tap('vim-parenmatch')
        let g:loaded_matchparen = 1
endif

" call dein#add('Shougo/neocomplete.vim')
if dein#tap('neocomplete.vim')
    call dein({
                \ 'disabled' : !has('lua')&&0,
                \ 'vim_version' : '7.3.885'
                \ })
    function! dein.hooks.on_source(bundle)
      call neocomplete#custom#source('file', 'disabled_filetypes', {'_':1})
      let g:neocomplete#enable_at_startup = 1
      let g:neocomplete#sources = {}
      let g:neocomplete#sources._ = ['snippets_complete']
      imap <C-k>  <Plug>(neocomplete_start_unite_complete)
      imap <C-q>  <Plug>(neocomplete_start_unite_quick_match)
    endfunction
endif

" call dein#add('Shougo/vimfiler', {'rev': 'ver.4.1', 'frozen': 1}) " 2016.01.12 : 最新ではパスが表示されない
call dein#add('Shougo/vimfiler') " 2016.01.12 - ver.4.1は安定している
if dein#tap('vimfiler')
    let g:vimfiler_as_default_explorer  = 1  " # 初期filer
    let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
endif

call dein#add('thinca/vim-quickrun')
if dein#tap('vim-quickrun')
    let g:quickrun_config = {
            \ 'cpp' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'type': 'c/gcc',
            \ },
            \ 'c' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'type': 'c/gcc',
            \ },
            \ 'cs' : {
            \ 'command': 'dmcs',
            \ 'exec': ['%c %o %s -out:%s:p:r.exe', 'mono %s:p:r.exe %a', 'rm -f %s:p:r.exe'],
            \ 'tempfile': '%{tempname()}.cs',
            \ },
            \ 'java' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ },
            \ 'php' : {
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'utf-8',
            \ },
            \ '_' : {
            \ 'hook/time/enable' : 1,
            \ 'hook/output_encode/enable' : 1,
            \ 'hook/output_encode/encoding' : 'sjis',
            \ 'debug': 'x',
            \ },
            \ 'vb' : {
            \ 'command': 'cscript',
            \ 'cmdopt': '//Nologo',
            \ 'tempfile': '{tempname()}.vbs',
        \ }
    \ }
endif

call dein#add('lilydjwg/colorizer')
if dein#tap('colorizer')
    let g:colorizer_startup = 0
endif

call dein#add('bronson/vim-trailing-whitespace')
if dein#tap('vim-trailing-whitespace')
    let g:extra_whitespace_ignored_filetypes = [
                \ 'unite'
                \ ]
endif

call dein#add('vim-scripts/Align')
if dein#tap('Align')
    let g:Align_xstrlen = 3
    command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
endif

call dein#add('fuenor/qfixgrep')
if dein#tap('qfixgrep')
    let QFixWin_EnableMode = 1
    let g:QFixWin_QuickFixTitleReg = '\cQuickfix'
    let g:QFixWin_LocationListTitleReg = '\cLocation'
endif

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
if dein#tap('neosnippet')
    let g:neosnippet#snippets_directory = '~/.cache/dein/repos/github.com/YamasakiKenta/vimwork.vim/snippets'
    imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
endif

call dein#add('Shougo/unite.vim')
if dein#tap('unite.vim')
    let g:unite_enable_start_insert = 1
    nmap <leader>u [unite]
    nnoremap [unite]m :<c-u>Unite neomru/file
    nnoremap [unite]r :<c-u>UniteResume
    nnoremap [unite]g :<c-u>Unite file_rec/git
endif

call dein#add('mattn/emmet-vim')
if dein#tap('emmet-vim')
    let g:user_emmet_settings = {
                \ 'variables': {
                \ 'lang' : 'ja'
                \ }
                \ }

    imap <expr><TAB>
                \ emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
                \ :"\<TAB>"
endif

call dein#add('joonty/vdebug', {
    \ 'disabled': has('python')
    \ })
if dein#tap('vdebug')
    let g:vdebug_keymap = {
                \ 'run'               : '<F8>',
                \ 'run_to_cursor'     : '<F1>',
                \ 'step_over'         : '<F10>',
                \ 'step_into'         : '<F11>',
                \ 'step_out'          : '<S-F11>',
                \ 'close'             : '<F6>',
                \ 'detach'            : '<F7>',
                \ 'set_breakpoint'    : '<F9>',
                \ 'get_context'       : '<S-F12>',
                \ 'eval_under_cursor' : '<F12>',
                \ }
endif


call dein#end()
filetype plugin indent on

" ****************************************
" Map
" ****************************************
nnoremap <leader>fp<CR> :<C-u>let @+ = expand("%:p")\|echo @+<CR>|"
nnoremap <leader>ft<CR> :<C-u>let @+ = expand("%:t")\|echo @+<CR>|"
nnoremap <S-Space> za|"
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"
nnoremap <C-n> :<C-u>cn<CR>:e<cr>|"
nnoremap <C-p> :<C-u>cN<CR>:e<cr>|"
nnoremap <C-j> j.|"
nnoremap <C-k> n.|"
nnoremap * :<C-u>set hls<CR>:let @/ = '\<'.expand("<cword>").'\>'\|echo @/<CR>|"
nnoremap + :<C-u>AddSearch <C-r>=expand("<cword>")<CR><CR>:echo @/<CR>|"
vnoremap < <gv|"
vnoremap > >gv|"
nnoremap go yypC
nnoremap gO yyPC
vnoremap / "ay/<c-r>a<cr><c-o>|"

" ****************************************
" command
" ****************************************
let g:plugin_cmdex_disable = 1
cnoremap <C-X> <C-R>=<SID>GetBufferDirectory()<CR>
function! s:GetBufferDirectory()
    let dir = expand('%:p:h')
    return dir . (exists('+shellslash') && !&shellslash ? '\' : '/')
endfunction

nnoremap <C-s> :<C-u>SetNum<CR>|"
command! -narg=0 SetNum call <SID>set_num()

" --------------------
" 連番の作成
" カーソル以降の数字を、前の数字にひとつ加算したものにする (マイナスは、考慮しない)
" --------------------
function! s:set_num()

  " カーソル位置の取得
  let pos = getpos(".")
  let lnum = pos[1]
  let col  = pos[2] - 1

  " =====================
  " 前の行
  " =====================
  let lstr = getline(lnum-1)

  " 数字の取得
  let nums = split(lstr, '\D\+') + [1]

  " =====================
  " 現在の行
  " =====================
  let lstr  = getline(lnum)

  " ====================
  " 数字の末尾で分割
  " --------------------
  " 1 : aaa12(3)4aaaa  : () カーソル位置
  " 2 : aaa1234 , aaaa : カーソルより後ろの数字の末尾で分割
  " 3 : aaa     , aaa  : 数字の削除
  " ====================
  let col = match(lstr, '\d\D\|\d$', col) + 1

  " カーソル後に数字がある場合は処理する
  if col > 0
    " 数字の前の文字の取得
    let head = strpart(lstr, 0, col)

    " 数字の数を抽出
    let head_ncnt = len(split(head, '\D\+')) - 1

    " 文の取得
    " 変更する部分の数字は削除する
    let str = [
          \ substitute(head, '\d\+$','',''),
          \ get(nums, head_ncnt, 0) + 1,
          \ strpart(lstr, col),
          \ ]

    " 書き込み
    call setline(lnum, join(str,''))

    " カーソル移動
    call cursor(lnum, len(str[0].str[1]))
  endif

endfunction

command! -narg=* AddSearch call <SID>addSearch(<f-args>)
function! s:addSearch(...)
    if a:0 > 0
        let @/ = @/.'\|\<'.join(a:000,'\>\|\<').'\>'
    endif
endfunction

" --------------------
" set
" --------------------

" http://lambdalisue.hatenablog.com/entry/2015/12/25/000046
let g:loaded_gzip = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:loaded_rrhelper = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

" let php_sql_query = 1
" let php_baselib = 1
" let php_htmlInStrings = 1
" let php_oldStyle = 1
" let php_asp_tags = 1
" let php_noShortTags = 1
" let php_parent_error_close = 1
" let php_parent_error_open = 1
" let php_folding = 1
" let php_sync_method = -1

set autoread
set ve=block
set nowrap
set noswapfile
set number
set fdm=marker
set tabstop=4
set shiftwidth=4
set expandtab
set list lcs=tab:.\ |
set nf=""
set viminfo+=n~/.cache/viminfo
" set wildmode=longest:full,full

" vnoremap / "ay/<c-r>a<cr><c-o>
" nnoremap <leader>cg :<c-u>exe('cd '.system('git rev-parse --show-cdup'))

set backupdir=~/.cache/bak
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir))
endif

aug vimwork
    au!
    au BufNewFile,BufRead *.tag setf html
aug END

if has('persistent_undo')
    set noudf
    set undodir=~/.cache/undo
    if !isdirectory(expand(&undodir))
        call mkdir(expand(&undodir))
    endif
endif

