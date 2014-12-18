" =============================================================================
" FILE: neobundle.vim
" Creation Date: 2014/06/25 14:24:50
" Last Modified: 2014/12/15 00:02:25
" =============================================================================
let s:save_cpo = &cpo
set cpo&vim

function! vimwork#neobundle#init()
endfunction

if has('vim_starting')
    set nocompatible
    set rtp+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin()

" syntax

" git
NeoBundle 'gregsexton/gitv'

" Indent
NeoBundle 'vim-scripts/JavaScript-Indent' " 2014.12.17
NeoBundle 'nathanaelkane/vim-indent-guides'

" Normal
NeoBundle 'YamasakiKenta/jq-wrapper.vim' " 2014.12.17
NeoBundle 'osyo-manga/vim-over' "2014.12.16
" NeoBundle 'haya14busa/incsearch.vim' " 2014.12.16 - 初動がきになる
NeoBundle 'lilydjwg/colorizer'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'jacquesbh/vim-showmarks'
NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'fuenor/qfixgrep'
" NeoBundle 'manicmaniac/vim'
" NeoBundle 'toyamarinyon/vim-swift'
" NeoBundle 'hail2u/vim-css3-syntax'
" NeoBundle 'taichouchou2/vim-javascript'
" NeoBundle 'osyo-manga/vim-over'
" NeoBundle 'voi/unite-ctags'
" NeoBundleLazy 'scrooloose/syntastic'
" NeoBundleLazy 'thinca/vim-prettyprint'
" NeoBundle 'chrisgillis/vim-bootstrap3-snippets'
" NeoBundle 'digitaltoad/vim-jade'

" YamasakiKenta
NeoBundleFetch 'YamasakiKenta/vimwork.vim'
" NeoBundleLazy 'YamasakiKenta/unite-setting-ex.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting.vim'
" NeoBundleLazy 'YamasakiKenta/unite-perforce.vim'
" NeoBundleLazy 'YamasakiKenta/chain-file.vim'
" NeoBundleLazy 'YamasakiKenta/tree.vim'
" NeoBundleLazy 'YamasakiKenta/tab-diff.vim'

" rbtnn
" NeoBundle 'rbtnn/rabbit-ui.vim'
" NeoBundleLazy 'rbtnn/puyo.vim'
" NeoBundleLazy 'rbtnn/vbnet_indent.vim'

" vim-scripts
" NeoBundleLazy 'vim-scripts/taglist.vim'
" NeoBundleLazy 'vim-scripts/CCTree'
NeoBundleLazy 'vim-scripts/Align'

" thinca
" NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-partedit'
NeoBundleLazy 'thinca/vim-quickrun'

" Shougo
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets.git'
NeoBundleFetch 'Shougo/neobundle.vim'
" NeoBundle      'Shougo/neocomplete.vim'
" NeoBundle      'Shougo/neocomplcache.vim'
NeoBundleLazy  'Shougo/neomru.vim'
NeoBundleLazy  'Shougo/unite-outline'
NeoBundleLazy  'Shougo/unite.vim'
NeoBundleLazy  'Shougo/vimfiler'
NeoBundleLazy  'Shougo/vimshell.vim'
NeoBundleLazy  'shougo/vimproc.vim'

" NeoSnip
" NeoBundle 'violetyk/neosnippet-cakephp2'

" color
NeoBundleLazy 'ciaranm/inkpot'
NeoBundleLazy 'endel/vim-github-colorscheme'
NeoBundleLazy 'hukl/Smyck-Color-Scheme'
NeoBundleLazy 'altercation/vim-colors-solarized'
NeoBundleLazy 'cocopon/colorswatch.vim'
NeoBundleLazy 'cocopon/iceberg.vim'
NeoBundleLazy 'svjunic/RadicalGoodSpeed.vim'
NeoBundleLazy 'jonathanfilip/vim-lucius'
NeoBundleLazy 'jpo/vim-railscasts-theme'
NeoBundleLazy 'lazz/vim-colorschemes'
NeoBundleLazy 'nanotech/jellybeans.vim'
NeoBundleLazy 'tomasr/molokai'
NeoBundleLazy 'vim-scripts/Wombat'
NeoBundleLazy 'vim-scripts/chlordane.vim'
NeoBundleLazy 'vim-scripts/rdark'
NeoBundleLazy 'vim-scripts/summerfruit256.vim'
NeoBundleLazy 'vim-scripts/twilight'
NeoBundleLazy 'w0ng/vim-hybrid'

