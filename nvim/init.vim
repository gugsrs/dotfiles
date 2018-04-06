if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/plugins/'))
	call dein#begin(expand('~/.config/nvim/plugins/'))

	call dein#add(expand('~/.config/nvim/plugins/repos/github.com/Shougo/dein.vim'))
	call dein#add('Shougo/denite.nvim')
	call dein#add('Shougo/vimproc.vim', {'build': 'make'})

	"" Shell
	call dein#add('Shougo/deol.nvim')

	"" Files
	call dein#add('scrooloose/nerdtree')

	"" Completion
	call dein#add('ervandew/supertab')
	call dein#add('craigemery/vim-autotag')
	call dein#add('Shougo/deoplete.nvim')

	"" Vim status bar and colorscheme
	call dein#add('flazz/vim-colorschemes')
	call dein#add('itchyny/lightline.vim')

	"" Git
	call dein#add('airblade/vim-gitgutter')
	call dein#add('itchyny/vim-gitbranch')

	"" Others
	call dein#add('sheerun/vim-polyglot')
	call dein#add('vim-scripts/grep.vim')

	"" Snippets
	call dein#add('honza/vim-snippets')
	call dein#add('tpope/vim-commentary')

	"" Python Bundle
	call dein#add("davidhalter/jedi-vim")
	call dein#add("scrooloose/syntastic")
	call dein#add("majutsushi/tagbar")
	call dein#add("Yggdroot/indentLine")
	call dein#add('vim-scripts/indentpython.vim')

	"" HTML Bundle
	call dein#add('hail2u/vim-css3-syntax')
	call dein#add('gorodinskiy/vim-coloresque')
	call dein#add('tpope/vim-haml')
	call dein#add('mattn/emmet-vim')

	call dein#end()
	call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif


" Required:
filetype plugin indent on

let g:deoplete#enable_at_startup = 1
let g:python_host_prog = '/usr/local/Cellar/python@2/2.7.14_3/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python/3.6.4_4/bin/python3'

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

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set relativenumber
set number

let no_buffers_menu=1
highlight BadWhitespace ctermbg=red guibg=red
set t_Co=256
set background=dark
colorscheme inkpot

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=1
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

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

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

let g:lightline = {
	  \ 'colorscheme': 'Dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

if !exists('*TrimWhiteSpace')
  function TrimWhiteSpace()
    let @*=line(".")
    %s/\s*$//e
    ''
  endfunction
endif

if !exists('*SetupPython')
  function SetupPython()
    set autoindent
    set textwidth=119
	set fileformat=unix
	let python_highlight_all=1
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"" Python
augroup vimrc-make-cmake
  autocmd!
  ""autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd BufNewFile,BufRead *.py call SetupPython()
augroup END

if has("gui_running")
  augroup vimrc-white-space
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
  augroup END
endif

autocmd Filetype html setlocal ts=2 sts=2 sw=2

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
"" Change split position Horizontal/Vertical
nnoremap <Leader>h <C-w>H
nnoremap <Leader>v <C-w>K

"" Git
noremap <Leader>ga :!git add .<CR>
noremap <Leader>gc :!git commit -m '<C-R>="'"<CR>
noremap <Leader>gsh :!git push<CR>
noremap <Leader>gll :!git pull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1


"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhiteSpace()<cr>:let @/=''<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap P "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Open current line on GitHub
noremap ,o :!echo `git url`/blob/`git rev-parse --abbrev-ref HEAD`/%\#L<C-R>=line('.')<CR> \| xargs open<CR><CR>

"" Custom configs

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#use_tabs_not_buffers = 1

" syntastic
let g:syntastic_python_checkers=['python', 'flake8', 'pylint']
let g:syntastic_python_flake8_args='--ignore=W391,E501'
noremap <leader>l :lclose<CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"" omnifunc
imap <C-l> <C-X><C-O>

"remap V to C-V, now V is Visual-Block
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

" unite.vim
nnoremap <C-l> :Unite file file_rec buffer<CR>
nnoremap <C-p> :Unite file_rec/async<cr>

set pastetoggle=<F5>

" save file with sudo
cmap w!! w !sudo tee > /dev/null %

iab IPDB import ipdb; ipdb.set_trace()
iab PDB import pdb; pdb.set_trace()

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
