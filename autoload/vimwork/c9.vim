let s:save_cpo = &cpo
set cpo&vim

set shell=/bin/sh$ " NeoBundleInstall がうまくいかない対応

if exists('s:save_cpo')
	let &cpo = s:save_cpo
	unlet s:save_cpo
endif
