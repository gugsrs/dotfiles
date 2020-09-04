if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/gustavo/.cache/dein')
	call dein#begin('/Users/gustavo/.cache/dein')

	call dein#add('/Users/gustavo/.cache/dein/repos/github.com/Shougo/dein.vim')

	call dein#add('Shougo/vimproc.vim', {'build': 'make'})

	"" Shell
	call dein#add('Shougo/deol.nvim')

	"" Files
	call dein#add('Shougo/defx.nvim')
	call dein#add('kristijanhusak/defx-icons')

	"" Completion
	call dein#add('ervandew/supertab')
	call dein#add('Shougo/deoplete.nvim')

	"" Vim status bar
	call dein#add('itchyny/lightline.vim')

	"" Git
	call dein#add('airblade/vim-gitgutter')
	call dein#add('itchyny/vim-gitbranch')
	call dein#add('tpope/vim-fugitive')

	"" Others
	call dein#add('sheerun/vim-polyglot')
	call dein#add('tpope/vim-commentary')
	call dein#add('ryanoasis/vim-devicons')

	"" Python Bundle
	call dein#add('davidhalter/jedi-vim')
	call dein#add('scrooloose/syntastic')
	call dein#add('Yggdroot/indentLine')
	call dein#add('vim-scripts/indentpython.vim')
	call dein#add('zchee/deoplete-jedi')
	call dein#add('tell-k/vim-autopep8')
	call dein#add('python/black')

	"" Go
	call dein#add('fatih/vim-go')

	"" HTML Bundle
	call dein#add('hail2u/vim-css3-syntax')
	call dein#add('gorodinskiy/vim-coloresque')
	call dein#add('tpope/vim-haml')
	call dein#add('mattn/emmet-vim')
	call dein#add('dracula/vim')
	call dein#add('tpope/vim-surround')
    call dein#local('~/dev/', {}, ['vim-moonlight2'])
    call dein#local('~/dev/', {}, ['vim-vaporwave'])

	call dein#add('dracula/vim')

	call dein#end()
	call dein#save_state()
endif
if dein#check_install()
  call dein#install()
endif
