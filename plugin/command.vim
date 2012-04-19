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
	exe 'e '.$IVIMWORK.'/syntax/'.&filetype.'.vim'
	call okazu#MyQuit()
endfunction "}}}

" ********************************************************************************
" �I�������������A�R�s�[���ĕʉ�ʂŊJ��
" ********************************************************************************
command! -range=% SelectEdit :call s:selectEdit(<line1>, <line2>)
function! s:selectEdit(start, end) "{{{

	" �s�̕ۑ�
	let g:selectEdit_start = a:start
	let g:selectEdit_end   = a:end

	" ���݂̃t�@�C���^�C�v��ۑ�����
	let ft = &filetype

	" bufnr�̕ۑ�
	let g:selectEdit_bufnr = bufnr("")

	if 0
		tabe! ~/vim/tmp/selectEdit
		% delete _
		0put t 
	else
		let strs = getline(g:selectEdit_start,g:selectEdit_end)
		call okazu#event_save_file('selectEdit',strs,"MySelectEdit_write()")
		$ delete _

		if 0 
			let tmpfile = 'selectEdit'

			"��ʐݒ�
			exe 'vnew' tmpfile
			setlocal noswapfile bufhidden=hide buftype=acwrite

			"���̏�������
			%delete _
			call append(0,strs)

			"�Ȃ����󔒍s�Ȃ̂ō폜
			$ delete

			" ���Z�b�g����
			aug selectEdit
				autocmd!
				autocmd BufWriteCmd <buffer> nested call MySelectEdit_write()
			aug END
		endif

	endif

	exe 'set ft='.ft

endfunction "}}}
function! MySelectEdit_write() "{{{
	" ********************************************************************************
	" �I�������͈͂ɏ�������
	"
	" ********************************************************************************
	let start    = g:selectEdit_start
	let end      = g:selectEdit_end
	let bufnr    = g:selectEdit_bufnr

	" tmpfile�̕ۑ�
	let nowbufnr = bufnr('%')
	let strs     = getline(0,'$')

	" �s�̕ύX
	let g:selectEdit_end = start + line('$') - 1

	" �ҏW����t�@�C�� �̕ҏW
	exe bufnr 'buffer'

	" �폜
	exe start.','.end 'delete'

	" �ǉ�
	" todo : �󔒍s�Ȃ�ǉ����Ȃ�
	call append(start-1,strs)

	" tmpfile�ɖ߂�
	exe nowbufnr 'buffer'

endfunction "}}}

" ********************************************************************************
" Grep ���s��
" ********************************************************************************
command! -narg=+ MyGrep call <SID>grep(<f-args>)
function! <SID>grep(...) "{{{
	let word = join(a:000,'\|')
	exe 'vim /'.word.'/ **/*.'.g:myGrepFileType
endfunction "}}}
