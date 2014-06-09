let a = 1
while(a)
let a = rabbit_ui#choices("mode", [
			\ "Quit",
			\ "MessageBox",
			\ "choices",
			\ "pannel",
			\ "Grid",
			\ ]).value
echo a
" let a = -1
if a == 1
	let s:title = 'MessageBox'
	let s:text = 'Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text '
	echo rabbit_ui#messagebox(s:title, s:text)
elseif a == 2
	let s:title = 'Choices'
	let s:com = [
				\ 'Dart', 'JavaScript', 'Vim script', 'Go', 'C', 'C++', 'Java', 'Perl',
				\ 'Ruby', 'Python', 'Haskell', 'HTML', 'css', 'Lisp', 'COBOL', 'Scheme',
				\ 'Scala', 'Lua', 'CoffeeScript', 'Common Lisp', 'Erlang',
				\ 'Elixir', 'Ada', 'Type Script', ]
	let s:selected_index = rabbit_ui#choices(s:title, s:com)
	echo s:selected_index
elseif a == 3
	let s:com = [
				\ 'Dart', 'JavaScript', 'Vim script', 'Go', 'C', 'C++', 'Java', 'Perl',
				\ 'Ruby', 'Python', 'Haskell', 'HTML', 'css', 'Lisp', 'COBOL', 'Scheme',
				\ 'Scala', 'Lua', 'CoffeeScript', 'Common Lisp', 'Erlang',
				\ 'Elixir', 'Ada', 'Type Script', ]
	let s:alp = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J' ]
	let s:spo = [
				\ '英語', '中国語', '韓国語', 'フランス語', 'ロシア語', 'ポルトガル語', 'スペイン語',
				\ 'ドイツ語', 'イタリア語', ]
	let s:num = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 ]

	echo rabbit_ui#panel([
				\ ['Computer Languages', s:com],
				\ ['Alphabets', s:alp],
				\ ['Spoken Languages', s:spo],
				\ ['Number', s:num],
				\ ])
elseif a == 4
	echo rabbit_ui#gridview([
				\ [1,2,3],
				\ [4,5,6],
				\ [7,8,9],
				\ ])
elseif a == 5
	call rabbit_ui#run_testcases()
endif
endwhile

