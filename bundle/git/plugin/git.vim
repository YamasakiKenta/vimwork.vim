"********************************************************************************
" GIT
"********************************************************************************
"func
function! <SID>git_cmd(cmd) "{{{
	" ********************************************************************************
	" git 用にカレントディレクトリを一時的に変えて実行する関数
	" @param[in]	cmd		git コマンド
	" ********************************************************************************

	" 一時的に保存する
	let tmp = getcwd()

	" 一時的にカレントディレクトリの場所を変える
	lcd ~\Dropbox\vim\vimwork

	" 実際にコミットする
	call common#LogFile('gitlog', 0, common#Get_cmds(a:cmd))

	" 元に戻す
	exe 'lcd' tmp

endfunction "}}}
function! <SID>git_push() "{{{
	call <SID>git_cmd('git push master')
endfunction "}}}

"com
" ********************************************************************************
" command
" ********************************************************************************
com! MyGitCommit call <SID>git_commit()
function! <SID>git_commit() "{{{
	let str = input('comment : ')
	if str == ""
		echo 'END... '
	else 
		call <SID>git_cmd('git commit -am '.common#Get_kk(str))
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

