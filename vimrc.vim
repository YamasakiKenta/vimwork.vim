"" ********************************************************************************
"" [�g�p�ӏ�] 
"" --------------------------------------------------------------------------------
" $VIMTMP
"" $DESKTOP "{{{
""  - vimrc.vim 
""  |- ;de<CR>
"}}}
"" $LOCALWORK "{{{
""  - vimrc.vim
""  |- ;v<CR>
""  |- snippets
""  |- howm
""  |- rtp
""  - command.vim
""  |- syntax
"}}}
"" $VIMWORK "{{{
""  - vimrc.vim
""  |- $VIMWORK_BUNDLE
""  |- rtp
"}}}
"" $BUNDLE "{{{
""  - neobundle.vim
""  |- NeoBundle
"}}}
"" $NEOBUNDLE "{{{
""  - neobundle.vim
""  |- rtp
"}}}
"" ********************************************************************************
"set - windows "{{{
if has('win32') || has('win64') 
	nnoremap <A-Space> :simalt ~<CR>|" " # Window�ύX
	aug my_vimrc
		au!
		au BufRead *.h setf c
		au GUIEnter * simalt ~x        " # �ő剻
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
"set - common"{{{
nnoremap ;h<CR> :<C-u>call okazu#change_extension(s:ext)<CR>|"
"}}}
"rtp
"rtp - myBundle "{{{
let $VIMWORK_BUNDLE = $VIMWORK.'/bundle'            
set rtp+=$LOCALWORK
set rtp+=$VIMWORK
set rtp+=$VIMWORK_BUNDLE/cells
set rtp+=$VIMWORK_BUNDLE/git
set rtp+=$VIMWORK_BUNDLE/bit
set rtp+=$VIMWORK_BUNDLE/okazu
"}}}
"Setting
"set - Autoload {{{
augroup myAugroup
	au!
	aut BufRead *.snip setf snip
	au FileType unite nmap <buffer> P <PLUG>(unite_toggle_auto_preview)
aug END
"}}}
"set - Normal = "{{{
"set enc=utf-8                                                                                           " # �G���R�[�h�̐ݒ�
"set fenc=utf-8                                                                                          " # |
"set grepprg=grep\ -nH                                                                                   " # Grep
set fdm=marker                                                                                           " # �����I�ɐ܂肽����
set fo+=ro                                                                                               " # �����ŃR�����g�}��
set guioptions-=T                                                                                        " # ���j���[�o�[���폜
set guioptions-=m                                                                                        " # �c�[���o�[���폜
set laststatus=2                                                                                         " # �X�e�[�^�X�s�̕\��
set lcs=tab:`\                                                                                           " # �L���̕\��
set shiftwidth=4                                                                                         " # |
set tabstop=4                                                                                            " # tab�̐ݒ�
set tw=0                                                                                                 " # �������s OFF
exe 'set backupdir='.$VIMTMP.'/backup.'                                                                 |" # Backup�t�H���_�̃p�X
"}}}
"set - Normal {{{
set autoread                                                                                             " # �����X�V
set cursorline                                                                                           " # �J�[�\���s�̋���
set hidden                                                                                               " # �t�@�C����ۑ������ړ�
set hlsearch                                                                                             " # ����
set ignorecase                                                                                           " # �����ő啶������������ʂ��Ȃ�
set incsearch                                                                                            " # |
set list                                                                                                 " # |
set modeline                                                                                             " # �ǂݍ��ݎ��̐ݒ�
set noswapfile                                                                                           " # SwapFile
set nowrap                                                                                               " # �܂�Ԃ�
set number                                                                                               " # �ԍ�����
set smartcase                                                                                            " # |
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
"set - cscope "{{{
set cscopequickfix=s-,c-,d-,i-,t-,e-
"}}}
"set - Tlist "{{{
let Tlist_Show_One_File = 1
""}}}
"plugin
"plugin - Other {{{
so $VIMRUNTIME/macros/matchit.vim                                                                        " # matchit - �}�b�`�̋���
let g:Align_xstrlen = 3                                                                                  " # Align - �c�ɐ��`
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
let QFix_CloseOnJump = 1" # QFixHown - �������I�ɏI������
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
"plugin - Shogo
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
let g:vimfiler_as_default_explorer = 1   " # ����filer
let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
"}}}
"Shogo - neocomplcache{{{
"neocomplcache - Init {{{
let g:neocomplcache_snippets_dir = $VIMWORK.'/snippets'.','.$LOCALWORK.'/snippets'                 " # snippet �t�@�C���쐬�ꏊ
let g:neocomplcache_enable_at_startup = 1                                                                " # �N��
let g:neocomplcache_disable_auto_complete = 1                                                            " # �����⊮����
"let g:neocomplcache_auto_completion_start_length = 3                                                    " # �����⊮�J�n����
"}}}
"neocomplcache - Mapping {{{
nnoremap ;es<CR> :<C-u>NeoComplCacheEditSnippets<CR>
imap <C-s>  <PLUG>(neocomplcache_start_unite_complete)|"                                                 " # Unite���g�p����
imap <C-Space> <PLUG>(neocomplcache_snippets_expand)|"                                                   " # Snippet���g�p����
smap <C-Space> <PLUG>(neocomplcache_snippets_expand)|"                                                   " # ����
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
" nmap - <PLUG>"{{{
nmap <C-s> 		<PLUG>(set_number)
nmap v/ 		<PLUG>(select_search)
nmap ;uq<CR> 	<PLUG>(uniq_line)
" "}}}
"nnoremap - simple {{{
nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grep�Ɉړ� ( �� )
nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grep�Ɉړ� ( �O )
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
"nnoremap - window {{{
nnoremap <S-LEFT> <C-w><|"
nnoremap <S-RIGHT> <C-w>>|"
nnoremap <S-UP> <C-w>-|"
nnoremap <S-DOWN> <C-w>+|"
"}}}
"nnoremap - Normal "{{{
nnoremap ;sy<CR> :MySyntaxFile<CR>|"                   " # �V���^�b�N�X�t�@�C���̕ҏW
nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # �t�@�C�����̎擾
nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # �t�@�C�����̎擾 ( �t���p�X )
"}}}
"nnoremap - lcd "{{{
nnoremap ;l<CR>  :<C-u>lcd $LOCALWORK<CR>|"
nnoremap ;v<CR>  :<C-u>lcd $VIMWORK<CR>|"
nnoremap ;de<CR> :<C-u>lcd $DESKTOP<CR>|"
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
nnoremap ;k<CR> :<C-u>call okazu#change_unite()<CR>|"
" }}}
" nnoremap - cscope "{{{
noremap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>|"
noremap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>|"
noremap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>|"
nnoremap <C-_>L :call system("cscope -b -R")<CR>:cs kill -1<CR>:cs add .<CR>|"
nnoremap <C-_>l :cs kill -1<CR>:cs add .<CR>|"
nnoremap <C-_>K :call system("ctags -R")<CR>|"
nnoremap <C-_>v :gre
" }}}
"
"********************************************************************************
" Unite Jump
"********************************************************************************
function! s:move_unite_tags(str) "{{{
	if a:str =~ '^k_'
		exe 'ta unite#kinds#'.a:str.'#define'
	elseif a:str =~ 'a_'
		exe 'ta kind.action_table.'.a:str.'.func'
	else
		" unite source �̏ꍇ
		let source_flg = unite#get_sources(a:str)
		if len(source_flg) > 0
			let fnc = 's:source_'.a:str
			exe 'ta' fnc
		endif

	endif
endfunction "}}}
if get(g:, 'atmark_jump_is_unite', 0)
	nmap <C-@> :<C-u>call <SID>move_unite_tags("<C-r>=expand("<cword>")<CR>")<CR>
endif

" ********************************************************************************
" diff
" ********************************************************************************
nmap ;dy<CR> <PLUG>(tab_diff_start)
nmap ;dn<CR> <PLUG>(tab_diff_end)
nmap ;do<CR> <PLUG>(tab_diff_orig)
"********************************************************************************
" MEMO
"--------------------------------------------------------------------------------
" ctags �΍�
" unite �\�[�X�Ɉړ����邽�߂ɁA�ϐ����Ɗ֘A�t������
" source_*
" kind_*
" action_*
