noremap <PLUG>(tab_diff_start)
			\ :<C-u>call okazu#tabcopy()<CR>:windo diffthis<CR>:windo call okazu#Map_diff()<CR>|"
noremap <PLUG>(tab_diff_end)
			\ :<C-u>diffoff!<CR>:windo call okazu#Map_diff_reset()<CR>:tabc<CR>|"
noremap <PLUG>(tab_diff_orig)
			\ :<C-u>call okazu#tabcopy()<CR>:DiffOrig<CR>:windo call okazu#Map_diff()<CR>|"
