function! okazu#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! okazu#LogFile(name,...) "{{{
	" ********************************************************************************
	" �V�����t�@�C�����J���ď������݋֎~�ɂ��� 
	" @param[in]	name		�������ݗptmpFileName
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
		set buftype=nofile " # �ۑ��֎~
		call okazu#MyQuit()
	else
		" �\�����Ă���Ȃ�؂�ւ���
		exe bnum . 'wincmd w'
	endif

	" �������݃f�[�^������Ȃ珑������
	if exists("a:1") 
		call append(0,a:1)
	endif
	cal cursor(1,1) " # ��s�ڂɈړ�����

endfunction "}}}
function! okazu#event_save_file(tmpfile,strs,func) "{{{
	" ********************************************************************************
	" �t�@�C����ۑ������Ƃ��ɁA�֐������s���܂�
	" @param[in]	tmpfile		�ۑ�����t�@�C���� ( ��������t�@�C���� ) 
	" @param[in]	strs		�����̕���
	" @param[in]	func		���s����֐���
	" ********************************************************************************
	"
	"��ʐݒ�
	exe 'vnew' a:tmpfile
    setlocal noswapfile bufhidden=hide buftype=acwrite

	"���̏�������
	%delete _
	call append(0,a:strs)

	"��s�ڂɈړ�
	cal cursor(1,1) 

	aug okazu_event_save_file "{{{
		au!
		autocmd! BufWriteCmd <buffer>
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func
	aug END "}}}


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
	" return  TRUE : ��������
	" ********************************************************************************
	" �����𒲂ׂ�
	" @param[in]	path				��r�t�@�C��1
	" @param[in]	path2				��r�t�@�C��2
	" @return		flg			TRUE	��������
	" 							TRUE	�����Ȃ�
	" ********************************************************************************
	let flg = 1
	let outs = okazu#Get_cmds('fc '.okazu#Get_kk(a:path).' '.okazu#Get_kk(a:path2))
	if outs[1] =~ '^FC: ����_�͌��o����܂���ł���'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! okazu#get_pathSrash(path) "{{{
	let path = a:path
	let path = substitute(path,'\','/','g') " # / �}�[�N�ɓ���
	"let path = substitute(path,'[^/]$','&/','') " # / ���Ō�ɂ���
	return path
endfunction "}}}
function! okazu#GetFileNameForUnite(args, context) "{{{
	" �t�@�C�����̎擾
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}
function! okazu#get_ronri_seki(a,b) "{{{
	" ********************************************************************************
	" �_���a�����܂�
	" @param[in]	a		
	" @param[in]	b		
	" ********************************************************************************
	
	let a = a:a
	let b = a:b

	"���������̎擾
	let [dai,syo] = a > b ? [a,b] : [b,a]

	let rtn = 0
	let omomi = 1
	while ( syo > 0 ) 
		if syo % 2 && dai % 2
			let rtn += omomi
		endif
		let dai = dai / 2
		let syo = syo / 2
		let omomi = omomi * 2
	endwhile

	return rtn

endfunction "}}}

echo okazu#get_ronri_seki(4,4)

