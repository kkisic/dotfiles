set whichwrap=b,s,h,l         "行末行頭の左右移動で行をまたぐ
set scrolloff=4               "スクロール時の視界確保
set number                    "行番号表示
set cursorline                "下線
set list                      "不可視文字(tab文字等)の表示
set listchars=tab:<-,trail:_  "同上の表示指定

set showmatch                 "対応する括弧のハイライト
set autoindent                "前の行のインデントの継続
set smartindent               "改行時に次のインデントの自動調整
set expandtab                 "タブ文字を空白表示
set tabstop=8                 "タブ文字の幅
set shiftwidth=4              "オートインデントでずれる幅
set softtabstop=4             "連続空白に対するTabやBsによる移動幅

set encoding=utf-8
set clipboard=unnamedplus

set swapfile
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup

noremap <BS> <Nop>
inoremap <BS> <Nop>

if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    " toml
    let s:toml = '~/.config/nvim/dein.toml'
    let s:lazy = '~/.config/nvim/dein_lazy.toml'

    " cache
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy, {'lazy': 1})

    " deoplete
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" for deoplete
let g:python3_host_prog = expand('~/.pyenv/versions/3.7.0/bin/python')

" for deoplete-clang
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
" let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" for LanguageClient-neovim
set hidden
let g:LanguageClient_serverCommands = {
            \ 'vue': ['vls'],
            \ }

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js   setlocal tabstop=4 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue  setlocal tabstop=4 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=4 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.json setlocal tabstop=4 softtabstop=2 shiftwidth=2
augroup END

filetype plugin indent on
syntax enable
