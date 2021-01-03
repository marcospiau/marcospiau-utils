execute pathogen#infect()
" Options for pydocstring plugin
let g:pydocstring_doq_path = '/opt/conda/bin/doq'
let g:pydocstring_formatter = 'google'
map <Leader>d :Pydocstring <Enter>


set number
set colorcolumn=80
set nocompatible
set path+=**
set wildmenu
set splitbelow
set splitright
set ignorecase
set smartcase
set incsearch

" monokai color scheme
colorscheme monokai

" enable syntax highlighting
syntax enable

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
" set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Improves indentation for python
syntax on
filetype plugin indent on

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" jk or jk to enter/exit command mode
inoremap jk <esc>
inoremap kj <esc>

" autocomplete
set omnifunc=syntaxcomplete#Complete

" Relative numbers
" set relativenumber
