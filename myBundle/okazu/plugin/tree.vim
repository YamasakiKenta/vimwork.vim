nnoremap <plug>(tree_syntax_force_reload) :<C-u>call <SID>force_reload()<CR>

aug tree "{{{
	au!
	" ������
	au BufRead *.tree call <SID>init()
	au BufRead *.tree setf tree
aug END "}}}
function! s:init() "{{{
	aug tree_init
		au!
		" �ړ������ꍇ
		au CursorMoved <buffer> call <SID>reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" ����
	syn match Todo /|-.*=$/
	syn match Todo /|-\ze.*-$/

endfunction "}}}
function! s:force_reload() "{{{
	echo 'TEST'
	let max = line('$')
	let lnum = line('.')
	let subs_pattern = '\s\?\(\d\+\)\?[-= ]\?$' 

	echo max
	while ( lnum < max ) 
		let str = getline(lnum)
		let str = substitute(str, subs_pattern, '','')
		call setline(lnum, str)
		let lnum = lnum + 1
	endwhile

	call <SID>reload(1)
endfunction "}}}
function! s:reload(...) "{{{
	" �ĕ`��
	let force_flg = a:0 > 0 ? a:1 : 0

	" ������
	let lnum         = line(".")
	let tree_pattern = '|-'
	let subs_pattern = '\s\?\(\d\+\)\?[- = ]\?$'
	let index        = {}

	let str = getline(lnum)
	" ���݈ʒu, 
	let index.old   = match(str, tree_pattern)

	" syntax �����̃��Z�b�g
	let str = substitute(str, subs_pattern, '  ','')
	call setline(lnum, str)

	" �X�V�ʒu�̐ݒ�
	if ( force_flg == 0 ) 
		" ��s��
		let index.stop = match(getline(1+lnum), tree_pattern)

		" ���݂̈ʒu���A��s���̈ʒu�Ɠ����ʒu�ɗ����ꍇ�A�X�V�I��
		let index.stop = index.stop > index.old ? index.old : index.stop
	else 
		" ���ׂčX�V
		let index.stop = -1
	endif

	while (1) "{{{
		"--------------------------------------------------------------------------------
		" index.now : ���݂̈ʒu
		" index.old : �O��̈ʒu
		" index.stop : �X�V�ʒu
		"--------------------------------------------------------------------------------

		" �l�̍X�V
		let lnum      = lnum - 1
		let str       = getline(lnum)
		let index.now = match(str, tree_pattern)

		" syntax �����̐ݒ�
		if index.now < index.old
			" �O��̈ʒu���X�V����
			let index.old = index.now
			let subs_str = ' ='
		elseif index.now == index.old
			let subs_str = ' -'
		elseif index.now > index.old
			let subs_str = '  '
		endif

		" �X�V
		let str = substitute(str, subs_pattern, subs_str,'')
		call setline(lnum, str)

		" �I������
		if ( lnum > 0 || index.stop >= index.now || index.now < 0 ) 
			break
		endif 

	endwhile "}}}

endfunction "}}}
