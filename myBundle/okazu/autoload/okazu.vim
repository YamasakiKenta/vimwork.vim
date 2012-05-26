function! okazu#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! okazu#LogFile(name, deleteFlg, ...) "{{{
	" ********************************************************************************
	" 新しいファイルを開いて書き込み禁止にする 
	" @param[in]	name		書き込み用tmpFileName
	" @param[in]	deleteFlg	初期化する
	" @param[in]	[...]		書き込むデータ
	" ********************************************************************************

	let @t = expand("%:p") " # mapで呼び出し用
	let name = a:name

	" 開いているか調べる
	let bnum = bufwinnr(name) 

	if bnum == -1
		" 画面内になければ新規作成
		exe 'sp ~/'.name
		%delete _          " # ファイル消去
		setl buftype=nofile " # 保存禁止
		setl fdm=manual
		call okazu#MyQuit()
	else
		" 表示しているなら切り替える
		exe bnum . 'wincmd w'
	endif

	" 初期化する
	if a:deleteFlg == 1
		%delete _
	endif

	" 書き込みデータがあるなら書き込む
	if exists("a:1") 
		call append(0,a:1)
	endif
	cal cursor(1,1) " # 一行目に移動する

endfunction "}}}


function! okazu#Get_cmds(cmd) "{{{
	return split(system(a:cmd),'\n')
endfunction "}}}
function! okazu#Get_kk(str) "{{{
	"return substitute(a:str,'^\"?\(.*\)\"?','"\1"','')
	return len(a:str) ? '"'.a:str.'"' : ''
endfunction "}}}
function! okazu#Map_diff() "{{{
	map <buffer> <up> [c
	map <buffer> <down> ]c
	map <buffer> <left> dp:<C-u>diffupdate<CR>
	map <buffer> <right> dn:<C-u>diffupdate<CR>
	map <buffer> <tab> <C-w><C-w>
endfunction "}}}
function! okazu#Map_diff_reset() "{{{
	map <buffer> <up> <up>
	map <buffer> <down> <down>
	map <buffer> <left> <left>
	map <buffer> <right> <right>
endfunction "}}}
function! okazu#is_different(path,path2) "{{{
	" ********************************************************************************
	" 差分を調べる
	" @param[in]	path				比較ファイル1
	" @param[in]	path2				比較ファイル2
	" @retval		flg			TRUE	差分あり
	" 							FALSE	差分なし
	" ********************************************************************************
	let flg = 1
	let outs = okazu#Get_cmds('fc '.okazu#Get_kk(a:path).' '.okazu#Get_kk(a:path2))
	if outs[1] =~ '^FC: 相違点は検出されませんでした'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! okazu#get_pathSrash(path) "{{{
	return substitute(a:path,'\','/','g') " # / マークに統一
endfunction "}}}
function! okazu#get_pathEn(path) "{{{
	return substitute(a:path,'/','\','g') " # / マークに統一
endfunction "}}}
function! okazu#GetFileNameForUnite(args, context) "{{{
	" ファイル名の取得
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}

" ********************************************************************************
" 連番の作成
" カーソル以降の数字を、前の数字にひとつ加算したものにする ( マイナスは、考慮しない ) 
" ********************************************************************************
function! okazu#set_num() "{{{

	" カーソル位置の取得
	let pos = getpos(".")
	let lnum = pos[1]
	let col  = pos[2] - 1

	"********************
	" 前の行
	"********************
	let lstr = getline(lnum-1)

	" 数字の取得
	let nums = split(lstr, '\D\+') + [1]

	"********************
	" 現在の行
	"********************
	let lstr  = getline(lnum)

	"********************************************************************************
	" 数字の末尾で分割
	"--------------------------------------------------------------------------------
	" 1 : aaa12(3)4aaaa  : () カーソル位置
	" 2 : aaa1234 , aaaa : カーソルより後ろの数字の末尾で分割
	" 3 : aaa     , aaa  : 数字の削除
	"********************************************************************************
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

"********************************************************************************
" Select Edit の保存
" @param[in]	args.start	開始位置
" @param[in]	args.end	終了位置
" @param[in]	args.bufnr	番号
"********************************************************************************
function! okazu#selectEdit_write(args) "{{{

	let start    = a:args.start
	let end      = a:args.end
	let bufnr    = a:args.bufnr

	" tmpfileの保存
	set nomodified
	let nowbufnr = bufnr('%')
	let strs     = getline(0,'$')

	" 行の変更
	let a:args.end = start + line('$') - 1

	" argsの更新
	call okazu#event_save_file_autocmd('okazu#selectEdit_write',a:args)


	" 編集するファイル の編集
	exe bufnr 'buffer'

	" 削除
	exe start.','.end 'delete'

	" 追加
	call append(start-1,strs)

	" tmpfileに戻す
	exe nowbufnr 'buffer'

endfunction "}}}

" ********************************************************************************
" ファイルを保存したときに、関数を実行します
" @param[in]	tmpfile		保存するファイル名 ( 分割するファイル名 ) 
" @param[in]	strs		初期の文章
" @param[in]	func		実行する関数名
" @param[in]	args		実行する関数名に渡す 引数
" ********************************************************************************
function! okazu#event_save_file(tmpfile,strs,func,args) "{{{

	"画面設定
	let bnum = bufwinnr(a:tmpfile) 

	if bnum == -1
		exe 'vnew' a:tmpfile
		setlocal noswapfile bufhidden=hide buftype=acwrite
	else
		" 表示しているなら切り替える
		exe bnum . 'wincmd w'
	endif

	"文の書き込み
	%delete _
	call append(0,a:strs)

	"一行目に移動
	call cursor(1,1) 

	call okazu#event_save_file_autocmd(a:func,a:args)

endfunction "}}}
function! okazu#event_save_file_autocmd(func,args) "{{{

	aug okazu_event_save_file
		au!
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func.'('.string(a:args).')'
	aug END

endfunction "}}}

" ********************************************************************************
" ファイルの切り替え
" ********************************************************************************
function! okazu#change_extension() "{{{
	let extension = expand("%:e")
	if extension == 'c'
		e %:r.h
	elseif extension == 'h'
		e %:r.c
	endif
endfunction "}}}