" Unite
" NeoBundleLazy 'osyo-manga/unite-quickfix'
NeoBundleLazy 'pasela/unite-webcolorname'
" NeoBundleLazy 'sgur/unite-everything'
NeoBundleLazy 'tsukkee/unite-tag'
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundle 'itchyny/lightline.vim'
NeoBundleLazy 'kien/rainbow_parentheses.vim'
NeoBundleLazy 'tacroe/unite-mark'

" Util
function! s:is_win() "{{{
    return has('GUI') && ( has('win32') || has('win64') )
endfunction "}}}
" neobundle#tap
if neobundle#tap('incsearch.vim') "{{{
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
endif "}}}
if neobundle#tap('vim-showmarks') "{{{
  set viminfo='50,\"1000,:0,n~/.vim/viminfo
  " set foldmethod=marker
  let g:showmarks_marks_notime = 1
  let g:unite_source_mark_marks = '01abcABCDEFGHIJKLNMOPQRSTUVWXYZ'
  let g:showmarks_enable       = 0
  if !exists('g:markrement_char')
    let g:markrement_char = [
          \     'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
          \     'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
          \     'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
          \     'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
          \ ]
  en

  fu! s:AutoMarkrement()
    if !exists('b:markrement_pos')
      let b:markrement_pos = 0
    else
      let b:markrement_pos = (b:markrement_pos + 1) % len(g:markrement_char)
    en
    exe 'mark' g:markrement_char[b:markrement_pos]
    echo 'marked' g:markrement_char[b:markrement_pos]
  endf

  " aug show-marks-sync
    " au!
    " au BufReadPost * sil! ShowMarksOnce
  " aug END

  nn [Mark] <Nop>
  nm <leader>m [Mark]
  nn <silent> [Mark]m :Unite mark<CR>
  nn [Mark] :<C-u>call <SID>AutoMarkrement()<CR><CR>:ShowMarksOnce<CR>
  com! -bar MarksDelete sil :delm! | :delm 0-9A-Z | :wv! | :ShowMarksOnce
  nn <silent>[Mark]d :MarksDelete<CR>
endif "}}}
if neobundle#tap('vim-bootstrap3-snippets')  "{{{
    " \ 'depends' : 'Shougo/neosnippet',
    call neobundle#config({
                \ })
    function! neobundle#tapped.hooks.on_source(bundle) 

    endfunction
endif  "}}}
if neobundle#tap('vim-indent-guides') "{{{
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
    let g:indent_guides_guide_size=1
