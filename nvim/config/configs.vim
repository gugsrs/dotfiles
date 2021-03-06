"*****************************************************************************
"" Python Host
"*****************************************************************************
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/local/Cellar/python@3.8/3.8.5/bin/python3'

"*****************************************************************************
"" NERDTree configuration
"*****************************************************************************
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <silent><F3> :NERDTreeToggle<CR>

"*****************************************************************************
"" Syntastic
"*****************************************************************************
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=0
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 1
let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_args='--ignore=W391,E501'
let g:syntastic_python_python_exec = 'python3'
noremap <leader>l :lclose<CR>

"" Custom configs

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END


"*****************************************************************************
"" Jedi-vim
"*****************************************************************************
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "<leader>k"
let g:jedi#usages_command = "<leader>n"
let g:jedi#force_py_version = 3
let g:jedi#completions_enabled = 0

"*****************************************************************************
"" Deoplete
"*****************************************************************************
call deoplete#custom#option({
\ 'smart_case': v:true
\ })
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#statement_lenght = 50
let g:deoplete#sources#jedi#show_docstring = 1

autocmd FileType text let b:deoplete_disable_auto_complete = 1
autocmd FileType tex let b:deoplete_disable_auto_complete = 1
autocmd FileType markdown let b:deoplete_disable_auto_complete = 1

if !exists('g:deoplete#omni#input_patterns')
	call deoplete#custom#option({
	\ 'omni_patterns': {}
	\ })
endif

call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

set nofoldenable
set foldlevel=99
set diffopt+=context:99999
let g:vim_markdown_folding_disabled=1


"*****************************************************************************
"" Black
"*****************************************************************************
let g:black_fast=1
let g:black_linelength=110
"" autocmd BufWritePre *.py execute ':Black'

autocmd FileType markdown let g:indentLine_enabled=0
