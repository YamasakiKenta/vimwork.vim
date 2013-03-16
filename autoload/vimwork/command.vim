let s:save_cpo = &cpo
set cpo&vim

function! vimwork#command#add_serach(...) "{{{
" ********************************************************************************
" �������[�h�̒ǉ� ( OR ���� )
" @param[in]	�������[�h
" ********************************************************************************
	if a:0 > 0
		let @/ = @/.'\|\<'.join(a:000,'\>\|\<').'\>'
	endif
endfunction "}}}
function! vimwork#command#copyFileDir(file,...) "{{{
	let g:copyFileDir_defaultRoot  = get(g:, 'copyFileDir_defaultRoot', 'c:')
	let g:copyFileDir_defaultFile2 = get(g:, 'copyFileDir_defaultFile2', 'c:\tmp')
	" ********************************************************************************
	" �t�H���_�\���̃R�s�[
	" @param[in]	file1	�R�s�[��
	" @param[in]	root2	�R�s�[��̃��[�g
	" @param[in]	root1	�R�s�[���̃��[�g
	" ********************************************************************************

	let defaultRoot  = g:copyFileDir_defaultRoot
	let defaultFile2 = g:copyFileDir_defaultFile2

	let file1 = substitute(a:file, '/','\','g')

	" �󔒂ƈ������Ȃ��ꍇ�́Adefault��ݒ肷��
	let root2 = get(a:,'1',defaultFile2)
	let root2 = substitute(root2, '/', '\','g')
	if root2 == ' ' | let root2 = defaultFile2 | endif

	" ������ \ ���폜����
	let root2 = substitute(root2,'\\$','','')

	" �󔒂ƈ������Ȃ��ꍇ�́Adefault��ݒ肷��
	let root1  = get(a:,'2',defaultRoot)
	let root1  = substitute(root1, '/', '\','g')
	if root1 == ' ' | let root1 = defaultRoot | endif

	" �u�����邽�߁A�X�y�[�X�̓G�X�P�[�v����
	let root1 = escape(root1,'\')

	" ���[�g�̍폜
	let path1 = substitute(file1, root1,'','')

	" �R�s�[��
	let file2 = root2.''.path1

	"--------------------------------------------------------------------------------
	" ���s����
	"--------------------------------------------------------------------------------
	" �t�H���_�̍쐬
	call system('mkdir "'.fnamemodify(file2,':h').'"')

	" �R�s�[����
	call system('copy "'.file1.'" "'.file2.'"')

	echo 'mkdir "'.fnamemodify(file2,':h').'"'
	echo 'copy "'.file1.'" "'.file2.'"'

endfunction
"}}}
function! vimwork#command#get_word(lnum1, lnum2, word) "{{{
	let lnum1 = a:lnum1
	let lnum2 = a:lnum2
	let word = a:word
	
	" �Ώە�����ȊO�̍폜
	silent exe lnum1.','.lnum2.'s/\(^\|'.word.'\)\zs.\{-}\ze\('.word.'\|$\)//g'

	" �� �񂪑������邽�߁A�͈͂��킩��Ȃ�
	silent exe lnum1.','.lnum2.'sort u'

endfunction "}}}
function! vimwork#command#mySwap(qarg) "{{{

	"�I�����Ă���̕ҏW
	if strlen(a:qarg) > 0
		let qarg = a:qarg
	else 
		let qarg = ','
	endif

	exe 's/\(.*\S\)\(\s*'.qarg.'\s*\)\(.*\)/\3\2\1'

endfunction "}}}
function! vimwork#command#quickMemo(...) "{{{

	"let str = input('comment: ',join(a:000))
	if a:0 == 0 
		let str = input('comment: ')
	else
		let str = join(a:000)
	endif 

	" ���݂̃t�@�C����ۑ�
	let bufnr = bufnr("%")

	" howm �t�@�C�����J��
	exe 'edit' g:howm_dir.strftime("/%Y/%m/%Y-%m-%d-000000.txt")

	" �ۑ�����
	call append(1, strftime("[%Y-%m-%d %H:%M]".str))

	write

	" �ҏW���̃t�@�C���ɖ߂�
	exe bufnr 'buffer'

endfunction "}}}
function! vimwork#command#set_num() "{{{
" ********************************************************************************
" �A�Ԃ̍쐬
" �J�[�\���ȍ~�̐������A�O�̐����ɂЂƂ��Z�������̂ɂ��� ( �}�C�i�X�́A�l�����Ȃ� ) 
" ********************************************************************************
"
	" �J�[�\���ʒu�̎擾
	let pos = getpos(".")
	let lnum = pos[1]
	let col  = pos[2] - 1

	"=====================
	" �O�̍s
	"=====================
	let lstr = getline(lnum-1)

	" �����̎擾
	let nums = split(lstr, '\D\+') + [1]

	"=====================
	" ���݂̍s
	"=====================
	let lstr  = getline(lnum)

	"================================================================================
	" �����̖����ŕ���
	"--------------------------------------------------------------------------------
	" 1 : aaa12(3)4aaaa  : () �J�[�\���ʒu
	" 2 : aaa1234 , aaaa : �J�[�\�������̐����̖����ŕ���
	" 3 : aaa     , aaa  : �����̍폜
	"================================================================================
	let col = match(lstr, '\d\D\|\d$', col) + 1

	" �J�[�\����ɐ���������ꍇ�͏�������
	if col > 0
		" �����̑O�̕����̎擾
		let head = strpart(lstr, 0, col)

		" �����̐��𒊏o
		let head_ncnt = len(split(head, '\D\+')) - 1

		" ���̎擾
		" �ύX���镔���̐����͍폜����
		let str = [
					\ substitute(head, '\d\+$','',''),
					\ get(nums, head_ncnt, 0) + 1,
					\ strpart(lstr, col ),
					\ ]

		" ��������
		call setline(lnum, join(str,''))

		" �J�[�\���ړ�
		call cursor(lnum, len(str[0].str[1]))
	endif

endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo
