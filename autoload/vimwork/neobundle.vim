" =============================================================================
" FILE: neobundle.vim
" Creation Date: 2014/06/25 14:24:50
" Last Modified: 2014/09/25 8:55:41
" =============================================================================
let s:save_cpo = &cpo
set cpo&vim

function! vimwork#neobundle#init()
endfunction

if has("vim_starting")
    set rtp+=~/.vim/bundle/neobundle.vim
endif
call neobundle#rc()

" Test
NeoBundle 'hail2u/vim-css3-syntax'      , { 'stay_same' : 1 }
" NeoBundle 'taichouchou2/html5.vim'      , { 'stay_same' : 1 }
NeoBundle 'taichouchou2/vim-javascript' , { 'stay_same' : 1 }
NeoBundle 'osyo-manga/vim-over'         , { 'stay_same' : 1 }
NeoBundle 'voi/unite-ctags'
NeoBundle 'vim-scripts/taglist.vim'

" NeoBundle 'sjl/gundo.vim'                             , { 'stay_same' : 1 }
" NeoBundle 'LeafCage/unite-gvimrgb'                    , { 'stay_same' : 1 }
" NeoBundle 'pasela/unite-webcolorname'                 , { 'stay_same' : 1 }
" NeoBundle 'pangloss/vim-javascript'                   , { 'stay_same' : 1 }
" NeoBundle 'nathanaelkane/vim-indent-guides'           , { 'stay_same' : 1 }
NeoBundleLazy 'scrooloose/syntastic'                      , { 'stay_same' : 1 }

" textobj
" NeoBundle 'RyanMcG/vim-textobj-dash'                               "| ダッシュ記号の間                               | a-, i-
" NeoBundle 'akiyan/vim-textobj-php'                                 "| phpタグに囲まれた部分                          | aP, iP
" NeoBundle 'akiyan/vim-textobj-xml-attribute'                       "| XML の属性                                     | axa, ixa
" NeoBundle 'anyakichi/vim-textobj-ifdef2'                           "| #ifdef                                         | a#, i#
" NeoBundle 'bps/vim-textobj-python'                                 "| Python                                         | af, if
" NeoBundle 'deris/vim-textobj-enclosedsyntax'                       "| Perl や Ruby の正規表現                        | aq, iq
" NeoBundle 'deris/vim-textobj-headwordofline'                       "| 行の先頭の word                                | ah, ih
" NeoBundle 'deton/textobj-mbboundary.vim'                           "| ASCII文字とマルチバイト文字の境界を区切り      | am, im
" NeoBundle 'gilligan/textobj-lastpaste'                             "| 直前に変更またはヤンクされたテキスト           | ip
" NeoBundle 'glts/vim-textobj-indblock'                              "| インデントの空白行                             | ao, io
" NeoBundle 'h1mesuke/textobj-wiw'                                   "| snake_case 上の word                           | a,w, i,w
" NeoBundle 'hchbaw/textobj-motionmotion.vim'                        "| 任意の2つの motion の間                        | am, im
" NeoBundle 'https://bitbucket.org/anyakichi/vim-textobj-xbrackets'  "| x() や x<> など                                | axb, ixb
" NeoBundle 'kana/vim-textobj-datetime'                              "| 日付と時刻                                     | ada, ida
" NeoBundle 'kana/vim-textobj-django-template'                       "| django_template                                | adb, idb
" NeoBundle 'kana/vim-textobj-entire'                                "| バッファ全体                                   | ae, ie
" NeoBundle 'kana/vim-textobj-fold'                                  "| fold                                           | az, iz
" NeoBundle 'kana/vim-textobj-function'                              "| 関数内                                         | af, if
" NeoBundle 'kana/vim-textobj-indent'                                "| カーソル位置と同じインデント                   | al, il
" NeoBundle 'kana/vim-textobj-jabraces'                              "| 「foo」 or 【bar】など                         | ajb, ijb
" NeoBundle 'kana/vim-textobj-lastpat'                               "| 最後に検索されたパターン                       | a/, i/
" NeoBundle 'kana/vim-textobj-line'                                  "| カーソル行                                     | al, il
" NeoBundle 'kana/vim-textobj-syntax'                                "| diff(1)                                        | adf, idf
" NeoBundle 'kana/vim-textobj-syntax'                                "| アンダースコアの間                             | a_, i_
" NeoBundle 'kana/vim-textobj-syntax'                                "| シンタックス                                   | ay, iy
" NeoBundle 'kana/vim-textobj-user'                                  "| textobj のベース
" NeoBundle 'mattn/vim-textobj-cell'                                 "| 前後のスペースを取り除いたカーソル行           | ac, ic
" NeoBundle 'mattn/vim-textobj-url'                                  "| URL                                            | au, iu
" NeoBundle 'mjbrownie/html-textobjects'                             "| HTML                                           | ahf, ihf
" NeoBundle 'osyo-manga/vim-textobj-context'                         "| 別の filetype のコンテキスト                   | icx
" NeoBundle 'osyo-manga/vim-textobj-multiblock'                      "| 任意の複数の括弧のいずれか                     | asb, isb
" NeoBundle 'rbonvall/vim-textobj-latex'                             "| LaTeX                                          | ae, ie
" NeoBundle 'rhysd/vim-textobj-continuous-line'                      "| 行継続を用いている行                           | av, iv
" NeoBundle 'rhysd/vim-textobj-lastinserted'                         "| テキストオブジェクトとして最後に挿入された範囲 | au, iu
" NeoBundle 'rhysd/vim-textobj-ruby'                                 "| Ruby のブロック                                | arr, brr
" NeoBundle 'saihoooooooo/vim-textobj-space'                         "| 連続したスペース                               | aS, iS
" NeoBundle 'sgur/vim-textobj-parameter'                             "| 関数の引数                                     | a, i,
" NeoBundle 'thinca/vim-textobj-between'                             "| 任意の区切り文字                               | af, if
" NeoBundle 'thinca/vim-textobj-comment'                             "| コメント                                       | ac, ic
" NeoBundle 'thinca/vim-textobj-function-javascript'                 "| JavaScript の関数内                            | af, if
" NeoBundle 'thinca/vim-textobj-function-perl'                       "| Perl の関数内                                  | af, if
" NeoBundle 'vimtaku/vim-textobj-keyvalue'                           "| ハッシュの key と value                        | dak, dik,  dav, div

