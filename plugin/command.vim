let s:save_cpo = &cpo
set cpo&vim

" �O��̓���ւ�
command! -range -nargs=? MySwap <line1>,<line2>call vimwork#command#mySwap(<q-args>) 

" �������[�h�̒ǉ�
command! -narg=* AddSearch call vimwork#command#add_serach(<f-args>) 

" howm �ɒǉ�����
command! -narg=* QuickMemo call vimwork#command#quickMemo(<f-args>) 

" �t�H���_�\���̃R�s�[
command! -nargs=+ CopyFileDir call vimwork#command#copyFileDir(<f-args>) 
"
" �Ώۂ̕����𒊏o����
command! -range -narg=1 GetWord call vimwork#command#get_word(<line1>, <line2>, <f-args>)

" �A�Ԃ̍쐬
command! -narg=0 SetNum call vimwork#command#set_num() 

let &cpo = s:save_cpo
unlet s:save_cpo

