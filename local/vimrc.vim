let s:save_cpo = &cpo
set cpo&vim

"================================================================================ 
" MEMO
"--------------------------------------------------------------------------------
" Vitalize . --name=unite-perforce.vim Mind.Common Mind.Debug
" QuickRun -hook/time/enable 1
"
"================================================================================ 
function! GvimrcInit() "{{{
	set gfn=Terminal:h10:cSHIFTJIS
	set guioptions-=Tm
endfunction
"}}}

function! s:set_neobundle() "{{{
	set nocompatible
	if has("vim_starting")
		set rtp+=~/Dropbox/vim/bundle/neobundle.vim
	endif
	call neobundle#rc(expand("~/Dropbox/vim/bundle"))
	filetype plugin indent on
	call vimwork#neobundle()
endfunction 
"}}}
function! s:set_plugin() "{{{
	set rtp+=~/Dropbox/vim/mind/vimwork.vim
	call s:set_neobundle()
endfunction 
"}}}
function! s:set_header() "{{{
	call s:set_plugin()
	call vimwork#init()
	call vimwork#set_dir(expand('~/Dropbox/vim/mind/vimwork.vim'))

	let g:chain_dict = { '__file' : {
				\ 'vimrc.vim' : '../autoload/vimwork.vim',
				\ 'autoload/vimwork.vim' : '../local/vimrc.vim',
				\ },
				\ '__pattern' : [
				\ { 'before' : 'autoload\(/.*\)\?/\(.*\.vim$\)' , 'after' : 'plugin/**/\2'},
				\ { 'before' : 'plugin\(/.*\)\?/\(.*\.vim\)'   , 'after' : 'autoload/**/\2'},
				\ ],
				\ }
endfunction
"}}}
function! s:map() "{{{
	nmap ;a<CR>   ,a<CR>|"
	nmap ;cl<CR>  ,cl<CR>|"
	nmap ;cr<CR>  ,cr<CR>|"
	nmap ;de<CR>  ,de<CR>|"
	nmap ;dn<CR>  ,dn<CR>|"
	nmap ;do<CR>  ,do<CR>|"
	nmap ;dv<CR>  ,dv<CR>|"
	nmap ;dy<CR>  ,dy<CR>|"
	nmap ;es<CR>  ,es<CR>|"
	nmap ;ff<CR>  ,ff<CR>|"
	nmap ;fp<CR>  ,fp<CR>|"
	nmap ;ft<CR>  ,ft<CR>|"
	nmap ;id<CR>  ,id<CR>|"
	nmap ;ig<CR>  ,ig<CR>|"
	nmap ;m<CR>   ,m<CR>|"
	nmap ;pC<CR>  ,pC<CR>|"
	nmap ;pE<CR>  ,pE<CR>|"
	nmap ;pF<CR>  ,pF<CR>|"
	nmap ;pa<CR>  ,pa<CR>|"
	nmap ;pan<CR> ,pan<CR>|"
	nmap ;pc<CR>  ,pc<CR>|"
	nmap ;pd<CR>  ,pd<CR>|"
	nmap ;pda<CR> ,pda<CR>|"
	nmap ;pe<CR>  ,pe<CR>|"
	nmap ;pf<CR>  ,pf<CR>|"
	nmap ;ph<CR>  ,ph<CR>|"
	nmap ;pi<CR>  ,pi<CR>|"
	nmap ;pj<CR>  ,pj<CR>|"
	nmap ;pl<CR>  ,pl<CR>|"
	nmap ;po<CR>  ,po<CR>|"
	nmap ;pp<CR>  ,pp<CR>|"
	nmap ;pr<CR>  ,pr<CR>|"
	nmap ;ps<CR>  ,ps<CR>|"
	nmap ;pt<CR>  ,pt<CR>|"
	nmap ;pte<CR> ,pte<CR>|"
	nmap ;rn<CR>  ,rn<CR>|"
	nmap ;ry<CR>  ,ry<CR>|"
	nmap ;sy<CR>  ,sy<CR>|"
	nmap ;uG<CR>  ,uG<CR>|"
	nmap ;uR<CR>  ,uR<CR>|"
	nmap ;ubt<CR> ,ubt<CR>|"
	nmap ;ue<CR>  ,ue<CR>|"
	nmap ;uf<CR>  ,uf<CR>|"
	nmap ;ug<CR>  ,ug<CR>|"
	nmap ;uh<CR>  ,uh<CR>|"
	nmap ;uj<CR>  ,uj<CR>|"
	nmap ;ul<CR>  ,ul<CR>|"
	nmap ;um<CR>  ,um<CR>|"
	nmap ;uom<CR> ,uom<CR>|"
	nmap ;up<CR>  ,up<CR>|"
	nmap ;upa<CR> ,upa<CR>|"
	nmap ;upt<CR> ,upt<CR>|"
	nmap ;uq<CR>  ,uq<CR>|"
	nmap ;ur<CR>  ,ur<CR>|"
	nmap ;us<CR>  ,us<CR>|"
	nmap ;ut<CR>  ,ut<CR>|"
	nmap ;wd<CR>  ,wd<CR>|"
