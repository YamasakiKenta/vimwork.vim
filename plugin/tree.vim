nnoremap <plug>(tree_syntax_force_reload) :<C-u>call <SID>force_reload()<CR>

aug tree "{{{
	au!
	" ‰Šú‰»
	au BufRead *.tree call <SID>init()
	au BufRead *.tree setf tree
aug END "}}}
function! <SID>init() "{{{
	aug tree_init
		au!
		" ˆÚ“®‚µ‚½ê‡
		au CursorMoved <buffer> call <SID>reload()
	aug END
	setl ft=tree fdm=indent shiftwidth=1 tabstop=1 expandtab
	nmap <buffer> <C-l> <plug>(tree_syntax_force_reload)

	" ‹­’²
	syn match Todo /|-.*=$/
	syn match Todo /|-\ze.*-$/

endfunction "}}}
function! <SID>force_reload() "{{{
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
	let subs_pattern = '\s\?\(\d\+\)\?[-= ]\?$' 

	exe 'silent %s/'.subs_pattern.'//'
	norm 

	echo 'force_reload'
=======
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
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim

	call <SID>reload(1)
endfunction "}}}
function! <SID>reload(...) "{{{
	" Ä•`‰æ
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
	let force_flg = 0
	if a:0 > 0
		let force_flg = a:1
	endif

=======
	let force_flg = a:0 > 0 ? a:1 : 0
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim

	" ‰Šú‰»
	let lnum         = line(".")
	let tree_pattern = '|-'
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
	let subs_pattern = '\s*\(\d\+\)\?[-= ]\?$'
=======
	let subs_pattern = '\s\?\(\d\+\)\?[- = ]\?$'
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim
	let index        = {}

	let str = getline(lnum)
	" Œ»İˆÊ’u, 
	let index.old   = match(str, tree_pattern)

	" syntax •¶š‚ÌƒŠƒZƒbƒg
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
	let str = substitute(str, subs_pattern, ' '.index.old.' ','')
=======
	let str = substitute(str, subs_pattern, '  ','')
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim
	call setline(lnum, str)

	" XVˆÊ’u‚Ìİ’è
	if ( force_flg == 0 ) 
		" ˆês‰º
		let index.stop = match(getline(1+lnum), tree_pattern)

		" Œ»İ‚ÌˆÊ’u‚©Aˆês‰º‚ÌˆÊ’u‚Æ“¯‚¶ˆÊ’u‚É—ˆ‚½ê‡AXVI—¹
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
		if index.stop < 0 || index.stop > index.old
			let index.stop = index.old 
		endif
=======
		let index.stop = index.stop > index.old ? index.old : index.stop
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim
	else 
		" ‚·‚×‚ÄXV
		let index.stop = -1
	endif

<<<<<<< HEAD:bundle/okazu/plugin/tree.vim

=======
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim
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
<<<<<<< HEAD:bundle/okazu/plugin/tree.vim
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
=======
			" ‘O‰ñ‚ÌˆÊ’u‚ğXV‚·‚é
			let index.old = index.now
			let subs_str = ' ='
		elseif index.now == index.old
			let subs_str = ' -'
		elseif index.now > index.old
			let subs_str = '  '
		endif

		" XV
		let str = substitute(str, subs_pattern, subs_str,'')
		call setline(lnum, str)

		" I—¹”»’è
		if ( lnum > 0 || index.stop >= index.now || index.now < 0 ) 
>>>>>>> mac book:myBundle/okazu/plugin/tree.vim
			break
		endif 

	endwhile "}}}

endfunction "}}}
