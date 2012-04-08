"********************************************************************************
" GIT
"********************************************************************************
"func
function! s:git_cmd(cmd) "{{{
	" ********************************************************************************
	" git �p�ɃJ�����g�f�B���N�g�����ꎞ�I�ɕς��Ď��s����֐�
	" @param[in]	cmd		git �R�}���h
	" ********************************************************************************

	" �ꎞ�I�ɕۑ�����
	let tmp = getcwd()

	" �ꎞ�I�ɃJ�����g�f�B���N�g���̏ꏊ��ς���
	lcd ~\Dropbox\vim\vimwork

	" ���ۂɃR�~�b�g����
	call okazu#LogFile('gitlog',okazu#Get_cmds(a:cmd))

	" ���ɖ߂�
	exe 'lcd' tmp

endfunction "}}}
function! s:git_push() "{{{
	call <SID>git_cmd('git push master')
endfunction "}}}

"com
" ********************************************************************************
" command
" ********************************************************************************
com! MyGitCommit call <SID>git_commit()
function! s:git_commit() "{{{
	let str = input('comment : ')
	if str == ""
		echo 'END... '
	else 
		call <SID>git_cmd('git commit -am '.okazu#Get_kk(str))
	endif
endfunction "}}}

"********************************************************************************
"map
"********************************************************************************
map ;gc<CR> <plug>(git_commit)
map ;gp<CR> <plug>(git_push)

"********************************************************************************
" plug 
"********************************************************************************
map <silent><buffer> <plug>(git_commit)
			\ :<C-u>call <SID>git_commit()<CR>
map <silent><buffer> <plug>(git_push)
			\ :<C-u>call <SID>git_push()<CR>

