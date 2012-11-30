let s:save_cpo = &cpo
set cpo&vim

nnoremap <plug>(tree_syntax_force_reload) :<C-u>call s:force_reload()<CR>

aug tree "{{{
	au!
	" ������
	au BufRead *.tree call s:init()
	au BufRead *.tree setf tree
aug END "}}}
function! s:init() "{{{
	aug tree_init
		au!
		" �ړ������ꍇ
		au CursorMoved <buffer> call s:reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" ����
	syn match Todo /|-.*=$/
	syn match Todo /|-\ze.*-$/

endfunction "}}}


function! s:force_reload() "{{{
	let subs_pattern = '\s\?\(\d\+\)\?[-= ]\?$' 

	exe 'silent %s/'.subs_pattern.'//'
	norm 

	echo 'force_reload'

	call s:reload(1)
endfunction "}}}
function! s:reload(...) "{{{
	" �ĕ`��
	let force_flg = 0
	if a:0 > 0
		let force_flg = a:1
	endif


	" ������
	let lnum         = line(".")
	let tree_pattern = '|-'
	let subs_pattern = '\s*\(\d\+\)\?[-= ]\?$'
	let index        = {}

	let str = getline(lnum)
	" ���݈ʒu, 
	let index.old   = match(str, tree_pattern)

	" syntax �����̃��Z�b�g
	let str = substitute(str, subs_pattern, ' '.index.old.' ','')
	call setline(lnum, str)

	" �X�V�ʒu�̐ݒ�
	if ( force_flg == 0 ) 
		" ��s��
		let index.stop = match(getline(1+lnum), tree_pattern)

		" ���݂̈ʒu���A��s���̈ʒu�Ɠ����ʒu�ɗ����ꍇ�A�X�V�I��
		if index.stop < 0 || index.stop > index.old
			let index.stop = index.old 
		endif
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
			let subs_str = '='
		elseif index.now == index.old
			let subs_str = '-'
		elseif index.now > index.old
			let subs_str = ' '
		endif

		" �X�V
		let str = substitute(str, subs_pattern, ' '.index['old'].index['now'].subs_str,'')
		call setline(lnum, str)

		" ���X�ɏ���������
		let index.old = index.now < index.old ? index.now : index.old

		" �I������
		if ( lnum < 0 || index.now < 0 || index.stop > index.now ) 
			echo 'END : '.lnum.' , '.index.now
			break
		endif 

	endwhile "}}}

endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

