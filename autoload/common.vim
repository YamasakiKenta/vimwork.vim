let s:save_cpo = &cpo
set cpo&vim
" ********************************************************************************
" 使用しているスクリプト
"  - unite_perforce
"  - tabe_diff
" ********************************************************************************
function! common#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! common#LogFile(name, deleteFlg, ...) "{{{
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
		call common#MyQuit()
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
function! common#Get_cmds(cmd) "{{{
	return split(system(a:cmd),'\n')
endfunction "}}}
function! common#get_kk(str) "{{{
	"return substitute(a:str,'^\"?\(.*\)\"?','"\1"','')
	return len(a:str) ? '"'.a:str.'"' : ''
endfunction "}}}
function! common#is_different(path,path2) "{{{
	" ********************************************************************************
	" 差分を調べる
	" @param[in]	path				比較ファイル1
	" @param[in]	path2				比較ファイル2
	" @retval		flg			TRUE	差分あり
	" 							FALSE	差分なし
	" ********************************************************************************
	let flg = 1
	let outs = common#Get_cmds('fc '.common#get_kk(a:path).' '.common#Get_kk(a:path2))
	if outs[1] =~ '^FC: 相違点は検出されませんでした'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! common#get_pathSrash(path) "{{{
	return substitute(a:path,'\','/','g') " # / マークに統一
endfunction "}}}
function! common#get_pathEn(path) "{{{
	return substitute(a:path,'/','\','g') " # / マークに統一
endfunction "}}}
function! common#GetFileNameForUnite(args, context) "{{{
	" ファイル名の取得
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}
function! common#selectEdit_write(args) "{{{
"********************************************************************************
" Select Edit の保存
" @param[in]	args.start	開始位置
" @param[in]	args.end	終了位置
" @param[in]	args.bufnr	番号
"********************************************************************************

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
	call common#event_save_file_autocmd('common#selectEdit_write',a:args)


	" 編集するファイル の編集
	exe bufnr 'buffer'

	" 削除
	exe start.','.end 'delete'

	" 追加
	call append(start-1,strs)

	" tmpfileに戻す
	exe nowbufnr 'buffer'

endfunction "}}}
function! common#event_save_file(tmpfile,strs,func,args) "{{{
" ********************************************************************************
" ファイルを保存したときに、関数を実行します
" @param[in]	tmpfile		保存するファイル名 ( 分割するファイル名 ) 
" @param[in]	strs		初期の文章
" @param[in]	func		実行する関数名
" @param[in]	args		実行する関数名に渡す 引数
" ********************************************************************************

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

	call common#event_save_file_autocmd(a:func,a:args)

endfunction "}}}
function! common#event_save_file_autocmd(func,args) "{{{

	aug okazu_event_save_file
		au!
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func.'('.string(a:args).')'
	aug END

endfunction "}}}

function! common#change_unite() "{{{
" ********************************************************************************
" ファイルの切り替え ( unite ) 
" ********************************************************************************
	let root = substitute(expand("%:h"), '[\\/][^\\/]*$', '', '')
	let file = expand("%:t")
	let type = substitute(expand("%:h"), '.*[\\/]\ze.\{-}[\\/]', '', '')

	echo type
	if type =~ 'unite[\\/]kinds'
		let file = substitute(file, 'k_', '', '')
		exe 'e '.root.'/sources/'.file
	elseif type =~ 'unite[\\/]sources'
		exe 'e '.root.'/kinds/k_'.file
	endif

endfunction "}}}
function! common#map_diff_reset() "{{{
	map <buffer> <A-up> <A-up>
	map <buffer> <A-down> <A-down>
	map <buffer> <A-left> <A-left>
	map <buffer> <A-right> <A-right>
endfunction "}}}
function! common#map_diff_tab() "{{{
	"********************************************************************************
	" タブ切り替え時に処理を追加するため作成した
	"********************************************************************************
	wincmd w
endfunction "}}}
function! common#map_diff() "{{{
	map <buffer> <A-up> [c
	map <buffer> <A-down> ]c
	map <buffer> <A-left>  :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <A-right> :diffget<CR>:<C-u>diffupdate<CR>|"
	map <buffer> <tab> :<C-u>call common#map_diff_tab()<CR>|"
endfunction "}}}

let &cpo = s:save_cpo
unlet s:save_cpo

