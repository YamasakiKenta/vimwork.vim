" 前後の入れ替え
command! -range -nargs=? MySwap <line1>,<line2>call s:mySwap(<q-args>) "{{{
function! s:mySwap(qarg)
	let lineNum = line(".")
	let line = getline(".") " # 文字の取得

	"選択しているの編集
	if strlen(a:qarg) > 0
		"指定した文字で入替え
		let hit  = match(line, a:qarg)         " # 中心開始位置
		let hit2 = hit + strlen(a:qarg)        " # 中心終了位置
		let str  = line[0: hit]                " # 左側
		let str2 = strpart(line, hit2)         " # 右側
		call setline(lineNum, str2.a:qarg.str)
		"todo 正規表現で移動
	else 
		" # todo : 適当に入替え
		" # 文字の操作
	endif
endfunction "}}}

" 検索ワードの追加
command! -narg=* AddSearch call s:add_serach(<f-args>) "{{{
function! s:add_serach(...) 
" ********************************************************************************
" 検索ワードの追加 ( OR 検索 )
" @param[in]	検索ワード
" ********************************************************************************
	if a:0 > 0
		let @/ = @/.'\|'.join(a:000,'\|')
	endif
endfunction "}}}

" howm に追加する
command! -narg=* QuickMemo call s:quickMemo(<f-args>) "{{{
function! s:quickMemo(...)

	"let str = input('comment: ',join(a:000))
	if a:0 == 0 
		let str = input('comment: ')
	else
		let str = join(a:000)
	endif 

	" 現在のファイルを保存
	let bufnr = bufnr("%")

	" howm ファイルを開く
	exe 'edit' g:howm_dir.strftime("/%Y/%m/%Y-%m-%d-000000.txt")

	" 保存する
	call append(1, strftime("[%Y-%m-%d %H:%M]".str))

	write

	" 編集中のファイルに戻す
	exe bufnr 'buffer'

endfunction "}}}

" フォルダ構造のコピー
command! -nargs=+ CopyFileDir call s:copyFileDir(<f-args>) "{{{
function! s:copyFileDir(file,...)
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

	echo 'mkdir "'.fnamemodify(file2,':h').'"'
	echo 'copy "'.file1.'" "'.file2.'"'

endfunction
"}}}
"
" 対象の文言を抽出する
command! -narg=1 GetWord call s:get_word(<line1>, <line2>, <f-args>) "{{{
function! s:get_word(lnum1, lnum2, word) 
	let lnum1 = a:lnum1
	let lnum2 = a:lnum2
	let word = a:word
	
	" 対象文字列以外の削除
	let cmd = '*s/\(^\|'.word.'\)\zs.\{-}\ze\('.word.'\|$\)//g'
	exe cmd
	*sort u

endfunction "}}}

" 連番の作成
command! -narg=0 SetNum call s:set_num() "{{{
function! s:set_num()
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

endfunction "}}}
