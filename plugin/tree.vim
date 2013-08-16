let s:save_cpo = &cpo
set cpo&vim

nnoremap <plug>(tree_syntax_force_reload) :<C-u>call s:force_reload()<CR>

aug tree "{{{
	au!
	" 初期化
	au BufRead *.tree call s:init()
	au BufRead *.tree setf tree
aug END "}}}
function! s:init() "{{{
	aug tree_init
		au!
		" 移動した場合
		au CursorMoved <buffer> call s:reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" 強調
	syn match Todo /|-.*=$/
	syn match Todo /|-\ze.*-$/

endfunction
"}}}


function! s:force_reload() "{{{
	let subs_pattern = '\s\?\(\d\+\)\?[-= ]\?$' 

	exe 'silent %s/'.subs_pattern.'//'
	norm 

	echom 'force_reload'

	call s:reload(1)
endfunction
"}}}
function! s:reload(...) "{{{
	" 再描画
	let force_flg = 0
	if a:0 > 0
		let force_flg = a:1
	endif


	" 初期化
	let lnum         = line(".")
	let tree_pattern = '|-'
	let subs_pattern = '\s*\(\d\+\)\?[-= ]\?$'
	let index        = {}

	let str = getline(lnum)
	" 現在位置, 
	let index.old   = match(str, tree_pattern)

	" syntax 文字のリセット
	let str = substitute(str, subs_pattern, ' '.index.old.' ','')
	call setline(lnum, str)

	" 更新位置の設定
	if ( force_flg == 0 ) 
		" 一行下
		let index.stop = match(getline(1+lnum), tree_pattern)

		" 現在の位置か、一行下の位置と同じ位置に来た場合、更新終了
		if index.stop < 0 || index.stop > index.old
			let index.stop = index.old 
		endif
	else 
		" すべて更新
		let index.stop = -1
	endif


	while (1) "{{{
		"--------------------------------------------------------------------------------
		" index.now : 現在の位置
		" index.old : 前回の位置
		" index.stop : 更新位置
		"--------------------------------------------------------------------------------

		" 値の更新
		let lnum      = lnum - 1
		let str       = getline(lnum)
		let index.now = match(str, tree_pattern)

		" syntax 文字の設定
		if index.now < index.old
			let subs_str = '='
		elseif index.now == index.old
			let subs_str = '-'
		elseif index.now > index.old
			let subs_str = ' '
		endif

		" 更新
		let str = substitute(str, subs_pattern, ' '.index['old'].index['now'].subs_str,'')
		call setline(lnum, str)

		" 徐々に小さくする
		let index.old = index.now < index.old ? index.now : index.old

		" 終了判定
		if ( lnum < 0 || index.now < 0 || index.stop > index.now ) 
			echom 'END : '.lnum.' , '.index.now
			break
		endif 

	endwhile "}}}

endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

