let s:save_cpo = &cpo
set cpo&vim

"
"Vim syntax file
"Language: @objc
"
syntax keyword objcStatement hyper CCScene
syntax keyword objcStatement CCMoveTo
syntax keyword objcType CGPoint CGSize
syntax keyword define ccp
syntax keyword type @property

let &cpo = s:save_cpo
unlet s:save_cpo