endif "}}}
if neobundle#tap('rabbit-ui.vim') "{{{
    function! s:edit_csv(path)
        call writefile(map(rabbit_ui#gridview(map(readfile(a:path),'split(v:val,",",1)')), "join(v:val, ',')"), a:path)
    endfunction
    command! -nargs=1 EditCSV  :call <sid>edit_csv(<q-args>)
endif "}}}
if neobundle#tap('vim-precious') "{{{
endif "}}}
if neobundle#tap('chain-file.vim') "{{{
    call neobundle#config({'autoload': {'commands': 'ChainFile'}})
    let g:chain_dict = { '__file' : {
                \ 'win7.vim' : '../autoload/vimwork.vim',
                \ 'autoload/vimwork.vim' : '../local/win7.vim',
                \ },'__pattern': [
                \ { 'before': 'autoload\(/.*\)\?/\(.*\.vim$\)'         , 'after': 'plugin/**/\2'},
                \ { 'before': 'plugin\(/.*\)\?/\(.*\.vim\)'            , 'after': 'autoload/**/\2'},
                \ { 'before': '/coffee/\(.*\)\.coffee$'                , 'after': '/*/\1.js'},
                \ { 'before': '/coffee2js/\(.*\)\.js$'                 , 'after': '/coffee/\1.coffee'},
                \ { 'before': '/View/\(.*\)s/\(.*\).ctp$'              , 'after': '/Model/\1.php'},
                \ { 'before': '/Model/\(.*\).php$'                     , 'after': '/Controller/\1sController.php'},
                \ { 'before': '/Controller/\(.*\)Controller.php$'      , 'after': '/View/\1/index.ctp'},
                \ { 'before': '\(\w*\).\(html\|php\)$'                 , 'after': '/js/\1.js'},
                \ { 'before': '\(\w*\).js$'                            , 'after': '../\1.html'},
                \ ],'__extension' : {
                \ 'sql': 'xml',
                \ 'xml': 'sql',
                \ 'cpp': 'h',
                \ 'h'  : 'cpp',
                \ },
                \ }
    nnoremap <leader>a<CR>  :<C-u>ChainFile<CR>|"
    "C:\xampp\htdocs\yamasaki\cake\app\Model\MySampleData.php
endif "}}}
if neobundle#tap('emmet-vim') "{{{
    call neobundle#config({'autoload': {
                \ 'filetypes': ['html','css','php'],
                \ }})
    function! neobundle#tapped.hooks.on_source(bundle)
"         imap <expr><TAB> 
"                     \ emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
"                     \ :"\<TAB>"
    endfunction
endif "}}}
if neobundle#tap('vimfiler') "{{{
    " \ 'depends' : 'Shougo/unite.vim',
    call neobundle#config({
                \ 'autoload' : {
                \ 'commands' : [
                \ 'VimFiler',
                \ 'VimFilerExplorer',
                \ 'Edit',
                \ 'Write',
                \ 'Read',
                \ 'Source'],
                \ 'mappings' : '<Plug>(vimfiler_',
                \ 'explorer' : 1,
                \ }})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:vimfiler_as_default_explorer  = 1  " # 初期filer
        let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
    endfunction
endif "}}}
if neobundle#tap('neosnippet') "{{{
    let s:dir = substitute(substitute(expand("<sfile>"), '\\', '\/', 'g'), '/autoload/.*$', '', '')
    let g:neosnippet#snippets_directory = s:dir.'/snippets'
    function! neobundle#tapped.hooks.on_source(bundle)
        imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
    endfunction
endif "}}}
if neobundle#tap('qfixgrep') "{{{
    call neobundle#config({'autoload': {'commands': ['Grep', 'RGrep']}})
    let mygrepprg = 'grep'
    let QFixWin_EnableMode = 1
    let QFix_PreviewEnable = 0
    let g:QFixWin_QuickFixTitleReg = '\cQuickfix\|\[Listo de rapidriparoj\]\|\[Lista de cambios rápidos\]\|\[Listo de rapidriparoj\]\|\[Liosta Ceartúchán Tapa\]\|\[Список быстрых исправлений\]\|\[Список виправлень\]'
endif "}}}
if neobundle#tap('Align') "{{{
    call neobundle#config({'autoload': {'commands': ['Align', 'ALign'], 'mappings': '\tsp'}})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:Align_xstrlen = 3
        command! -bang -range -nargs=* ALign <line1>,<line2>call Align#Align(<bang>0,<q-args>)
    endfunction
endif "}}}
if neobundle#tap('vimproc.vim') "{{{
    if !s:is_win()
        call neobundle#config({'lazy':0})
        call neobundle#config({'build': {
                    \ 'windows' : 'make -f make_mingw32.mak',
                    \ 'cygwin'  : 'make -f make_cygwin.mak',
                    \ 'mac'     : 'make -f make_mac.mak',
                    \ 'unix'    : 'make -f make_unix.mak',
                    \ }})
    else
        call neobundle#config({
                    \ 'disabled':1,
                    \ 'autoload': {},
                    \ })
    endif
