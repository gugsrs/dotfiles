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
	call dein#add('Shougo/deoplete.nvim')

	"" Vim status bar
	call dein#add('itchyny/lightline.vim')

	"" Git
	call dein#add('airblade/vim-gitgutter')
	call dein#add('itchyny/vim-gitbranch')

	"" Others
	call dein#add('sheerun/vim-polyglot')
	call dein#add('tpope/vim-commentary')

	"" Python Bundle
	call dein#add("davidhalter/jedi-vim")
	call dein#add("scrooloose/syntastic")
	call dein#add("Yggdroot/indentLine")
	call dein#add('vim-scripts/indentpython.vim')
	call dein#add("zchee/deoplete-jedi")

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