" FileType
" NeoBundle 'rking/ag.vim'
" NeoBundle 'osyo-manga/vim-precious'                               "| FileTypeを切り替える
" NeoBundle 'shawncplus/php.vim'
"
" YamasakiKenta
NeoBundleFetch 'YamasakiKenta/vimwork.vim'
NeoBundleLazy 'YamasakiKenta/unite-setting-ex.vim' , {'stay_same' : 1 }
NeoBundleLazy 'YamasakiKenta/unite-setting.vim'    , {'stay_same' : 1 }
NeoBundleLazy 'YamasakiKenta/unite-perforce.vim'   , {'stay_same' : 1 }
NeoBundleLazy 'YamasakiKenta/chain-file.vim'       , {'stay_same' : 1 }
NeoBundleLazy 'YamasakiKenta/tree.vim'             , {'stay_same' : 1 }
NeoBundleLazy 'YamasakiKenta/tab-diff.vim'         , {'stay_same' : 1 }

" rbtnn
" NeoBundle 'rbtnn/rabbit-ui.vim'                       , { 'stay_same' : 1 }
" NeoBundleLazy 'rbtnn/puyo.vim'
NeoBundleLazy 'rbtnn/vbnet_indent.vim'       , {'stay_same' : 1 }

" vim-scripts
" NeoBundle 'vim-scripts/Better-Javascript-Indentation' , { 'stay_same' : 1 }
NeoBundleLazy 'vim-scripts/CCTree'           , {'stay_same' : 1 }
NeoBundleLazy 'vim-scripts/Align'            , {'stay_same' : 1 }

" thinca
" NeoBundleLazy 'thinca/vim-ref'
NeoBundle 'thinca/vim-qfreplace'           , {'stay_same' : 1 }
NeoBundle 'thinca/vim-partedit'              , {'stay_same' : 1 }
NeoBundleLazy 'thinca/vim-quickrun'          , {'stay_same' : 1 }

