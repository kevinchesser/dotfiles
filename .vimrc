set number
set hlsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
syntax on
filetype plugin indent on
colo delek
let g:airline#extensions#branch#enabled = 1

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" Any valid git URL is allowed
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'elixir-lang/vim-elixir'
call plug#end()
