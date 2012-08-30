nnoremap <Plug>(set_number)
			\ :<C-u>call <SID>set_num()<CR>

nnoremap <Plug>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <Plug>(select_search)
			\ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a

function! <SID>set_num() "{{{
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