" Shougo
" NeoBundle 'Shougo/context_filetype.vim',  { 'stay_same' : 1 }
" NeoBundleFetch 'Shougo/shougo-s-github'
" NeoBundleLazy 'Shougo/vimfiler', 'ver.4.0'
" NeoBundleLazy 'Shougo/vimproc.vim' " gvimでは、初期のやつを使用する
" NeoBundleLazy 'Shougo/vinarise.vim'
NeoBundleLazy  'Shougo/neocomplete.vim'
NeoBundle      'Shougo/neosnippet'
NeoBundle      'Shougo/neosnippet-snippets.git'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleLazy  'Shougo/neomru.vim'
NeoBundleLazy  'Shougo/unite-outline'
NeoBundleLazy  'Shougo/unite.vim'
NeoBundleLazy  'Shougo/vimfiler'
NeoBundleLazy  'Shougo/vimshell.vim'

" color
NeoBundle 'endel/vim-github-colorscheme'        , { 'stay_same' : 1 }
NeoBundle 'hukl/Smyck-Color-Scheme'             , { 'stay_same' : 1 }
NeoBundle 'altercation/vim-colors-solarized'    , { 'stay_same' : 1 }
NeoBundle 'cocopon/colorswatch.vim'             , { 'stay_same' : 1 }
NeoBundle 'cocopon/iceberg.vim'                 , { 'stay_same' : 1 }
NeoBundle 'gh:svjunic/RadicalGoodSpeed.vim.git' , { 'stay_same' : 1 }
NeoBundle 'jonathanfilip/vim-lucius'            , { 'stay_same' : 1 }
NeoBundle 'jpo/vim-railscasts-theme'            , { 'stay_same' : 1 }
NeoBundle 'lazz/vim-colorschemes'               , { 'stay_same' : 1 }
NeoBundle 'nanotech/jellybeans.vim'             , { 'stay_same' : 1 }
NeoBundle 'tomasr/molokai'                      , { 'stay_same' : 1 }
NeoBundle 'vim-scripts/Wombat'                  , { 'stay_same' : 1 }
NeoBundle 'vim-scripts/chlordane.vim'           , { 'stay_same' : 1 }
NeoBundle 'vim-scripts/rdark'                   , { 'stay_same' : 1 }
NeoBundle 'vim-scripts/summerfruit256.vim'      , { 'stay_same' : 1 }
NeoBundle 'vim-scripts/twilight'                , { 'stay_same' : 1 }
NeoBundle 'w0ng/vim-hybrid'                     , { 'stay_same' : 1 }

" git
" NeoBundle 'sgur/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'


" NeoBundle
" NeoBundle 'lilydjwg/colorizer' " CSS PREVIEW ( 重い )
" NeoBundle 'morhetz/gruvbox'
" NeoBundle 'violetyk/cake.vim'
NeoBundle 'fuenor/qfixgrep'                , {'stay_same' : 1 }

" Unite
NeoBundleLazy 'osyo-manga/unite-quickfix'          , {'stay_same' : 1 }
NeoBundleLazy 'pasela/unite-webcolorname'          , {'stay_same' : 1 }
NeoBundleLazy 'sgur/unite-everything'              , {'stay_same' : 1 }
NeoBundleLazy 'tsukkee/unite-tag'                  , {'stay_same' : 1 }
NeoBundleLazy 'ujihisa/unite-colorscheme'          , {'stay_same' : 1 }


" NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundle 'mattn/emmet-vim'                  , {'stay_same' : 1 }
NeoBundleLazy 'itchyny/lightline.vim'        , {'stay_same' : 1 }
NeoBundleLazy 'kien/rainbow_parentheses.vim' , {'stay_same' : 1 }

function! s:is_win()
    return has('GUI') && ( has('win32') || has('win64') )
endfunction
if neobundle#tap('vim-indent-guides') "{{{
    let g:indent_guides_enable_on_vim_startup=1
    let g:indent_guides_start_level=2
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
    "C:\xampp\htdocs\yamasaki\cake\app\Model\MySampleData.php
endif "}}}
if neobundle#tap('emmet-vim') "{{{
    call neobundle#config({'autoload': {
                \ 'filetypes': ['html','css','php'],
                \ 'mappings' : [
                \ '<Plug>(emmet-',
                \ '<Plug>(emmmet-',
                \ '<tab>',
                \ ],
                \ }})
    function! neobundle#tapped.hooks.on_source(bundle)
        " let g:user_emmet_leader_key = '<c-\>'
    endfunction
