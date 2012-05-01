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
" if 0
" 	set rtp+=$IVIMWORK  
" else
" 	NeoBundle 'https://YamasakiKenta@github.com/YamasakiKenta/vimwork.git'
" endif
"
" ********************************************************************************
"
"rtp
"rtp - myBundle "{{{
let $IMYBUNDLE = $IVIMWORKCOMMON.'/myBundle'            
set rtp+=$IVIMWORKCOMMON
set rtp+=$IMYBUNDLE/okazu
set rtp+=$IMYBUNDLE/unite-perforce.vim
set rtp+=$IMYBUNDLE/cells
set rtp+=$IMYBUNDLE/git
"}}}
"
"Setting
"set - ClientMove "{{{
let g:ClientMove_diffcmd = "WinMergeU"
let g:ClientMove_recursive_flg = 1
"}}}
"set - Autoload {{{
augroup myAugroup
	au!
	if has('win32')
		au GUIEnter * simalt ~x             " # �ő剻
	endif

	au FileType unite nmap P <Plug>(unite_toggle_auto_preview)
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
	nnoremap <buffer> <F5> :make<CR>
	nnoremap <buffer> <F1> :execute "!\"c:\\Local\\hsp32\\hsphelp\\helpman.exe\"" . " " . expand( "<cword>" )<CR>
endfunction
"}}}
"plugin - Twitter {{{
nnoremap ;tw<CR> :<C-u>PosttoTwitter<CR>
"}}}
call perforce#init()

"plugin - Shogo
"Shogo - unite{{{
let g:unite_enable_start_insert = 0         " # �����N��
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
nnoremap ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>
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
"nnoremap - simple {{{
nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grep�Ɉړ� ( �� )
nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grep�Ɉړ� ( �O )
nnoremap <A-Space> :simalt ~<CR>|"                                             " # Window�ύX
nnoremap v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"      " # �����l�̑I��
nnoremap j gj|"                                                                " # �J�[�\���ړ�
nnoremap k gk|"                                                                " # �J�[�\���ړ�
nnoremap <C-]> <C-]>zz|"                                                       " # �^�O�W�����v
nnoremap <S-Space> za|"                                                        " # �܏��
nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                           " # �n�C���C�g
map + :<C-u>ASearch <C-r>=expand("<cword>")<CR><CR>|"
vnoremap * "ty:let @/=@t<CR>N|"                                                    " # �I�𕶎�������
vnoremap < <gv|"                                                                   " # �J�[�\���ړ�
vnoremap > >gv|"                                                                   " # �đI��
"}}}
"nnoremap - diff {{{
nnoremap ;dy<CR> :<C-u>windo diffthis<CR>:windo call okazu#Map_diff()<CR>|"
nnoremap ;do<CR> :<C-u>DiffOrig<CR>:windo call okazu#Map_diff()<CR>|"
nnoremap ;dn<CR> :<C-u>diffoff!<CR>:windo call okazu#Map_diff_reset()<CR>|"
"}}}
"nnoremap - window {{{
nnoremap <S-LEFT> <C-w><|"
nnoremap <S-RIGHT> <C-w>>|"
nnoremap <S-UP> <C-w>-|"
nnoremap <S-DOWN> <C-w>+|"
"}}}
"nnoremap - Normal "{{{
nnoremap ;sy<CR> :MySyntaxFile<CR>|"                   " # �V���^�b�N�X�t�@�C���̕ҏW
nnoremap ;v<CR> :<C-u>lcd $IVIM<CR>|"                  " # VIM ��cd �ɂ���
nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # �t�@�C�����̎擾
nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # �t�@�C�����̎擾 ( �t���p�X )
nnoremap ;de<CR> :<C-u>lcd $DESKTOP<CR>
nnoremap ;dv<CR> :<C-u>e $IVIMWORKCOMMON/vimrc<CR>
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
nnoremap ;h<CR> :<C-u>e %:r.h<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
nnoremap ;m<CR> :<C-u>e %:r.m<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
nnoremap ;c<CR> :<C-u>e %:r.c<CR>|"                                                                           " # �t�@�C���̐؂�ւ�
" }}}
"
" test
nmap ;test<CR> <Plug>test
nnoremap <Plug>test :<C-u>echo 'hello world'<CR>

nmap <C-@> :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>

function! s:move_unite_tags(str) "{{{
	if a:str =~ '^k_'
		exe 'ta unite#kinds#'.a:str.'#define'
	elseif a:str =~ 'a_'
		exe 'ta kind.action_table.'.a:str.'.func'
	endif
endfunction "}}}
