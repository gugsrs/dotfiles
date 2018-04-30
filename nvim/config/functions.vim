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