endif "}}}
if neobundle#tap('vimfiler') "{{{
    call neobundle#config({
                \ 'depends' : 'Shougo/unite.vim',
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
    function! neobundle#tapped.hooks.on_source(bundle)
        " For snippet_complete marker.
        " Plugin key-mappings.
        " imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        " smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        " xmap <C-k>     <Plug>(neosnippet_expand_target)
        xmap <C-l>     <Plug>(neosnippet_start_unite_snippet_target)
        imap <C-Space> <PLUG>(neosnippet_expand_or_jump)
        imap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-TAB>"
    endfunction
endif "}}}
if neobundle#tap('qfixgrep') "{{{
    call neobundle#config({'autoload': {'commands': ['Grep', 'RGrep']}})
    let QFix_CloseOnJump = 1
    let QFixWin_EnableMode = 1
    let mygrepprg = 'grep'
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
        call neobundle#config({'build': {
                    \ 'windows' : 'make -f make_mingw32.mak',
                    \ 'cygwin'  : 'make -f make_cygwin.mak',
                    \ 'mac'     : 'make -f make_mac.mak',
                    \ 'unix'    : 'make -f make_unix.mak',
                    \ }})
    endif
endif "}}}
if neobundle#tap('tab-diff.vim') "{{{
    nnoremap <leader>dy<CR> :<C-u>TabDiffStart<CR>
    nnoremap <leader>dn<CR> :<C-u>TabDiffEnd<CR>
    nnoremap <leader>do<CR> :<C-u>TabDiffOrig<CR>
    call neobundle#config({'autoload': {'commands' : ['TabDiffStart','TabDiffEnd','TabDiffOrig']}})
endif "}}}
if neobundle#tap('neocomplete.vim') "{{{
    if !(has('lua') && (v:version > 703 || v:version == 703 && has('patch885')))
        call neobundle#config({'lazy':0})
    endif
    function! neobundle#tapped.hooks.on_source(bundle)
        call neocomplete#custom#source('file', 'disabled_filetypes', {'_':1})
        " let g:neocomplete#enable_at_startup = 1
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
    nnoremap [unite]g  :<C-u>Unite -buffer-name=grep grep:**/*|"
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
if neobundle#tap('syntastic') "{{{syntastic
    call neobundle#config({'autoload': {'commands': 'SyntasticCheck'}})
endif "}}}syntastic
if 0
if neobundle#tap('unite-everything') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'everything'}})
endif "}}}
if neobundle#tap('ujihisa/unite-colorscheme') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'colorscheme'}})
endif "}}}
if neobundle#tap('unite-quickfix') "{{{
    call neobundle#config({'autoload': {'commands': 'quickfix'}})
endif "}}}
if neobundle#tap('unite-tag') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'tag'}})
endif "}}}
if neobundle#tap('unite-outline') "{{{
    call neobundle#config({'autoload': {'unite_sources': 'outline'}})
endif "}}}
if neobundle#tap('pasela/unite-webcolorname') "{{{
    " call neobundle#config({'autoload': {'unite_sources': 'webcolorname'}})
endif "}}}
endif
call neobundle#call_hook('on_source')
filetype plugin indent on


function! vimwork#neobundle#is_emmet(str)
    let list = [
                \ 'html',
                \ ]
endfunction

if 1  "{{{ NeoSnip
    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \ :pumvisible() ? "\<C-n>"
                \ :emmet#isExpandable()? emmet#expandAbbrIntelligent("\<tab>")
                \ :"\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)"
                \ :"\<TAB>"
    imap <expr><C-k>  pumvisible()?
                \ "<Plug>(neocomplete_start_unite_complete)"
                \ :"<C-k>"
    imap <expr><C-q>  pumvisible()?
                \ "\<Plug>(neocomplete_start_unite_quick_match)"
                \ :"\<C-q>"
    imap <expr><TAB>
                \ emmet#isExpandable()
                \ ? emmet#expandAbbrIntelligent("\<tab>")
                \ : neosnippet#expandable_or_jumpable()
                \ ? "\<Plug>(neosnippet_expand_or_jump)"
                \ :"\<TAB>"
endif  "}}}


if exists('s:save_cpo')
    let &cpo = s:save_cpo
    unlet s:save_cpo
endif
