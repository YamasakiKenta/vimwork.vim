"=============================================================================
" FILE: command.vim
" AUTHOR:  Yamasaki Kenta
" Creation date: 2014/04/26 23:46:33
" Last Modified: 2014/04/27 0:00:06
"=============================================================================
let s:save_cpo = &cpo
set cpo&vim
function! vimwork#command#add_serach(...) "{{{
" ********************************************************************************
" 検索ワードの追加 ( OR 検索 )
" @param[in]	検索ワード
" ********************************************************************************
	if a:0 > 0
		let @/ = @/.'\|\<'.join(a:000,'\>\|\<').'\>'
	endif
endfunction
"}}}
function! vimwork#command#copyFileDir(file,...) "{{{
	let g:copyFileDir_defaultRoot  = get(g:, 'copyFileDir_defaultRoot', 'c:')
	let g:copyFileDir_defaultFile2 = get(g:, 'copyFileDir_defaultFile2', 'c:\tmp')
	" ********************************************************************************
	" フォルダ構造のコピー
	" @param[in]	file1	コピー元
	" @param[in]	root2	コピー先のルート
	" @param[in]	root1	コピー元のルート
	" ********************************************************************************

	let defaultRoot  = g:copyFileDir_defaultRoot
	let defaultFile2 = g:copyFileDir_defaultFile2

	let file1 = substitute(a:file, '/','\','g')

	" 空白と引数がない場合は、defaultを設定する
	let root2 = get(a:,'1',defaultFile2)
	let root2 = substitute(root2, '/', '\','g')
	if root2 == ' ' | let root2 = defaultFile2 | endif

	" 末尾の \ を削除する
	let root2 = substitute(root2,'\\$','','')

	" 空白と引数がない場合は、defaultを設定する
	let root1  = get(a:,'2',defaultRoot)
	let root1  = substitute(root1, '/', '\','g')
	if root1 == ' ' | let root1 = defaultRoot | endif

	" 置換するため、スペースはエスケープする
	let root1 = escape(root1,'\')

	" ルートの削除
	let path1 = substitute(file1, root1,'','')

	" コピー先
	let file2 = root2.''.path1

	"--------------------------------------------------------------------------------
	" 実行する
	"--------------------------------------------------------------------------------
	" フォルダの作成
	call system('mkdir "'.fnamemodify(file2,':h').'"')

	" コピーする
	call system('copy "'.file1.'" "'.file2.'"')

	echom 'mkdir "'.fnamemodify(file2,':h').'"'
	echom 'copy "'.file1.'" "'.file2.'"'

endfunction
"}}}
function! vimwork#command#get_word(lnum1, lnum2, word) "{{{
	let lnum1 = a:lnum1
	let lnum2 = a:lnum2
	let word = a:word
	
	" 対象文字列以外の削除
	silent exe lnum1.','.lnum2.'s/\(^\|'.word.'\)\zs.\{-}\ze\('.word.'\|$\)//g'

	" ★ 列が増えいるため、範囲がわからない
	silent exe lnum1.','.lnum2.'sort u'

endfunction
"}}}
function! vimwork#command#set_num() "{{{
" ********************************************************************************
" 連番の作成
" カーソル以降の数字を、前の数字にひとつ加算したものにする ( マイナスは、考慮しない ) 
" ********************************************************************************
"
	" カーソル位置の取得
	let pos = getpos(".")
	let lnum = pos[1]
	let col  = pos[2] - 1

	"=====================
	" 前の行
	"=====================
	let lstr = getline(lnum-1)

	" 数字の取得
	let nums = split(lstr, '\D\+') + [1]

	"=====================
	" 現在の行
	"=====================
	let lstr  = getline(lnum)

	"================================================================================
	" 数字の末尾で分割
	"--------------------------------------------------------------------------------
	" 1 : aaa12(3)4aaaa  : () カーソル位置
	" 2 : aaa1234 , aaaa : カーソルより後ろの数字の末尾で分割
	" 3 : aaa     , aaa  : 数字の削除
	"================================================================================
	let col = match(lstr, '\d\D\|\d$', col) + 1

	" カーソル後に数字がある場合は処理する
	if col > 0
		" 数字の前の文字の取得
		let head = strpart(lstr, 0, col)

		" 数字の数を抽出
		let head_ncnt = len(split(head, '\D\+')) - 1

		" 文の取得
		" 変更する部分の数字は削除する
		let str = [
					\ substitute(head, '\d\+$','',''),
					\ get(nums, head_ncnt, 0) + 1,
					\ strpart(lstr, col ),
					\ ]

		" 書き込み
		call setline(lnum, join(str,''))

		" カーソル移動
		call cursor(lnum, len(str[0].str[1]))
	endif

endfunction
"}}}
function! vimwork#command#my_git_update(str) "{{{
	let comment = len(a:str) ? a:str : "auto update"
	echom comment

	let paths = split(glob("~/Dropbox/vim/mind/*"), "\n")
	let paths = filter(paths, "v:val !~ 'vital\\|tags'")

	for path in paths
		exe 'lcd '.path
		call system('git add -A')
		let cmd = 'git commit -am "'.comment.'"'
		echom getcwd()
		echom cmd
		call system(cmd)
		call system('git push')
	endfor

endfunction
"}}}
function! vimwork#command#change_root() "{{{
	let root = expand("%:h")
	let datas = [
				\ '.*\ze/plugin',
				\ '.*\ze/autoload',
				\ ]

	for data in datas
		if root =~ data
			let next_root = matchstr(root, data)
			if isdirectory(next_root)
				exe 'lcd' next_root
			endif
		endif
	endfor

endfunction "}}}
function! vimwork#command#winmerge() "{{{
	let fname = [
		expand("")
	]
endfunction
"}}}
function! vimwork#command#update_time(cmds) "{{{
	let pos = getpos(".")
	for cmd in a:cmds
		exe cmd
		let l = search('^\W*Last Modified', 'bnW')
		if l > 0
			echo 'UPDATE'
			let str = getline(l)
			let str = substitute(str, ':.*', ': '.strftime("%c"), '')
			call setline(l, str)
		endif
	endfor
	call setpos('.', pos)
endfunction
"}}}
function! vimwork#command#syntax() "{{{
	echo synIDattr(synID(line("."), col("."), 1), "name")
endfunction
" }}}
if exists(s:save_cpo)
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
