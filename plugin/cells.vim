let s:save_cpo = &cpo
set cpo&vim

"
"todo : �ŏ��� |���O�͂��̂܂�

com! -range Cells call s:cells(<line1>,<line2>)

"�������킹��
function! g:set_lens(strs1, strs2) "{{{

	" �z��T�C�Y�̍X�V - maxs�̌��̒ǉ�����

	let cnt = 0
	if len(a:strs1) > len(a:strs2) 
		let max = len(a:strs1) - len(a:strs2) 

		while ( cnt < max ) 
			call add(a:strs2,0)
			let cnt += 1
		endwhile
	else
		let max = len(a:strs2) - len(a:strs1) 

		while ( cnt < max ) 
			call add(a:strs1,0)
			let cnt += 1
		endwhile
	endif
	
endfunction
"}}}
"�������̎擾
function! s:get_maxs_from_str(str, maxs) "{{{
	" ********************************************************************************
	" �ő啝�̎擾 ( ������ ) 
	" @param[in]	str		�ݒ�X�V���镶����
	" @param[in]	maxs	������̍ő啝
	" ********************************************************************************

	let str = a:str
	let maxs = a:maxs

	" �X�V���镶����̕������̎擾
	let tmp_maxs = map(split(str,"\[|+]"), "len(v:val)")

	" �z��T�C�Y�̍X�V - maxs�̌��̒ǉ�����
	"let max = len(tmp_maxs) - len(maxs) 
	"if max > 0
		"let cnt = 0
		"while ( cnt < max ) 
			"call add(maxs,0)
			"let cnt += 1
		"endwhile
	"else
		"let max = len(maxs) - len(tmp_maxs) 
		"let cnt = 0
		"while ( cnt < max ) 
			"call add(tmp_maxs,0)
			"let cnt += 1
		"endwhile
	"endif

	" �z�񕝂����킹
	call g:set_lens(tmp_maxs, maxs) 

	" �������̎擾
	let cnt = 0
	for max in maxs
		let tmp_max = tmp_maxs[cnt]

		if tmp_max > max
			let maxs[cnt] = tmp_max
		endif

		let cnt += 1
	endfor

	" ������̍ő啝
	return maxs

endfunction
"}}}
function! s:get_maxs_from_strs(strs) "{{{
	" ********************************************************************************
	" �ő啝�̎擾 ( ������ ) 
	" @param[in]	strs	�ݒ肷�镶����
	" @param[out]	maxs	������̍ő啝
	" ********************************************************************************
	let strs = a:strs

	" ������̍ő啝 ( ���Z�b�g ) 
	"
	let maxs = []
	for str in strs
		let maxs = s:get_maxs_from_str(str,maxs)
	endfor

	return maxs

endfunction
"}}}

"���ɍ��킹�āA������̍X�V
function! s:is_line(str) "{{{
" ********************************************************************************
" �s�̐������ׂ�
" @param[in]	str		���ׂ镶����
" ********************************************************************************
	let str = a:str

	" �\�J�n�܂ł��폜����
	let str = substitute(str, " ?.\{-}\[|+]", "", "g")
	
	"if str =~ "\[^|+-]"
	"
	" - ���܂�ł���Ȃ���ɂ���
	if str =~ "[-]"
		let rtn = 1 
	else
		let rtn = 0 
	endif

	return rtn

endfunction
"}}}
function! s:get_line(str, maxs) "{{{
	" ********************************************************************************
	" ���̍s�Ȃ�A����\������
	" @param[in]	str		���̍s�����ׂ�s
	" @param[in]	maxs	�e���̐ݒ�l
	" ********************************************************************************
	"
	let str = a:str
	let str1 = substitute(str, "\[+|].*","","")

	if s:is_line(str)

		" ��ԍŏ��́A�\�����Ȃ�
		let strs = []

		for max in a:maxs
			call add(strs,repeat('-', max))
		endfor

		let strs[0] = str1. repeat(' ',a:maxs[0]-len(str1))

		let str = join(strs,'+').'+'
	endif

	return str

endfunction
"}}}

function! g:add_list(name1, list1, name2, list2) "{{{

	" �z�񕝂����킹��
	call g:set_lens(list1, list2) 

	let cnt   = 0
	let dicts = []
	while cnt < max
		let dicts  = add({name1 : list1[cnt], name2 : list2[cnt]})
		let cnt   += 1
	endwhile
	
	return dicts
endfunction
"}}}
function! s:get_str(str, maxs) "{{{
	let maxs      = a:maxs
	let while_max = len(maxs)
	let strs      = split(a:str, "|")

	" �z�񐔂����킹��
	call g:set_lens(strs, maxs) 

	let cnt = 0
	while ( cnt < while_max ) 
		let max = maxs[cnt]      " �e��
		let len = len(strs[cnt]) " ������
		let sa  = max - len

		" �ő啶�����ɑ���Ȃ����́ASPACE��}��
		let strs[cnt] .= repeat(' ',sa)

		let cnt += 1
	endwhile

	" ����
	let rtn = join(strs,'|').'|'

	return rtn

endfunction
"}}}
function! s:get_strs(strs, maxs) "{{{

	let outs = []
	for str in a:strs
		if s:is_line(str)
			call add(outs, s:get_line(str, a:maxs))
		else
			call add(outs, s:get_str(str, a:maxs))
		endif
	endfor

	return outs 

endfunction
"}}}

function! s:cells(line1,line2) "{{{
	let line1 = a:line1
	let line2 = a:line2

	" �ҏW�f�[�^�̎擾
	let strs = getline(line1,line2)

	" | �̏ꏊ�̎擾 ( �e��̕��̐ݒ� ) 
	let maxs =  s:get_maxs_from_strs(strs)

	" ���̐ݒ�
	let strs = s:get_strs(strs, maxs)

	call setline(line1, strs)	

endfunction
"}}}

"     +----+---------+--------------+
"     |134 |2        |13456789      |
"     +----+---------+--------------+
"     |1234|12       |123456789     |
"     +----+---------+--------------+
"     |    |0        |              |
"a    +----+---------+--------------+
"     +----+---------+--------------+
"
"
"
"
"
"
let &cpo = s:save_cpo
unlet s:save_cpo

