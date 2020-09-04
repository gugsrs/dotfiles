" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set expandtab
set shiftround
set tabstop=4
set softtabstop=4
set shiftwidth=4

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden
set noshowmode

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set nofoldenable
set fileformats=unix,dos,mac
set showcmd
set shell=/bin/zsh

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set relativenumber
set number

set termguicolors

function! MyHighlights() abort
	highlight ColorColumn cterm=NONE ctermbg=darkcyan gui=NONE guibg=darkcyan
	highlight BadWhitespace ctermbg=red guibg=red
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END
colorscheme dracula
" colorscheme moonlight2

set colorcolumn=110

let no_buffers_menu=1
" set t_Co=256
" set background=dark

" set mousemodel=popup
" set t_Co=256
" set guioptions=egmrti
" set gfn=Monospace\ 10

" if has("gui_running")
"   if has("gui_mac") || has("gui_macvim")
"     set guifont=Menlo:h12
"     set transparency=1
"   endif
" else
"   let g:CSApprox_loaded = 1

"   if $COLORTERM == 'gnome-terminal'
"     set term=gnome-256color
"   else
"     if $TERM == 'xterm'
"       set term=xterm-256color
"     endif
"   endif
" endif

" if &term =~ '256color'
"   set t_ut=
" endif

"" Disable the blinking cursor.
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

let g:lightline = {
	  \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
