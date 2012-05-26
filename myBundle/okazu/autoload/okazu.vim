function! okazu#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! okazu#LogFile(name, deleteFlg, ...) "{{{
	" ********************************************************************************
	" �V�����t�@�C�����J���ď������݋֎~�ɂ��� 
	" @param[in]	name		�������ݗptmpFileName
	" @param[in]	deleteFlg	����������
	" @param[in]	[...]		�������ރf�[�^
	" ********************************************************************************

	let @t = expand("%:p") " # map�ŌĂяo���p
	let name = a:name

	" �J���Ă��邩���ׂ�
	let bnum = bufwinnr(name) 

	if bnum == -1
		" ��ʓ��ɂȂ���ΐV�K�쐬
		exe 'sp ~/'.name
		%delete _          " # �t�@�C������
		setl buftype=nofile " # �ۑ��֎~
		setl fdm=manual
		call okazu#MyQuit()
	else
		" �\�����Ă���Ȃ�؂�ւ���
		exe bnum . 'wincmd w'
	endif

	" ����������
	if a:deleteFlg == 1
		%delete _
	endif

	" �������݃f�[�^������Ȃ珑������
	if exists("a:1") 
		call append(0,a:1)
	endif
	cal cursor(1,1) " # ��s�ڂɈړ�����

endfunction "}}}


function! okazu#Get_cmds(cmd) "{{{
	return split(system(a:cmd),'\n')
endfunction "}}}
function! okazu#Get_kk(str) "{{{
	"return substitute(a:str,'^\"?\(.*\)\"?','"\1"','')
	return len(a:str) ? '"'.a:str.'"' : ''
endfunction "}}}
function! okazu#Map_diff() "{{{
	map <buffer> <up> [c
	map <buffer> <down> ]c
	map <buffer> <left> dp:<C-u>diffupdate<CR>
	map <buffer> <right> dn:<C-u>diffupdate<CR>
	map <buffer> <tab> <C-w><C-w>
endfunction "}}}
function! okazu#Map_diff_reset() "{{{
	map <buffer> <up> <up>
	map <buffer> <down> <down>
	map <buffer> <left> <left>
	map <buffer> <right> <right>
endfunction "}}}
function! okazu#is_different(path,path2) "{{{
	" ********************************************************************************
	" �����𒲂ׂ�
	" @param[in]	path				��r�t�@�C��1
	" @param[in]	path2				��r�t�@�C��2
	" @retval		flg			TRUE	��������
	" 							FALSE	�����Ȃ�
	" ********************************************************************************
	let flg = 1
	let outs = okazu#Get_cmds('fc '.okazu#Get_kk(a:path).' '.okazu#Get_kk(a:path2))
	if outs[1] =~ '^FC: ����_�͌��o����܂���ł���'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! okazu#get_pathSrash(path) "{{{
	return substitute(a:path,'\','/','g') " # / �}�[�N�ɓ���
endfunction "}}}
function! okazu#get_pathEn(path) "{{{
	return substitute(a:path,'/','\','g') " # / �}�[�N�ɓ���
endfunction "}}}
function! okazu#GetFileNameForUnite(args, context) "{{{
	" �t�@�C�����̎擾
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}

" ********************************************************************************
" �A�Ԃ̍쐬
" �J�[�\���ȍ~�̐������A�O�̐����ɂЂƂ��Z�������̂ɂ��� ( �}�C�i�X�́A�l�����Ȃ� ) 
" ********************************************************************************
function! okazu#set_num() "{{{

	" �J�[�\���ʒu�̎擾
	let pos = getpos(".")
	let lnum = pos[1]
	let col  = pos[2] - 1

	"********************
	" �O�̍s
	"********************
	let lstr = getline(lnum-1)

	" �����̎擾
	let nums = split(lstr, '\D\+') + [1]

	"********************
	" ���݂̍s
	"********************
	let lstr  = getline(lnum)

	"********************************************************************************
	" �����̖����ŕ���
	"--------------------------------------------------------------------------------
	" 1 : aaa12(3)4aaaa  : () �J�[�\���ʒu
	" 2 : aaa1234 , aaaa : �J�[�\�������̐����̖����ŕ���
	" 3 : aaa     , aaa  : �����̍폜
	"********************************************************************************
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

"********************************************************************************
" Select Edit �̕ۑ�
" @param[in]	args.start	�J�n�ʒu
" @param[in]	args.end	�I���ʒu
" @param[in]	args.bufnr	�ԍ�
"********************************************************************************
function! okazu#selectEdit_write(args) "{{{

	let start    = a:args.start
	let end      = a:args.end
	let bufnr    = a:args.bufnr

	" tmpfile�̕ۑ�
	set nomodified
	let nowbufnr = bufnr('%')
	let strs     = getline(0,'$')

	" �s�̕ύX
	let a:args.end = start + line('$') - 1

	" args�̍X�V
	call okazu#event_save_file_autocmd('okazu#selectEdit_write',a:args)


	" �ҏW����t�@�C�� �̕ҏW
	exe bufnr 'buffer'

	" �폜
	exe start.','.end 'delete'

	" �ǉ�
	call append(start-1,strs)

	" tmpfile�ɖ߂�
	exe nowbufnr 'buffer'

endfunction "}}}

" ********************************************************************************
" �t�@�C����ۑ������Ƃ��ɁA�֐������s���܂�
" @param[in]	tmpfile		�ۑ�����t�@�C���� ( ��������t�@�C���� ) 
" @param[in]	strs		�����̕���
" @param[in]	func		���s����֐���
" @param[in]	args		���s����֐����ɓn�� ����
" ********************************************************************************
function! okazu#event_save_file(tmpfile,strs,func,args) "{{{

	"��ʐݒ�
	let bnum = bufwinnr(a:tmpfile) 

	if bnum == -1
		exe 'vnew' a:tmpfile
		setlocal noswapfile bufhidden=hide buftype=acwrite
	else
		" �\�����Ă���Ȃ�؂�ւ���
		exe bnum . 'wincmd w'
	endif

	"���̏�������
	%delete _
	call append(0,a:strs)

	"��s�ڂɈړ�
	call cursor(1,1) 

	call okazu#event_save_file_autocmd(a:func,a:args)

endfunction "}}}
function! okazu#event_save_file_autocmd(func,args) "{{{

	aug okazu_event_save_file
		au!
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func.'('.string(a:args).')'
	aug END

endfunction "}}}

" ********************************************************************************
" �t�@�C���̐؂�ւ�
" ********************************************************************************
function! okazu#change_extension() "{{{
	let extension = expand("%:e")
	if extension == 'c'
		e %:r.h
	elseif extension == 'h'
		e %:r.c
	endif
endfunction "}}}
