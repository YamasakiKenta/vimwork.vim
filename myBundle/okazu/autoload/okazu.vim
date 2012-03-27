function! okazu#MyQuit() "{{{
	map <buffer> q :q<CR>
endfunction "}}}
function! okazu#LogFile(name,...) "{{{
	" ********************************************************************************
	" 新しいファイルを開いて書き込み禁止にする 
	" @param[in]	name		書き込み用tmpFileName
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
		set buftype=nofile " # 保存禁止
		call okazu#MyQuit()
	else
		" 表示しているなら切り替える
		exe bnum . 'wincmd w'
	endif

	" 書き込みデータがあるなら書き込む
	if exists("a:1") 
		call append(0,a:1)
	endif
	cal cursor(1,1) " # 一行目に移動する

endfunction "}}}
function! okazu#event_save_file(tmpfile,strs,func) "{{{
	" ********************************************************************************
	" ファイルを保存したときに、関数を実行します
	" @param[in]	tmpfile		保存するファイル名 ( 分割するファイル名 ) 
	" @param[in]	strs		初期の文章
	" @param[in]	func		実行する関数名
	" ********************************************************************************
	"
	"画面設定
	exe 'vnew' a:tmpfile
    setlocal noswapfile bufhidden=hide buftype=acwrite

	"文の書き込み
	%delete _
	call append(0,a:strs)

	"一行目に移動
	cal cursor(1,1) 

	aug okazu_event_save_file "{{{
		au!
		autocmd! BufWriteCmd <buffer>
		exe 'autocmd BufWriteCmd <buffer> nested call '.a:func
	aug END "}}}


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
	" return  TRUE : 差分あり
	" ********************************************************************************
	" 差分を調べる
	" @param[in]	path				比較ファイル1
	" @param[in]	path2				比較ファイル2
	" @return		flg			TRUE	差分あり
	" 							TRUE	差分なし
	" ********************************************************************************
	let flg = 1
	let outs = okazu#Get_cmds('fc '.okazu#Get_kk(a:path).' '.okazu#Get_kk(a:path2))
	if outs[1] =~ '^FC: 相違点は検出されませんでした'
		let flg = 0
	endif
	return flg
endfunction "}}}
function! okazu#get_pathSrash(path) "{{{
	let path = a:path
	let path = substitute(path,'\','/','g') " # / マークに統一
	"let path = substitute(path,'[^/]$','&/','') " # / を最後につける
	return path
endfunction "}}}
function! okazu#GetFileNameForUnite(args, context) "{{{
	" ファイル名の取得
	let a:context.source__path = expand('%:p')
	let a:context.source__linenr = line('.')
	call unite#print_message('[line] Target: ' . a:context.source__path)
endfunction "}}}
function! okazu#get_ronri_seki(a,b) "{{{
	" ********************************************************************************
	" 論理和をします
	" @param[in]	a		
	" @param[in]	b		
	" ********************************************************************************
	
	let a = a:a
	let b = a:b

	"多い数字の取得
	let [dai,syo] = a > b ? [a,b] : [b,a]

	let rtn = 0
	let omomi = 1
	while ( syo > 0 ) 
		if syo % 2 && dai % 2
			let rtn += omomi
		endif
		let dai = dai / 2
		let syo = syo / 2
		let omomi = omomi * 2
	endwhile

	return rtn

endfunction "}}}

echo okazu#get_ronri_seki(4,4)