endfunction "}}}
function! s:init() "{{{
	call s:set_header()
	nnoremap ,de<CR>   :<C-u>lcd ~/Desktop<CR>|"
	nnoremap ,dv<CR>   :<C-u>e ~/Dropbox/vim/mind/vimwork.vim/local/vimrc.vim<CR>|"
	nnoremap ,ig<CR>   :<C-u>GetVimFunctionName<CR>|"
	nnoremap ,m<CR>    :<C-u>lcd ~/Dropbox/vim/mind<CR>|"
	nnoremap <A-Space> :<C-u>simalt ~<CR>|" " Window変更
	set dict+=~/Dropbox/vim/mind/vimwork.vim/dict
	" call s:map()
	set ff=unix
	set fenc=utf-8

	let g:load_doxygen_syntax = 1
	let g:ref_phpmanual_path = 'C:/Users/kenta/lnk/ref/php-chunked-xhtml'
	set backupdir=~/vimbackup
	if !isdirectory(expand(&backupdir))
		call mkdir(expand(&backupdir))
	endif
endfunction "}}}
call s:init()

command! MyVitalUpdate call s:my_vital_update()
function! s:my_vital_update() "{{{
	let paths = [
				\ '~/Dropbox/vim/mind/chain-file.vim',
				\ '~/Dropbox/vim/mind/tab-diff.vim',
				\ ]

	for path in paths
		exe 'Vitalize' path
	endfor
endfunction
"}}}

command! -nargs=? MyGitUpdate call s:my_git_update(<q-args>) 
function! s:my_git_update(str) "{{{
	" @param[in] a:str commit comment

	let paths = [
				\ '~/Dropbox/vim/bundle/chain-file.vim',
				\ '~/Dropbox/vim/bundle/sort-function.vim',
				\ '~/Dropbox/vim/bundle/tab-diff.vim',
				\ '~/Dropbox/vim/bundle/tree.vim',
				\ '~/Dropbox/vim/bundle/unite-args.vim',
				\ '~/Dropbox/vim/bundle/unite-perforce.vim',
				\ '~/Dropbox/vim/bundle/unite-setting-ex.vim',
				\ '~/Dropbox/vim/bundle/unite-setting.vim',
				\ '~/Dropbox/vim/mind/vimwork.vim',
				\ ]


	let comment = len(a:str) ? a:str : "auto update"
	echom comment

	for path in paths
		exe 'lcd '.path
		call system('git add -A')
		let cmd = 'git commit -am "'.comment.'"'
		echom cmd
		call system(cmd)
		call system('git push')
	endfor

endfunction
"}}}

command! GetVimFunctionName call s:get_vim_function_name()
function! s:get_vim_function_name() "{{{
	let lnum  = searchpair('^\<function\>', '', '^\<endfunction\>', 'bn')
	let line  = getline(lnum)
	let fname = matchstr(line, '\s\zs.*\ze(')

	echom fname
	let @" = fname
	" let @+ = fname

	return fname
endfunction 
"}}}

