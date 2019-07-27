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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    call dein#add('tpope/vim-surround')
    call dein#add('kana/vim-filetype-haskell')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('luochen1990/rainbow')
    call dein#add('gi1242/vim-tex-syntax')
    call dein#add('alvan/vim-closetag')
    call dein#add('posva/vim-vue')
    call dein#add('tomasr/molokai')
    call dein#add('miyakogi/seiya.vim')
    call dein#add('dag/vim2hs')

    " deoplete
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    call dein#add('autozimu/LanguageClient-neovim', {
                \ 'rev': 'next',
                \ 'build': 'bash install.sh',
                \ })
    call dein#add('zchee/deoplete-clang')
    call dein#add('posva/vim-vue')
    call dein#add('eagletmt/ghcmod-vim')
    call dein#add('eagletmt/neco-ghc')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" for deoplete
let g:deoplete#enable_at_startup = 1

" for deoplete-clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang-3.8.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang'

" for LanguageClient-neovim
set hidden
let g:LanguageClient_serverCommands = {
            \ 'vue': ['vls'],
            \ }

" for rainbow
let g:rainbow_active = 1

" for vim-closetag
let g:closetag_filenames = '*.html, *.xml, *.vue'

" for vim2hs
let g:haskell_conceal = 0

" for molokai
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1

" for seiya.vim
let g:seiya_auto_enable = 1

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.js   setlocal tabstop=4 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue  setlocal tabstop=4 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=4 softtabstop=2 shiftwidth=2
augroup END

filetype plugin indent on
syntax enable