endif "}}}
if neobundle#tap('tab-diff.vim') "{{{
    nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
    nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
    nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
    call neobundle#config({'autoload': {'commands' : ['TabDiffStart','TabDiffEnd','TabDiffOrig']}})
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
    call neobundle#config({
                \ 'disabled' : !has('lua')&&0,
                \ 'vim_version' : '7.3.885'
                \ })
    function! neobundle#tapped.hooks.on_source(bundle)
      " call neocomplete#custom#source('file', 'disabled_filetypes', {'_':1})
      " let g:neocomplete#enable_at_startup = 1
      let g:neocomplete#sources = {}
      let g:neocomplete#sources._ = ['snippets_complete']
      imap <C-k>  <Plug>(neocomplete_start_unite_complete)
      imap <C-q>  <Plug>(neocomplete_start_unite_quick_match)
    endfunction
endif "}}}
if neobundle#tap('neocomplcache.vim') "{{{
    call neobundle#config({
                \ 'disabled' : !(!has('lua')&&0),
                \ })
    function! neobundle#tapped.hooks.on_source(bundle)
      " let g:neocomplcache_enable_at_startup = 1
      " let g:neocomplcache_auto_completion_start_length = 3
      " let g:neocomplcache_sources_list = {}
      " let g:neocomplcache_sources_list._ = ['snippets_complete']
      "
      imap <C-k>  <Plug>(neocomplcache_start_unite_complete)
      imap <C-q>  <Plug>(neocomplcache_start_unite_quick_match)
    endfunction
endif "}}}
if neobundle#tap('vim-fugitive') "{{{
    call neobundle#config({'autoload': {'functions': ['fugitive#statusline']}})
endif "}}}
if neobundle#tap('vaxe') "{{{
    call neobundle#config({'autoload': {'filetypes': 'haxe'}})
endif "}}}
if neobundle#tap('vim-coffee-script') "{{{
    aug _vim_coffee_script
        au!
        au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
    aug END
    call neobundle#config({'autoload':{'filetypes': 'coffee'}})
endif "}}}
if neobundle#tap('vim-quickrun') "{{{
    call neobundle#config({'autoload': {'commands': 'QuickRun'}})
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
                \ '_' : {
                \ 'hook/time/enable' : 1,
                \ 'hook/output_encode/enable' : 1,
                \ 'hook/output_encode/encoding' : 'sjis',
				\ 'debug': 'x',
                \ },
                \ }
    " \ 'runner' : 'vimproc',
endif "}}}
if neobundle#tap('vimshell.vim') "{{{
    call neobundle#config({'autoload': {'commands': 'VimShell'}})
endif "}}}
if neobundle#tap('CCTree') "{{{
    call neobundle#config({'autoload': {'filetypes': 'c'}})
endif "}}}
if neobundle#tap('taglist') "{{{
    call neobundle#config({'autoload': {'commands': 'Tlist'}})
endif "}}}
if neobundle#tap('rainbow_parentheses.vim') " {{{
    if s:is_win()
        call neobundle#config({'lazy':0})
        nmap <leader>r [rainbow]
        nnoremap [rainbow]t :RainbowParenthesesToggleAll
        if 0
            aug _vimwork_neobundle_rainbow
                au!
                au VimEnter * RainbowParenthesesToggle
                au Syntax * RainbowParenthesesLoadRound
                au Syntax * RainbowParenthesesLoadSquare
                au Syntax * RainbowParenthesesLoadBraces
            aug END
        endif
    endif
endif "}}}
if neobundle#tap('lightline.vim') "{{{
    if s:is_win()
        " とりあえずOFFにする
        " call neobundle#config({'lazy': 0})
        call vimwork#lightline#init()
    endif
endif "}}}lightline.vim
" Command
if neobundle#tap('ag.vim') "{{{
    call neobundle#config({'autoload': {'commands': 'Ag'}})
    nnoremap <leader>g :Ag <c-r><c-w>
endif "}}}rking/ag.vim
if neobundle#tap('vim-partedit') "{{{
    call neobundle#config({'autoload': {'commands': 'Partedit'}})
