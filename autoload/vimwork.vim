function! vimwork#init() "{{{
	let $VIMWORK   = expand(exists('$VIMWORK'  ) ? $VIMWORK   : '~/vimwork'  ) 
	let $LOCALWORK = expand(exists('$LOCALWORK') ? $LOCALWORK : '~/localwork') 
	let $VIMTMP    = expand(exists('$LOCALWORK') ? $VIMTMP    : '~/vimtmp'   ) 
	"@point of use
	"$VIMTMP "{{{
	" - backupdir
	" - howm
	" }}}
	" $LOCALWORK "{{{
	"  - vimrc.vim
	"  |- ;v<CR>
	"  |- snippets
	"  |- howm
	"  |- rtp
	"  - command.vim
	"  |- syntax
	"}}}
	" $VIMWORK "{{{
	"  - vimrc.vim
	"  |- rtp
	"}}}
	"rtp - bundle "{{{
	" vimwork �Ɋ܂܂��X�N���v�g�̓���
	set rtp+=$LOCALWORK
	set rtp+=$VIMWORK
	set rtp+=$VIMWORK/bundle/diff
	set rtp+=$VIMWORK/bundle/cells
	set rtp+=$VIMWORK/bundle/git
	"}}}
	"@setting
	if !has('gui') "{{{
		set ruler                                                                                                " # �J�[�\���̈ʒu�̕\��
		set nocompatible                                                                                         " # vim�̋@�\���g����
		syntax enable                                                                                            " # �F��t�� - �ݒ肪���Z�b�g�����
		filetype on
		filetype indent on
		filetype plugin on
	endif
	"}}}
	"set - input "{{{
	set ve=block
	set fdm=marker                                                                                           " # �����I�ɐ܂肽����
	set fo+=ro                                                                                               " # �����ŃR�����g�}��
	set guioptions-=T                                                                                        " # ���j���[�o�[���폜
	set guioptions-=m                                                                                        " # �c�[���o�[���폜
	set laststatus=2                                                                                         " # �X�e�[�^�X�s�̕\��
	set lcs=tab:`\                                                                                           " # �L���̕\��
	set shiftwidth=4                                                                                         " # |
	set tabstop=4                                                                                            " # tab�̐ݒ�
	set tw=0                                                                                                 " # �������s OFF
	set backupdir=$VIMTMP/backup                                                                 " # Backup�t�H���_�̃p�X
	"}}}
	"set - normal {{{
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
	"@mapping
	"map - simple "{{{
	map + :<C-u>ASearch <C-r>=expand("<cword>")<CR><CR>|"
	"}}}
	" nmap - <Plug>"{{{
	nmap v/ 		<Plug>(select_search)
	nmap ;uq<CR> 	<Plug>(uniq_line)
	nmap ;sy<CR> 	<Plug>(edit_syntax_file)
	" "}}}
	" nnoremap - c {{{
	nnoremap ;k<CR> :<C-u>call common#change_unite()<CR>|"
	" }}}
	" nnoremap - call "{{{
	nnoremap ;h<CR> :<C-u>call common#change_extension(s:ext)<CR>|"
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
	nnoremap ;l<CR>  :<C-u>lcd $LOCALWORK<CR>|"
	nnoremap ;v<CR>  :<C-u>lcd $VIMWORK<CR>|"
	"}}}
	"nnoremap - normal "{{{
	nnoremap ;ry<CR> :<C-u>windo set scrollbind<CR>|"
	nnoremap ;rn<CR> :<C-u>windo set noscrollbind<CR>|"
	nnoremap ;fp<CR> :<C-u>let @+ = expand("%:p")<CR>|"    " # �t�@�C�����̎擾
	nnoremap ;ft<CR> :<C-u>let @+ = expand("%:t")<CR>|"    " # �t�@�C�����̎擾 ( �t���p�X )
	"}}}
	"nnoremap - simple {{{
	nnoremap <C-j> j.|"                                                            " # ��Ƃ̌J��Ԃ�                     
	nnoremap <C-n> :<C-u>cn<CR>|"                                                  " # Grep�Ɉړ� ( �� )
	nnoremap <C-p> :<C-u>cN<CR>|"                                                  " # Grep�Ɉړ� ( �O )
	nnoremap v/ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a|"      " # �����l�̑I��
	nnoremap j gj|"                                                                " # �J�[�\���ړ�
	nnoremap k gk|"                                                                " # �J�[�\���ړ�
	nnoremap <C-]> <C-]>zz|"                                                       " # �^�O�W�����v
	nnoremap <S-Space> za|"                                                        " # �܏��
	nnoremap <ESC><ESC> :<C-u>noh<CR><ESC>|"                                       " # �n�C���C�g
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
	vnoremap * "ty:let @/=@t<CR>N|"                                                " # �I�𕶎�������
	vnoremap < <gv|"                                                               " # �J�[�\���ړ�
	vnoremap > >gv|"                                                               " # �đI��
	"}}}
	"@plugin
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
	"@plugin - Shogo
	"Shogo - unite{{{
	let g:unite_enable_start_insert = 0
	let g:unite_source_history_yank_enable = 0
	nnoremap ;ur<CR>  :<C-u>UniteResume<CR>
	nnoremap ;us<CR>  :<C-u>Unite source<CR>
	nnoremap ;um<CR>  :<C-u>Unite file_mru<CR>
	nnoremap ;uf<CR>  :<C-u>Unite file_rec<CR>
	nnoremap ;ut<CR>  :<C-u>Unite tag<CR>
	nnoremap ;ug<CR>  :<C-u>Unite grep -no-quit<CR>
	nnoremap ;ub<CR>  :<C-u>Unite buffer<CR>
	nnoremap ;ubt<CR> :<C-u>Unite buffer_tags<CR>
	nnoremap ;uh<CR>  :<C-u>Unite history/yank<CR>
	nnoremap ;ul<CR>  :<C-u>Unite line/fast<CR>
	nnoremap ;uj<CR>  :<C-u>Unite jump<CR>
	nnoremap ;uK<CR>  :<C-u>Unite bookmark<CR>
	nnoremap ;uk<CR>  :<C-u>Unite bookmark -default-action=vimfiler<CR>
	nnoremap ;cw<CR>  :<C-u>Unite qf<CR>
	nnoremap ;ue<CR>  :<C-u>Unite outline<CR>
	"}}}
	"Shogo - vimfiler{{{
	let g:vimfiler_as_default_explorer = 1   " # ����filer
	let g:vimfiler_safe_mode_by_default = 0  " # safe_mode
	"}}}
	"Shogo - neocomplcache{{{
	"neocomplcache - init {{{
	let g:neocomplcache_snippets_dir = $VIMWORK.'/snippets'.','.$LOCALWORK.'/snippets'                       " # snippet �t�@�C���쐬�ꏊ
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
	nnoremap <C-\>v :vim /\<<C-R>=expand("<cword>")<CR>\>/ **/*.vim **.*.[ch]<CR>
	" }}}

endfunction "}}}
