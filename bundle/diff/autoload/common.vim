function! common#map_diff() "{{{
	map <buffer> <A-up> [c
	map <buffer> <A-down> ]c
	map <buffer> <A-left>  :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <A-right> :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <tab> :<C-u>call common#map_diff_tab()<CR>|"
endfunction "}}}
function! common#map_diff_reset() "{{{
	map <buffer> <A-up> <A-up>
	map <buffer> <A-down> <A-down>
	map <buffer> <A-left> <A-left>
	map <buffer> <A-right> <A-right>
endfunction "}}}
function! common#map_diff_tab() "{{{
	"********************************************************************************
	" �^�u�؂�ւ����ɏ�����ǉ����邽�ߍ쐬����
	"********************************************************************************
	wincmd w
endfunction "}}}
function! common#tabcopy() "{{{
	let bufnrs = []
	windo let bufnrs += [bufnr("%")]

	tabe
	" �ŏ��̉�ʂ̍X�V
	exe 'b' bufnrs[0]

	" 2��ʖڂ���́A��������
	for bufnr in bufnrs[1:]
		exe 'sb' bufnr
	endfor	
	
endfunction "}}}