endif "}}}thinca/vim-partedit
if neobundle#tap('vinarise.vim') "{{{
    call neobundle#config({'autoload':{'commands': 'Vinarise'}})
endif "}}}
if neobundle#tap('puyo.vim') "{{{
    call neobundle#config({'autoload':{'commands': 'Puyo'}})
endif "}}}
" Unite ( 自動でなる )
if neobundle#tap('unite.vim') "{{{
    nmap <leader>u [unite]
    " nnoremap [unite]uK<CR>  :<C-u>Unite bookmark<CR>|"
    " nnoremap [unite]uM<CR>  :<C-u>Unite directory_mru -default-action=cd<CR>|"
    " nnoremap [unite]ub<CR>  :<C-u>Unite buffer<CR>|"
    " nnoremap [unite]uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>|"
    nnoremap [unite]qf  :<C-u>Unite quickfix quickfix:1 quickfix:2 quickfix:3 quickfix:4|"
    nnoremap [unite]G  :<C-u>UniteResume grep|"
    nnoremap [unite]R  :<C-u>Unite resume|"
    nnoremap [unite]bt :<C-u>Unite buffer_tags|"
    nnoremap [unite]e  :<C-u>Unite outline|"
    nnoremap [unite]c  :<C-u>Unite command|"
    " nnoremap [unite]g  :<C-u>Unite -buffer-name=grep grep:**/*|"
    nnoremap [unite]g  :<C-u>Unite file_rec/git|"
    nnoremap [unite]h  :<C-u>Unite history/yank|"
    nnoremap [unite]j  :<C-u>Unite jump|
    nnoremap [unite]l  :<C-u>Unite line|"
    nnoremap [unite]om :<C-u>Unite output:message|"
    nnoremap [unite]p  :<C-u>Unite settings_var|"
    nnoremap [unite]pa :<C-u>Unite settings_var_all|"
    nnoremap [unite]pt :<C-u>Unite settings/ex|"
    nnoremap [unite]r  :<C-u>UniteResume|"
    nnoremap [unite]s  :<C-u>Unite source|"
    nnoremap [unite]t  :<C-u>Unite tag|"
    nnoremap [unite]m  :<C-u>Unite file_mru directory_mru|"
    nnoremap [unite]f  :<C-u>Unite file_rec:! file/new|" !は.gitignore
    nnoremap [unite]d  :<C-u>Unite directory:**/ directory/new|"
    call neobundle#config({'autoload': {'commands':[{'name': 'Unite', 'complete': 'customlist,unite#complete_source'}]}})
    function! neobundle#tapped.hooks.on_source(bundle)
        let g:unite_enable_start_insert        = 1
        let g:unite_source_history_yank_enable = 1
        let g:unite_source_rec_max_cache_files = 100
        let g:unite_enable_ignore_case = 1
        let g:unite_enable_smart_case = 1

        if executable("ag")
            let g:unite_source_grep_command = 'ag'
            let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
            let g:unite_source_grep_recursive_opt = ''
        elseif executable("findstr")
            let g:unite_source_grep_command       = 'findstr'
            let g:unite_source_grep_default_opts  = '/n'
            let g:unite_source_grep_recursive_opt = '/s'
        endif
        call vimwork#unite#init()
    endfunction
