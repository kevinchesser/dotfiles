"Line to install vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'elixir-lang/vim-elixir'
Plug 'rondale-sc/vim-spacejam'
Plug 'tpope/vim-commentary'
Plug 'vim-erlang/vim-erlang-omnicomplete'
call plug#end()

"airline settings
let g:airline#extensions#branch#enabled = 1

"colors
colo delek

"vim settings
set number
set hlsearch
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set colorcolumn=80
set cursorline
set title
syntax on
filetype plugin indent on

"set the colorcolumn to grey
highlight ColorColumn ctermbg=8
