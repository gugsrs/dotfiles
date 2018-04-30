"*****************************************************************************
"" Abbreviations
"*****************************************************************************
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

"" Remove trailing whitespace on <leader>S
nnoremap <silent> <leader>S :call TrimWhiteSpace()<cr>:let @/=''<CR>

" vimshell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '
nnoremap <silent> <leader>sh :VimShellCreate<CR>

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

"" omnifunc
imap <C-l> <C-X><C-O>

"remap V to C-V, now V is Visual-Block
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

nnoremap <C-l> :Denite grep<CR>
nnoremap <C-p> :Denite file/rec buffer<CR>
set pastetoggle=<F5>

" save file with sudo
cmap w!! w !sudo tee > /dev/null %

iab IPDB import ipdb; ipdb.set_trace()
iab PDB import pdb; pdb.set_trace()
