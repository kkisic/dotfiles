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
set tabstop=4                 "タブ文字の幅
set shiftwidth=4              "オートインデントでずれる幅
set softtabstop=4             "連続空白に対するTabやBsによる移動幅

set splitbelow                "splitで下に開く
set splitright                "vsplitで右に開く

set encoding=utf-8
set clipboard=unnamedplus

set termguicolors
set pumblend=10
set winblend=10

set swapfile
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup

let mapleader = "\<Space>"

noremap <BS> <Nop>
inoremap <BS> <Nop>

noremap <silent> <leader>ch :checkhealth<CR>

set runtimepath^=~/work/deno/harrow.vim
let g:denops#server#service#deno_agrs = [
    \ '-q',
    \ '--unstable',
    \ '-A',
    \]

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state('~/.vim/dein')
    call dein#begin('~/.vim/dein')

    " toml
    let s:toml = '~/.config/nvim/dein.toml'
    let s:lazy = '~/.config/nvim/dein_lazy.toml'

    " cache
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let g:python3_host_prog = substitute(system('which python3'), "\n", "", "g")

" update plugins
let g:dein#install_github_api_token = $VIM_GITHUB_TOKEN
command! -nargs=0 Update call dein#check_update(v:true)

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.hs   setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.js   setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.ts   setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vue  setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.json setlocal softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.go   setlocal noexpandtab
augroup END

filetype plugin indent on
syntax enable

" nvim-treesitter
lua require('treesitter_config')
