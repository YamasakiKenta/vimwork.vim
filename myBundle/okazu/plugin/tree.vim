nnoremap <plug>(tree_syntax_force_reload) :<C-u>call <SID>force_reload()<CR>

aug tree "{{{
	au!
	" 初期化
	au BufRead *.tree call <SID>init()
	au BufRead *.tree setf tree
aug END "}}}
function! s:init() "{{{
	aug tree_init
		au!
		" 移動した場合
		au CursorMoved <buffer> call <SID>reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" 強調
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
	" 再描画
	let force_flg = a:0 > 0 ? a:1 : 0

	" 初期化
	let lnum         = line(".")
	let tree_pattern = '|-'
	let subs_pattern = '\s\?\(\d\+\)\?[- = ]\?$'
	let index        = {}

	let str = getline(lnum)
	" 現在位置, 
	let index.old   = match(str, tree_pattern)

	" syntax 文字のリセット
	let str = substitute(str, subs_pattern, '  ','')
	call setline(lnum, str)

	" 更新位置の設定
	if ( force_flg == 0 ) 
		" 一行下
		let index.stop = match(getline(1+lnum), tree_pattern)

		" 現在の位置か、一行下の位置と同じ位置に来た場合、更新終了
		let index.stop = index.stop > index.old ? index.old : index.stop
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
			" 前回の位置を更新する
			let index.old = index.now
			let subs_str = ' ='
		elseif index.now == index.old
			let subs_str = ' -'
		elseif index.now > index.old
			let subs_str = '  '
		endif

		" 更新
		let str = substitute(str, subs_pattern, subs_str,'')
		call setline(lnum, str)

		" 終了判定
		if ( lnum > 0 || index.stop >= index.now || index.now < 0 ) 
			break
		endif 

	endwhile "}}}

endfunction "}}}
