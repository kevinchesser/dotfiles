"Line to install vim-plug
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'rondale-sc/vim-spacejam'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'vim-airline/vim-airline-themes'
Plug 'farmergreg/vim-lastplace'
Plug 'kana/vim-smartinput'
call plug#end()

"airline settings
let g:airline#extensions#branch#enabled = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"colors
colo slate

"vim settings
set number      "Line numbers
set hlsearch    "Highlight words that match search
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 "Set tabs to 2 spaces in js
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set colorcolumn=80 "color coulmn at 80 chars
set cursorline     "line under the line your cursor is currently on
set title          "name of file open in your window title
set textwidth=80   "use visual select + gq to wrap text to 80 columns
syntax on          "syntax highlighting
filetype plugin indent on   "proper intedting
set ignorecase smartcase
set noerrorbells visualbell t_vb= "Stop error sounds when pressing escape
autocmd GUIEnter * set visualbell t_vb=

"set the colorcolumn to grey
"highlight ColorColumn ctermbg=8

"This allows you to switch buffers if you've modified a buffer.
set hidden

"To open a new empty buffer
"This replaces :tabnew which I used to bind to this mapping
nmap <S-t> :enew<cr>

"Move to the next buffer
nmap <S-l> :bnext<CR>

"Move to the previous buffer
nmap <S-h> :bprevious<CR>

"Close the current buffer and move to the previous one
"This replicates the idea of closing a tab
nmap <S-w> :bp <BAR> bd #<CR>

"Go to one before the end of the line in visual select mode
:vmap # $h
