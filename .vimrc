" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set ignorecase "Ignore case when searching

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells

syntax enable "Enable syntax hlsyntax enable

set expandtab
set shiftwidth=4
set tabstop=4
"set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines 

colorscheme darkblue
set background=dark
set nonu
set t_Co=256

set autoindent

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

" Need install powerline python
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set laststatus=2
