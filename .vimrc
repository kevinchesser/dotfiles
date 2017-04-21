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
set number      "Line numbers
set hlsearch    "Highlight words that match search
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set colorcolumn=80 "color coulmn at 80 chars
set cursorline     "line under the line your cursor is currently on
set title          "name of file open in your window title
set textwidth=80   "use visual select + gq to wrap text to 80 columns
syntax on          "syntax highlighting
filetype plugin indent on   "proper intedting

"set the colorcolumn to grey
highlight ColorColumn ctermbg=8

"Go to one before the end of the line
:vmap # $h
