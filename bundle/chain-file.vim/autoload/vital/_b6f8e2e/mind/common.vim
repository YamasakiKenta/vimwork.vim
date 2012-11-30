let s:save_cpo = &cpo
set cpo&vim

function! s:get_list(tmp) "{{{
	" リストにして返す
	return (type(a:tmp) == type([])) ? a:tmp : [a:tmp]
endfunction 
"}}}
function! s:set_dict_extend(dict1, dict2) "{{{
	" 同じキーがある場合は、リストで結合して返す
	let [dict1, dict2] = ( len(a:dict1) > len(a:dict2) ) ? [a:dict1, a:dict2] : [a:dict2, a:dict1]

	let dict_new = dict1

	for key in keys(dict2)
		let dict_new[key] = exists('dict_new[key]') ?  call extend(s:get_list(dict_new[key]), s:get_list(a:dict2[key])) : a:dict2[key]
	endfor

	let dict = a:dict1
	let dict = dict_new

	return dict_new
endfunction
"}}}

let &cpo = s:save_cpo
unlet s:save_cpo
