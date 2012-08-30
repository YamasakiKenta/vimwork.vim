nnoremap <Plug>(set_number)
			\ :<C-u>call <SID>set_num()<CR>

nnoremap <Plug>(uniq_line)
			\ :g/./if getline(line(".")) == getline(line(".")-1)\|d<CR>

nnoremap <Plug>(select_search)
			\ :<C-u>let @a = @/<CR>/<C-p>/e<CR>:let @/ = @a<CR>ma<C-o>v`a

function! <SID>set_num() "{{{
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

