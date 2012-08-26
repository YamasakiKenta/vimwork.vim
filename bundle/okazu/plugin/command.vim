" [ ] selectEdit�ŕۑ��ł���悤�ɂ���
"
" ********************************************************************************
" �O��̓���ւ�
" ********************************************************************************
command! -range -nargs=? MySwap <line1>,<line2>call <SID>mySwap(<q-args>)
function! s:mySwap(qarg) "{{{
	let lineNum = line(".")
	let line = getline(".") " # �����̎擾

	"�I�����Ă���̕ҏW
	if strlen(a:qarg) > 0
		"�w�肵�������œ��ւ�
		let hit  = match(line, a:qarg)         " # ���S�J�n�ʒu
		let hit2 = hit + strlen(a:qarg)        " # ���S�I���ʒu
		let str  = line[0: hit]                " # ����
		let str2 = strpart(line, hit2)         " # �E��
		call setline(lineNum, str2.a:qarg.str)
		"todo ���K�\���ňړ�
	else 
		" # todo : �K���ɓ��ւ�
		" # �����̑���
	endif
endfunction "}}}

" ********************************************************************************
" �C������syntax �t�@�C�����C������
" ********************************************************************************
command! MySyntaxFile call <SID>mySyntaxFile()
function! s:mySyntaxFile() "{{{
	exe 'e '.$LOCALWORK.'/syntax/'.&filetype.'.vim'
	call okazu#MyQuit()
endfunction "}}}

" ********************************************************************************
" �I�������������A�R�s�[���ĕʉ�ʂŊJ��
" ********************************************************************************
command! -range=% SelectEdit :call s:selectEdit(<line1>, <line2>)
function! s:selectEdit(start, end) "{{{

	" ���݂̃t�@�C���^�C�v��ۑ�����
	let ft = &filetype

	let selectEdit = {
				\ 'start' : a:start,
				\ 'end' : a:end,
				\ 'bufnr' : bufnr(""),
				\ }


	let strs = getline(selectEdit.start,selectEdit.end)
	call okazu#event_save_file('[selectEdit]',strs,"okazu#selectEdit_write",selectEdit)
	$ delete _

	exe 'set ft='.ft

	set nomodified

endfunction "}}}

" ********************************************************************************
" �������[�h�̒ǉ� ( OR ���� )
" @param[in]	�������[�h
" ********************************************************************************
command! -narg=* ASearch call <SID>aserach(<f-args>)
function! s:aserach(...) "{{{
	if a:0 > 0
		let @/ = @/.'\|'.join(a:000,'\|')
	endif
endfunction "}}}

" ********************************************************************************
" howm �ɒǉ�����
" ********************************************************************************
command! -narg=* QuickMemo call <SID>quickMemo(<f-args>)
function! s:quickMemo(...) "{{{

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

" ********************************************************************************
" �t�H���_�\���̃R�s�[
" @param[in]	file1	�R�s�[��
" @param[in]	root2	�R�s�[��̃��[�g
" @param[in]	root1	�R�s�[���̃��[�g
" ********************************************************************************

let g:copyFileDir_defaultRoot  = get(g:, 'copyFileDir_defaultRoot', 'c:')
let g:copyFileDir_defaultFile2 = get(g:, 'copyFileDir_defaultFile2', 'c:\tmp')

command! -nargs=+ CopyFileDir call <SID>copyFileDir(<f-args>)
function! s:copyFileDir(file,...) "{{{

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

