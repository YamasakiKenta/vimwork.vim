let s:save_cpo = &cpo
set cpo&vim

" memo
" QuickRun -hook/time/enable 1

call vimwork#set_ctags() 
let g:chain_dict = { '__file' : {
			\ 'win7.vim' : '../autoload/vimwork.vim',
			\ 'autoload/vimwork.vim' : '../local/win7.vim',
			\ },
			\ '__pattern': [
			\ { 'before': 'autoload\(/.*\)\?/\(.*\.vim$\)' , 'after': 'plugin/**/\2'}, 
			\ { 'before': 'plugin\(/.*\)\?/\(.*\.vim\)'    , 'after': 'autoload/**/\2'}, 
			\ { 'before': '/coffee/\(.*\)\.coffee$'        , 'after': '/*/\1.js'}, 
			\ { 'before': '/coffee2js/\(.*\)\.js$'         , 'after': '/coffee/\1.coffee'}, 
			\ ],
			\ }

" 環境で変更する
nnoremap <leader>dv<CR>   :<C-u>e ~/.vim/bundle/vimwork.vim/local/win7.vim<CR>|"
nnoremap <leader>de<CR>   :<C-u>lcd ~/Desktop<CR>|"

cd ~

let g:neocomplete#enable_at_startup = 1
inoremap jk <esc>

set visualbell

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp
set fileformats=dos,unix,mac

" execute pathogen#infect()
" syntax on
" filetype plugin indent on

" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ 'component': {
      " \   'readonly': '%{&readonly?"\u2b64":""}',
      " \ },
      " \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
      " \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
      " \ }


" vim-gitgutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '-'
let g:gitgutter_sign_removed = 'x'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': { 'left': "\u2b80", 'right': "\u2b82" },
        \ 'subseparator': { 'left': "\u2b81", 'right': "\u2b83" }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . '+',
        \ g:gitgutter_sign_modified . '-',
        \ g:gitgutter_sign_removed . 'x'
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

