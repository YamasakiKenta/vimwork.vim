com! -complete=customlist,ListUsers -nargs=1 Finger echo <args>
let s:files = []
function! ListUsers(A,L,P)

	echo a:A a:L a:P


	if len(s:files) == 0
		let s:files = map( perforce#pfcmds('have','','//.../'.a:A.'...', "
					\ match(v:val, '.\{-}\ze#')
					\ ")
	endif

	let rtns = filter( copy(s:files), "v:val=~a:A")

	return rtns

endfunc
