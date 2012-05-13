" [ ] selectEditで保存できるようにする
"
" ********************************************************************************
" 前後の入れ替え
" ********************************************************************************
command! -range -nargs=? MySwap <line1>,<line2>call <SID>mySwap(<q-args>)
function! s:mySwap(qarg) "{{{
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

" ********************************************************************************
" 修正中のsyntax ファイルを修正する
" ********************************************************************************
command! MySyntaxFile call <SID>mySyntaxFile()
function! s:mySyntaxFile() "{{{
	exe 'e '.$IVIMWORK.'/syntax/'.&filetype.'.vim'
	call okazu#MyQuit()
endfunction "}}}

" ********************************************************************************
" 選択した部分を、コピーして別画面で開く
" ********************************************************************************
command! -range=% SelectEdit :call s:selectEdit(<line1>, <line2>)
function! s:selectEdit(start, end) "{{{

	" 行の保存
	let g:selectEdit_start = a:start
	let g:selectEdit_end   = a:end

	" 現在のファイルタイプを保存する
	let ft = &filetype

	" bufnrの保存
	let g:selectEdit_bufnr = bufnr("")

	if 0
		tabe! ~/vim/tmp/selectEdit
		% delete _
		0put t 
	else
		let strs = getline(g:selectEdit_start,g:selectEdit_end)
		call okazu#event_save_file('selectEdit',strs,"MySelectEdit_write()")
		$ delete _

		if 0 
			let tmpfile = 'selectEdit'

			"画面設定
			exe 'vnew' tmpfile
			setlocal noswapfile bufhidden=hide buftype=acwrite

			"文の書き込み
			%delete _
			call append(0,strs)

			"なぜか空白行なので削除
			$ delete

			" リセットする
			aug selectEdit
				autocmd!
				autocmd BufWriteCmd <buffer> nested call MySelectEdit_write()
			aug END
		endif

	endif

	exe 'set ft='.ft

endfunction "}}}
function! MySelectEdit_write() "{{{
	" ********************************************************************************
	" 選択した範囲に書き込み
	"
	" ********************************************************************************
	let start    = g:selectEdit_start
	let end      = g:selectEdit_end
	let bufnr    = g:selectEdit_bufnr

	" tmpfileの保存
	let nowbufnr = bufnr('%')
	let strs     = getline(0,'$')

	" 行の変更
	let g:selectEdit_end = start + line('$') - 1

	" 編集するファイル の編集
	exe bufnr 'buffer'

	" 削除
	exe start.','.end 'delete'

	" 追加
	" todo : 空白行なら追加しない
	call append(start-1,strs)

	" tmpfileに戻す
	exe nowbufnr 'buffer'

endfunction "}}}

" ********************************************************************************
" Grep を行う
" ********************************************************************************
command! -narg=+ MyGrep call <SID>grep(<f-args>)
function! s:grep(...) "{{{
	let word = join(a:000,'\|')
	exe 'vim /'.word.'/ **/*.'.g:myGrepFileType
endfunction "}}}

" ********************************************************************************
" 検索ワードの追加 ( OR 検索 )
" @param[in]	検索ワード
" ********************************************************************************
command! -narg=* ASearch call <SID>aserach(<f-args>)
function! s:aserach(...) "{{{
	if a:0 > 0
		let @/ = @/.'\|'.join(a:000,'\|')
	endif
endfunction "}}}

" ********************************************************************************
" howm に追加する
" ********************************************************************************
command! -narg=* QuickMemo call <SID>quickMemo(<f-args>)
function! s:quickMemo(...) "{{{

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

" ********************************************************************************
" フォルダ構造のコピー
" @param[in]	file1	コピー元
" @param[in]	root2	コピー先のルート
" @param[in]	root1	コピー元のルート
" ********************************************************************************

let g:copyFileDir_defaultRoot  = get(g:, 'copyFileDir_defaultRoot', 'c:')
let g:copyFileDir_defaultFile2 = get(g:, 'copyFileDir_defaultFile2', 'c:\tmp')

command! -nargs=+ CopyFileDir call <SID>copyFileDir(<f-args>)
function! s:copyFileDir(file,...) "{{{

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

