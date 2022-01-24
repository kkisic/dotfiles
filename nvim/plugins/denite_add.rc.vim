" Define Denite commands
noremap <silent> <leader>d :Denite buffer<CR>
noremap <silent> <leader>r :Denite file/rec<CR>
noremap <silent> <leader>g :Denite grep<CR>
noremap <silent> <leader>s :Denite -resume<CR>

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q denite#do_map('quit')
    nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
    nnoremap <silent><buffer><expr> j 'j'.denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> k 'k'.denite#do_map('do_action', 'preview')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction
