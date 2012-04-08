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
		au GUIEnter * simalt ~x             " # �ő剻
	endif
	au Filetype help call okazu#MyQuit() " # help�p�̃L�[�o�C���h
aug END
"}}}
"set - Normal {{{

set modeline                                                                                             " # �ǂݍ��ݎ��̐ݒ�
set number                                                                                               " # �ԍ�����
set ignorecase                                                                                           " # �����ő啶������������ʂ��Ȃ�
set cursorline                                                                                           " # �J�[�\���s�̋���
set hlsearch                                                                                             " # ����
set incsearch                                                                                            " # |
set smartcase                                                                                            " # |
set autoread                                                                                             " # �����X�V
set list                                                                                                 " # |
set hidden                                                                                               " # �t�@�C����ۑ������ړ�
set noswapfile                                                                                           " # SwapFile
set nowrap                                                                                               " # �܂�Ԃ�
set grepprg=grep\ -nH                                                                                    " # Grep
set guioptions-=T                                                                                        " # ���j���[�o�[���폜
set guioptions-=m                                                                                        " # �c�[���o�[���폜
set laststatus=2                                                                                         " # �X�e�[�^�X�s�̕\��
set tabstop=4                                                                                            " # tab�̐ݒ�
set shiftwidth=4                                                                                         " # |
set lcs=tab:`\                                                                                           " # �L���̕\��
set fdm=marker                                                                                           " # �����I�ɐ܂肽����
set backupdir=~/vim/backup                                                                               " # Backup�t�H���_�̃p�X
set tw=0                                                                                                 " # �������s OFF
"set enc=utf-8                                                                                           " # �G���R�[�h�̐ݒ�
"set fenc=utf-8                                                                                          " # |

"}}}
"set - Terminal {{{
if !has('gui')
	set ruler                                                                                                " # �J�[�\���̈ʒu�̕\��
	set nocompatible                                                                                         " # vim�̋@�\���g����
	syntax enable                                                                                            " # �F��t�� - �ݒ肪���Z�b�g�����
	filetype on
	filetype indent on
	filetype plugin on
endif
"}}}
"
"plugin
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - �}�b�`�̋���
let g:Align_xstrlen = 3                                                                                  " # Align - �c�ɐ��`
let g:toggle_pairs = { 'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if' }               " # Toggle
"}}}
"plugin - QFixHowm{{{
let howm_dir = $IVIM.'/howm'
let QFix_CloseOnJump = 1                                                                                 " # QFixHown - �������I�ɏI������
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
"let g:pf_client_changes_only = 1                                                                        " # 1 - �N���C�A���g�Ńt�B���^
"let g:pf_user_changes_only = 1                                                                          " # 1 - ���[�U�[�Ńt�B���^
"let g:pf_is_submit_flg = 1                                                                              " # �T�u�~�b�g���邩�ǂ���
"let g:pf_ports = ['1668']                                                                               " # �|�[�g�̐ݒ�
"let g:pf_is_out_flg = 1                                                                                 " # ���ʏo�͂��s��
"}}}

"plugin - Shogo
"Shogo - unite{{{
let g:unite_enable_start_insert = 0         " # �����N��
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
let g:vimfiler_as_default_explorer = 1                                                                   " # ����filer
let g:vimfiler_safe_mode_by_default = 0                                                                  " # safe_mode
"}}}
"Shogo - neocomplcache{{{
"neocomplcache - Init {{{
let g:neocomplcache_snippets_dir = $IVIMWORK.'/snippets'                                                 " # snippet �t�@�C���쐬�ꏊ
let g:neocomplcache_enable_at_startup = 1                                                                " # �N��
let g:neocomplcache_disable_auto_complete = 1                                                            " # �����⊮����
"let g:neocomplcache_auto_completion_start_length = 3                                                    " # �����⊮�J�n����
"}}}
"neocomplcache - Mapping {{{
map ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>
imap <C-s>  <Plug>(neocomplcache_start_unite_complete)|"                                                 " # Unite���g�p����
imap <C-Space> <Plug>(neocomplcache_snippets_expand)|"                                                   " # Snippet���g�p����
smap <C-Space> <Plug>(neocomplcache_snippets_expand)|"                                                   " # ����
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
map <C-n> :<C-u>cn<CR>|"                                                                                 " # Grep�Ɉړ� ( �� )
map <C-p> :<C-u>cN<CR>|"                                                                                 " # Grep�Ɉړ� ( �O )
map <A-Space> :simalt ~<CR>|"                                                                            " # Window�ύX
map v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"                                     " # �����l�̑I��
map j gj|"                                                                                               " # �J�[�\���ړ�
map k gk|"                                                                                               " # �J�[�\���ړ�
map <C-]> <C-]>zz|"                                                                                      " # �^�O�W�����v
map <S-Space> za|"                                                                                       " # �܏��
nmap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                                                     " # �n�C���C�g
vmap * "ty:let @/=@t<CR>N|"                                                                              " # �I�𕶎�������
vmap < <gv|"                                                                                             " # �J�[�\���ړ�
vmap > >gv|"                                                                                             " # �đI��
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
" map q�̓��͂��x���Ȃ�
"map q: <nop>|"
"map q/ <nop>|"
"}}}
"map - Normal "{{{
map ;ry<CR> :<C-u>windo set scrollbind<CR>|"
map ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
map ;v<CR> :<C-u>lcd $IVIM<CR>|"                                                                         " # VIM ��cd �ɂ���
map ;sy<CR> :MySyntaxFile<CR>|"                                                                          " # �V���^�b�N�X�t�@�C���̕ҏW
map ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"                                                           " # �t�@�C�����̎擾
map ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"                                                           " # �t�@�C�����̎擾 ( �t���p�X )
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
map ;h<CR> :<C-u>e %:r.h<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
map ;m<CR> :<C-u>e %:r.m<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
map ;c<CR> :<C-u>e %:r.c<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
" }}}

