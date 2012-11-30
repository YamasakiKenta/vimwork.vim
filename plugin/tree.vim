let s:save_cpo = &cpo
set cpo&vim

nnoremap <plug>(tree_syntax_force_reload) :<C-u>call s:force_reload()<CR>

aug tree "{{{
	au!
	" ‰Šú‰»
	au BufRead *.tree call s:init()
	au BufRead *.tree setf tree
aug END "}}}
function! s:init() "{{{
	aug tree_init
		au!
		" ˆÚ“®‚µ‚½ê‡
		au CursorMoved <buffer> call s:reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" ‹­’²
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
	" Ä•`‰æ
	let force_flg = 0
	if a:0 > 0
		let force_flg = a:1
	endif


	" ‰Šú‰»
	let lnum         = line(".")
	let tree_pattern = '|-'
	let subs_pattern = '\s*\(\d\+\)\?[-= ]\?$'
	let index        = {}

	let str = getline(lnum)
	" Œ»İˆÊ’u, 
	let index.old   = match(str, tree_pattern)

	" syntax •¶š‚ÌƒŠƒZƒbƒg
	let str = substitute(str, subs_pattern, ' '.index.old.' ','')
	call setline(lnum, str)

	" XVˆÊ’u‚Ìİ’è
	if ( force_flg == 0 ) 
		" ˆês‰º
		let index.stop = match(getline(1+lnum), tree_pattern)

		" Œ»İ‚ÌˆÊ’u‚©Aˆês‰º‚ÌˆÊ’u‚Æ“¯‚¶ˆÊ’u‚É—ˆ‚½ê‡AXVI—¹
		if index.stop < 0 || index.stop > index.old
			let index.stop = index.old 
		endif
	else 
		" ‚·‚×‚ÄXV
		let index.stop = -1
	endif


	while (1) "{{{
		"--------------------------------------------------------------------------------
		" index.now : Œ»İ‚ÌˆÊ’u
		" index.old : ‘O‰ñ‚ÌˆÊ’u
		" index.stop : XVˆÊ’u
		"--------------------------------------------------------------------------------

		" ’l‚ÌXV
		let lnum      = lnum - 1
		let str       = getline(lnum)
		let index.now = match(str, tree_pattern)

		" syntax •¶š‚Ìİ’è
		if index.now < index.old
			let subs_str = '='
		elseif index.now == index.old
			let subs_str = '-'
		elseif index.now > index.old
			let subs_str = ' '
		endif

		" XV
		let str = substitute(str, subs_pattern, ' '.index['old'].index['now'].subs_str,'')
		call setline(lnum, str)

		" ™X‚É¬‚³‚­‚·‚é
		let index.old = index.now < index.old ? index.now : index.old

		" I—¹”»’è
		if ( lnum < 0 || index.now < 0 || index.stop > index.now ) 
			echo 'END : '.lnum.' , '.index.now
			break
		endif 

	endwhile "}}}

endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

