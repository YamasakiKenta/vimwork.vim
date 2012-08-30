noremap <PLUG>(tab_diff_start)
			\ :<C-u>call common#tabcopy()<CR>:windo diffthis<CR>:windo call common#map_diff()<CR>|"
noremap <PLUG>(tab_diff_end)
			\ :<C-u>diffoff!<CR>:windo call common#Map_diff_reset()<CR>:tabc<CR>|"
noremap <PLUG>(tab_diff_orig)
			\ :<C-u>call common#tabcopy()<CR>:DiffOrig<CR>:windo call common#map_diff()<CR>|"
