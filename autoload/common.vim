function! common#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! common#LogFile(name, deleteFlg, ...) "{{{
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
		call common#MyQuit()
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


function! common#Get_cmds(cmd) "{{{
	return split(system(a:cmd),'\n')
endfunction "}}}
function! common#Get_kk(str) "{{{
	"return substitute(a:str,'^\"?\(.*\)\"?','"\1"','')
	return len(a:str) ? '"'.a:str.'"' : ''
endfunction "}}}
function! common#is_different(path,path2) "{{{
	" ********************************************************************************
	" �����𒲂ׂ�
	" @param[in]	path				��r�t�@�C��1
	" @param[in]	path2				��r�t�@�C��2
	" @retval		flg			TRUE	��������
	" 							FALSE	�����Ȃ�
	" ********************************************************************************
	let flg = 1
	let outs = common#Get_cmds('fc '.common#Get_kk(a:path).' '.common#Get_kk(a:path2))
	if outs[1] =~ '^FC: ����_�͌��o����܂���ł���'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! common#get_pathSrash(path) "{{{
	return substitute(a:path,'\','/','g') " # / �}�[�N�ɓ���
endfunction "}}}
function! common#get_pathEn(path) "{{{
	return substitute(a:path,'/','\','g') " # / �}�[�N�ɓ���
endfunction "}}}
function! common#GetFileNameForUnite(args, context) "{{{
	" �t�@�C�����̎擾
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}

"********************************************************************************
" Select Edit �̕ۑ�
" @param[in]	args.start	�J�n�ʒu
" @param[in]	args.end	�I���ʒu
" @param[in]	args.bufnr	�ԍ�
"********************************************************************************
function! common#selectEdit_write(args) "{{{

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
	call common#event_save_file_autocmd('common#selectEdit_write',a:args)


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
function! common#event_save_file(tmpfile,strs,func,args) "{{{

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

	call common#event_save_file_autocmd(a:func,a:args)

endfunction "}}}
function! common#event_save_file_autocmd(func,args) "{{{

	aug okazu_event_save_file
		au!
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func.'('.string(a:args).')'
	aug END

endfunction "}}}

" ********************************************************************************
" �t�@�C���̐؂�ւ� ( C ���� ) 
" ********************************************************************************
function! common#change_extension(exts) "{{{
	let extension = expand("%:e")

	if exists('a:exts[extension]')
		exe 'e %:r.'.a:exts[extension]
	endif

endfunction "}}}

" ********************************************************************************
" �t�@�C���̐؂�ւ� ( unite ) 
" ********************************************************************************
function! common#change_unite() "{{{
	let root = substitute(expand("%:h"), '[\\/][^\\/]*$', '', '')
	let file = expand("%:t")
	let type = substitute(expand("%:h"), '.*[\\/]\ze.\{-}[\\/]', '', '')

	echo type
	if type =~ 'unite[\\/]kinds'
		let file = substitute(file, 'k_', '', '')
		exe 'e '.root.'/sources/'.file
	elseif type =~ 'unite[\\/]sources'
		exe 'e '.root.'/kinds/k_'.file
	endif

endfunction "}}}
