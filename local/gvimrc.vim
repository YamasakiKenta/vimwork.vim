set go-=T
set go-=m
set transparency=220

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp
set fileformats=dos,unix,mac

set t_Co=256
" colorscheme slate
"colorscheme evening
colo solarized

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:clojure_highlight_references = 1

let g:clojure_align_multiline_strings = 1

" set relativenumber
" set number
set ambiwidth=single
set list lcs=tab:»\ ,eol:←,trail:.
set guifont=Consolas:h10
set guifontwide=MS_Gothic:h10

" winpos 800 0
" set lines=40 columns=100