" NOT YET
if 0
function! s:shougo()"{{{
" neocomplete.vim"{{{
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

let bundle = neobundle#get('neocomplete.vim')
function! bundle.hooks.on_source(bundle)
  " Use smartcase.
  let g:neocomplete#enable_smart_case = 1
  " Use fuzzy completion.
  let g:neocomplete#enable_fuzzy_completion = 1

  " Set minimum syntax keyword length.
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Set auto completion length.
  let g:neocomplete#auto_completion_start_length = 2
  " Set manual completion length.
  let g:neocomplete#manual_completion_start_length = 0
  " Set minimum keyword length.
  let g:neocomplete#min_keyword_length = 3

  " For auto select.
  let g:neocomplete#enable_complete_select = 1
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_refresh_always = 0
  if g:neocomplete#enable_complete_select
    set completeopt-=noselect
    set completeopt+=noinsert
  endif

  let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell/command-history',
        \ }

  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#disable_auto_select_buffer_name_pattern =
        \ '\[Command Line\]'
  let g:neocomplete#max_list = 100
  let g:neocomplete#force_overwrite_completefunc = 1
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
  endif
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#enable_auto_close_preview = 1

  " let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'
  let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::\w*'

  " Define keyword pattern.
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
  let g:neocomplete#keyword_patterns.perl = '\h\w*->\h\w*\|\h\w*::\w*'

  let g:neocomplete#ignore_source_files = ['tag.vim']

  let g:neocomplete#sources#vim#complete_functions = {
        \ 'Ref' : 'ref#complete',
        \ 'Unite' : 'unite#complete_source',
        \ 'VimShellExecute' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShellInteractive' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShellTerminal' :
        \      'vimshell#vimshell_execute_complete',
        \ 'VimShell' : 'vimshell#complete',
        \ 'VimFiler' : 'vimfiler#complete',
        \ 'Vinarise' : 'vinarise#complete',
        \}
  call neocomplete#custom#source('look', 'min_pattern_length', 4)

  " mappings."{{{
  " <C-f>, <C-b>: page move.
  inoremap <expr><C-f>  pumvisible() ? "\<PageDown>" : "\<Right>"
  inoremap <expr><C-b>  pumvisible() ? "\<PageUp>"   : "\<Left>"
  " <C-y>: paste.
  inoremap <expr><C-y>  pumvisible() ? neocomplete#close_popup() :  "\<C-r>\""
  " <C-e>: close popup.
  inoremap <expr><C-e>  pumvisible() ? neocomplete#cancel_popup() : "\<End>"
  " <C-k>: unite completion.
  imap <C-k>  <Plug>(neocomplete_start_unite_complete)
  inoremap <expr> O  &filetype == 'vim' ? "\<C-x>\<C-v>" : "\<C-x>\<C-o>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " <C-n>: neocomplete.
  inoremap <expr><C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
  " <C-p>: keyword completion.
  inoremap <expr><C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
  inoremap <expr>'  pumvisible() ? neocomplete#close_popup() : "'"

  inoremap <expr><C-x><C-f>
        \ neocomplete#start_manual_complete('file')

  inoremap <expr><C-g>     neocomplete#undo_completion()
  inoremap <expr><C-l>     neocomplete#complete_common_string()

  " <CR>: close popup and save indent.
  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function()
    return neocomplete#smart_close_popup() . "\<CR>"
  endfunction

  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ neocomplete#start_manual_complete()
  function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
  " <S-TAB>: completion back.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

  " For cursor moving in insert mode(Not recommended)
  inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
  inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
  inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
  inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
  "}}}
endfunction
"}}}

" neosnippet.vim"{{{
let bundle = neobundle#get('neosnippet')
function! bundle.hooks.on_source(bundle)
  imap <silent>L     <Plug>(neosnippet_jump_or_expand)
  smap <silent>L     <Plug>(neosnippet_jump_or_expand)
  xmap <silent>L     <Plug>(neosnippet_start_unite_snippet_target)
  imap <silent>K     <Plug>(neosnippet_expand_or_jump)
  smap <silent>K     <Plug>(neosnippet_expand_or_jump)
  imap <silent>G     <Plug>(neosnippet_expand)
  imap <silent>S     <Plug>(neosnippet_start_unite_snippet)
  xmap <silent>o     <Plug>(neosnippet_register_oneshot_snippet)
  xmap <silent>U     <Plug>(neosnippet_expand_target)

  let g:neosnippet#enable_snipmate_compatibility = 1

  " let g:snippets_dir = '~/.vim/snippets/,~/.vim/bundle/snipmate/snippets/'
  let g:neosnippet#snippets_directory = '~/.vim/snippets'
endfunction

unlet bundle

nnoremap <silent> [Window]f              :<C-u>Unite neosnippet/user neosnippet/runtime<CR>

"}}}

" unite.vim"{{{
" The prefix key.
nnoremap    [unite]   <Nop>
xnoremap    [unite]   <Nop>
nmap    ;u [unite]
xmap    ;u [unite]

nnoremap [unite]u  q:Unite<Space>
" nnoremap <silent> :  :<C-u>Unite history/command command<CR>
nnoremap <expr><silent> ;b  <SID>unite_build()
function! s:unite_build()
  return ":\<C-u>Unite -buffer-name=build". tabpagenr() ." -no-quit build\<CR>"
endfunction
nnoremap <silent> ;o
      \ :<C-u>Unite outline -start-insert -resume<CR>
nnoremap  [unite]f  :<C-u>Unite source<CR>
nnoremap <silent> ;t
      \ :<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include<CR>
xnoremap <silent> ;r
      \ d:<C-u>Unite -buffer-name=register register history/yank<CR>
nnoremap <silent> ;w
      \ :<C-u>UniteWithCursorWord -buffer-name=register
      \ buffer file_mru bookmark file<CR>
nnoremap <silent> <C-k>
      \ :<C-u>Unite change jump<CR>
nnoremap <silent> ;g
      \ :<C-u>Unite grep -buffer-name=search -auto-preview -no-quit -no-empty -resume<CR>
nnoremap <silent> ;r
      \ :<C-u>Unite -buffer-name=register register history/yank<CR>
inoremap <silent><expr> <C-z>
      \ unite#start_complete('register', { 'input': unite#get_cur_text() })

" <C-t>: Tab pages
nnoremap <silent><expr> <C-t>
      \ ":\<C-u>Unite -select=".(tabpagenr()-1)." tab\<CR>"

" <C-w>: Windows operation
nnoremap <silent> <C-w>       :<C-u>Unite window<CR>

if s:is_windows
  nnoremap <silent> [Window]s
        \ :<C-u>Unite -buffer-name=files -no-split -multi-line
        \ jump_point file_point buffer_tab
        \ file_rec:! file file/new file_mru<CR>
else
  nnoremap <silent> [Window]s
        \ :<C-u>Unite -buffer-name=files -no-split -multi-line
        \ jump_point file_point buffer_tab
        \ file_rec/async:! file file/new file_mru<CR>
endif
nnoremap <silent> [Window]w
      \ :<C-u>Unite window<CR>
nnoremap <silent> [Space]b
      \ :<C-u>UniteBookmarkAdd<CR>

" t: tags-and-searches "{{{
" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Jump.
" nnoremap [Tag]t  <C-]>
nnoremap <silent><expr> [Tag]t  &filetype == 'help' ?  "\<C-]>" :
      \ ":\<C-u>UniteWithCursorWord -buffer-name=tag tag tag/include\<CR>"
nnoremap <silent><expr> [Tag]p  &filetype == 'help' ?
      \ ":\<C-u>pop\<CR>" : ":\<C-u>Unite jump\<CR>"

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
"}}}

" Execute help.
nnoremap <silent> <C-h>  :<C-u>Unite -buffer-name=help help<CR>

" Execute help by cursor keyword.
nnoremap <silent> g<C-h>  :<C-u>UniteWithCursorWord help<CR>

" Search.
nnoremap <silent> /
      \ :<C-u>Unite -buffer-name=search -no-split -start-insert line<CR>
nnoremap <expr> g/  <SID>smart_search_expr('g/',
      \ ":\<C-u>Unite -buffer-name=search -auto-preview -start-insert line_migemo\<CR>")
nnoremap [Alt]/  g/
nnoremap <silent> ?
      \ :<C-u>Unite -buffer-name=search -auto-highlight -start-insert line:backward<CR>
nnoremap <silent> *
      \ :<C-u>UniteWithCursorWord -no-split -buffer-name=search line<CR>
nnoremap [Alt]/       /
nnoremap [Alt]?       ?
cnoremap <expr><silent><C-g>        (getcmdtype() == '/') ?
      \ "\<ESC>:Unite -buffer-name=search -no-split line -input=".getcmdline()."\<CR>" : "\<C-g>"

function! s:smart_search_expr(expr1, expr2)
  return line('$') > 5000 ?  a:expr1 : a:expr2
endfunction

nnoremap <silent> n
      \ :<C-u>UniteResume search -no-start-insert<CR>

let g:unite_source_history_yank_enable = 1

" For unite-alias.
let g:unite_source_alias_aliases = {}
let g:unite_source_alias_aliases.test = {
      \ 'source' : 'file_rec',
      \ 'args'   : '~/',
      \ }
let g:unite_source_alias_aliases.line_migemo = {
      \ 'source' : 'line',
      \ }
let g:unite_source_alias_aliases.message = {
      \ 'source' : 'output',
      \ 'args'   : 'message',
      \ }
let g:unite_source_alias_aliases.mes = {
      \ 'source' : 'output',
      \ 'args'   : 'message',
      \ }
let g:unite_source_alias_aliases.scriptnames = {
      \ 'source' : 'output',
      \ 'args'   : 'scriptnames',
      \ }

" For unite-menu.
let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.enc = {
      \     'description' : 'Open with a specific character code again.',
      \ }
let g:unite_source_menu_menus.enc.command_candidates = [
      \       ['utf8', 'Utf8'],
      \       ['iso2022jp', 'Iso2022jp'],
      \       ['cp932', 'Cp932'],
      \       ['euc', 'Euc'],
      \       ['utf16', 'Utf16'],
      \       ['utf16-be', 'Utf16be'],
      \       ['jis', 'Jis'],
      \       ['sjis', 'Sjis'],
      \       ['unicode', 'Unicode'],
      \     ]
nnoremap <silent> ;e :<C-u>Unite menu:enc<CR>

let g:unite_source_menu_menus.fenc = {
      \     'description' : 'Change file fenc option.',
      \ }
let g:unite_source_menu_menus.fenc.command_candidates = [
      \       ['utf8', 'WUtf8'],
      \       ['iso2022jp', 'WIso2022jp'],
      \       ['cp932', 'WCp932'],
      \       ['euc', 'WEuc'],
      \       ['utf16', 'WUtf16'],
      \       ['utf16-be', 'WUtf16be'],
      \       ['jis', 'WJis'],
      \       ['sjis', 'WSjis'],
      \       ['unicode', 'WUnicode'],
      \     ]
nnoremap <silent> ;f :<C-u>Unite menu:fenc<CR>

let g:unite_source_menu_menus.ff = {
      \     'description' : 'Change file format option.',
      \ }
let g:unite_source_menu_menus.ff.command_candidates = {
      \       'unix'   : 'WUnix',
      \       'dos'    : 'WDos',
      \       'mac'    : 'WMac',
      \     }
nnoremap <silent> ;w :<C-u>Unite menu:ff<CR>

let g:unite_source_menu_menus.unite = {
      \     'description' : 'Start unite sources',
      \ }
let g:unite_source_menu_menus.unite.command_candidates = {
      \       'history'    : 'Unite history/command',
      \       'quickfix'   : 'Unite qflist -no-quit',
      \       'resume'     : 'Unite -buffer-name=resume resume',
      \       'directory'  : 'Unite -buffer-name=files '.
      \             '-default-action=lcd directory_mru',
      \       'mapping'    : 'Unite mapping',
      \       'message'    : 'Unite output:message',
      \       'scriptnames': 'Unite output:scriptnames',
      \     }
nnoremap <silent> ;u :<C-u>Unite menu:unite -resume<CR>

let bundle = neobundle#get('unite.vim')
function! bundle.hooks.on_source(bundle)
  autocmd MyAutoCmd FileType unite call s:unite_my_settings()

  let g:unite_ignore_source_files = ['function.vim', 'command.vim']

  call unite#custom#profile('action', 'context', {'start_insert' : 1})

  " Set "-no-quit" automatically in grep unite source.
  call unite#custom#profile('source/grep', 'context', {'no_quit' : 1})

  " migemo.
  call unite#custom#source('line_migemo', 'matchers', 'matcher_migemo')

  call unite#custom#source('file_rec', 'sorters', 'sorter_reverse')

  " Custom filters."{{{
  call unite#custom#source(
        \ 'buffer,file_rec,file_rec/async,file_mru', 'matchers',
        \ ['converter_tail', 'matcher_fuzzy'])
        " \ ['matcher_fuzzy'])
  call unite#custom#source(
        \ 'file', 'matchers',
        \ ['matcher_fuzzy', 'matcher_hide_hidden_files'])
  call unite#custom#source(
        \ 'file_rec/async,file_mru', 'converters',
        \ ['converter_file_directory'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  "}}}

  function! s:unite_my_settings() "{{{
    " Directory partial match.
    call unite#custom#alias('file', 'h', 'left')
    call unite#custom#default_action('directory', 'narrow')
    " call unite#custom#default_action('file', 'my_tabopen')

    call unite#custom#default_action('versions/git/status', 'commit')

    " call unite#custom#default_action('directory', 'cd')

    " Custom actions."{{{
    let my_tabopen = {
          \ 'description' : 'my tabopen items',
          \ 'is_selectable' : 1,
          \ }
    function! my_tabopen.func(candidates) "{{{
      call unite#take_action('tabopen', a:candidates)

      let dir = isdirectory(a:candidates[0].word) ?
            \ a:candidates[0].word : fnamemodify(a:candidates[0].word, ':p:h')
      execute g:unite_kind_openable_lcd_command '`=dir`'
    endfunction"}}}
    call unite#custom#action('file,buffer', 'tabopen', my_tabopen)
    unlet my_tabopen
    "}}}

    " Overwrite settings.
    imap <buffer>  <BS>      <Plug>(unite_delete_backward_path)
    imap <buffer>  jj      <Plug>(unite_insert_leave)
    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
          \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> cd     <Plug>(unite_quick_match_default_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    " nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    " imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nmap <silent><buffer> <Tab>     :call <SID>NextWindow()<CR>
    nnoremap <silent><buffer><expr> l
          \ unite#smart_map('l', unite#do_action('default'))
    nmap <buffer> <C-e>     <Plug>(unite_narrowing_input_history)

    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
      nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
      nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
          \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])

    nnoremap <silent><buffer><expr> p
          \ empty(filter(range(1, winnr('$')),
          \ 'getwinvar(v:val, "&previewwindow") != 0')) ?
          \ unite#do_action('preview') : ":\<C-u>pclose!\<CR>"
  endfunction"}}}

  " Variables.
  let g:unite_enable_split_vertically = 0
  let g:unite_winheight = 20
  let g:unite_enable_start_insert = 0
  let g:unite_enable_short_source_names = 1

  let g:unite_cursor_line_highlight = 'TabLineSel'
  " let g:unite_abbr_highlight = 'TabLine'
  " let g:unite_source_file_mru_time_format = ''
  let g:unite_source_file_mru_filename_format = ''
  let g:unite_source_file_mru_limit = 300
  " let g:unite_source_directory_mru_time_format = ''
  let g:unite_source_directory_mru_limit = 300

  if s:is_windows
  else
    " Like Textmate icons.
    let g:unite_marked_icon = '?'

    " Prompt choices.
    "let g:unite_prompt = '? '
    let g:unite_prompt = '≫ '
  endif

  if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
          \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
          \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('jvgrep')
    " For jvgrep.
    let g:unite_source_grep_command = 'jvgrep'
    let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
    let g:unite_source_grep_recursive_opt = '-R'
  elseif executable('ack-grep')
    " For ack.
    let g:unite_source_grep_command = 'ack-grep'
    let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
    let g:unite_source_grep_recursive_opt = ''
  endif

  let g:unite_build_error_icon    = $DOTVIM . '/signs/err.'
        \ . (s:is_windows ? 'bmp' : 'png')
  let g:unite_build_warning_icon  = $DOTVIM . '/signs/warn.'
        \ . (s:is_windows ? 'bmp' : 'png')
endfunction

unlet bundle
"}}}
endfunction"}}}
endif
function! s:set_necomplete() "{{{
	call s:init()
	let g:neocomplete#enable_at_startup = 1
	let g:neocomplete#max_list = 4

	imap <C-Space> <PLUG>(neosnippet_expand_or_jump)|"

	" inoremap <C-s>       <c-o>:Unite -start-insert neocomplete snippet<CR>|"
	inoremap <expr><C-k> pumvisible() ?  neocomplete#cancel_popup() : neocomplete#start_manual_complete()

	imap <C-k>  <Plug>(neocomplete_start_unite_complete)

	nnoremap ,es<CR> :<C-u>NeoSnippetEdit<CR>|"

endfunction
"}}}
"
"call s:set_necomplete()
"call s:shougo()

let &cpo = s:save_cpo
unlet s:save_cpo

