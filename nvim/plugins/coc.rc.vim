set hidden
set signcolumn=yes

" Enterで補完候補の確定
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Tab/Shift Tabで補完候補の選択
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <silent> <leader>rn <Plug>(coc-rename)

" for coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-jedi',
            \ 'coc-json',
            \ 'coc-rust-analyzer',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-sql',
            \ 'coc-stylelintplus',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-yaml',
            \ ]