endif "}}}
if neobundle#tap('unite-perforce.vim') "{{{
    nmap <leader>cl<CR> <PLUG>(p4_echo_client_data)
    nmap <leader>cr<CR> <PLUG>(p4_lcd_clentpath)
    nmap <leader>ff<CR> <PLUG>(p4_find)
    nmap <leader>pl<CR> <PLUG>(p4_filelog)
    nmap <leader>pd<CR> <PLUG>(p4_diff)
    nmap <leader>id<CR> <PLUG>(p4_get_depot)
    nnoremap <leader>pan<CR> :<C-u>PfAnnotate<CR>|"
    nnoremap <leader>pda<CR> :<c-u>Unite p4/diff<CR>|"
    nnoremap <leader>pp<CR>  :<c-u>PfSetting<CR>|"
    nnoremap <leader>pr<CR>  :<c-u>PfRevert<CR>|"
    nnoremap <leader>pe<CR>  :<c-u>PfEdit<CR>|"
    nnoremap <leader>pE<CR>  :<c-u>PfAdd<CR>|"
    nnoremap <leader>wd<CR>  :<c-u>PfDiff<CR>|"
    nnoremap <leader>pi<CR>  :<C-u>Unite p4/info<CR>|"
    nnoremap <leader>pt<CR>  :<C-u>Unite p4/clients -default-action=a_p4_client_set<CR>|"
    nnoremap <leader>pc<CR>  :<C-u>Unite p4/changes_pending<CR>|"
    nnoremap <leader>ps<CR>  :<C-u>Unite p4/changes_submitted<CR>|"
    nnoremap <leader>po<CR>  :<C-u>Unite p4/opened<CR>|"
    nnoremap <leader>pj<CR>  :<C-u>Unite p4/jobs<CR>|"
    nnoremap <leader>ph<CR>  :<C-u>Unite p4/have_reset<CR>|"
    nnoremap <leader>pa<CR>  :<C-u>Unite p4/annotate<CR>|"
    nnoremap <leader>pC<CR>  :<C-u>Unite p4/changes_pending_reopen<CR>|"
    nnoremap <leader>pte<CR> :<C-u>Unite p4/template<CR>|"
    nnoremap <leader>pf<CR>  :call unite#start([['p4/files', getcwd()]])<CR>|"
    nnoremap <leader>pF<CR>  :call unite#start([['p4/files', expand("%:h")]])<CR>|"
    call neobundle#config({'autoload': {
                \ 'unite_sources': 'p4',
                \ 'commands': 'Pf',
                \ 'mappings': '<PLUG>(p4_'
                \ }})
endif "}}}
" Unite
if neobundle#tap('neomru.vim') "{{{
    call neobundle#config({'autoload':{'unite_sources': 'file_mru'}})
endif "}}}
if neobundle#tap('unite-setting.vim') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'settings'}})
endif "}}}
if neobundle#tap('unite-setting-ex.vim') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'settings/ex'}})
endif "}}}
if neobundle#tap('syntastic') "{{{
    call neobundle#config({'autoload': {'commands': 'SyntasticCheck'}})
endif "}}}syntastic
if neobundle#tap('unite-colorscheme') "{{{
  let options = {
        \   'autoload': {
        \   'on_source': 'unite-colorscheme'
        \   }
        \ }
  call neobundle#config('inkpot', options)
  call neobundle#config('vim-github-colorscheme', options)
  call neobundle#config('Smyck-Color-Scheme', options)
  call neobundle#config('vim-colors-solarized', options)
  call neobundle#config('colorswatch.vim', options)
  call neobundle#config('iceberg.vim', options)
  call neobundle#config('RadicalGoodSpeed.vim', options)
  call neobundle#config('vim-lucius', options)
  call neobundle#config('vim-railscasts-theme', options)
  call neobundle#config('vim-colorschemes', options)
  call neobundle#config('jellybeans.vim', options)
  call neobundle#config('molokai', options)
  call neobundle#config('Wombat', options)
  call neobundle#config('chlordane.vim', options)
  call neobundle#config('rdark', options)
  call neobundle#config('summerfruit256.vim', options)
  call neobundle#config('twilight', options)
  call neobundle#config('vim-hybrid', options)

endif "}}}
" mult
if neobundle#is_installed('emmet-vim') && neobundle#is_installed('neosnippet') "{{{
      imap <expr><TAB> 
                  \ neosnippet#expandable_or_jumpable() ?
                  \ "\<Plug>(neosnippet_expand_or_jump)"
                  \ : pumvisible() ? "\<C-n>"
                  \ : emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
                  \ :"\<TAB>"
endif 
"}}}
call neobundle#end()
filetype plugin indent on

if exists('s:save_cpo')
    let &cpo = s:save_cpo
    unlet s:save_cpo
endif
