" vim: set sw=2 ts=2 sts=2 et tw=78 :
"let mapleader = "\<Space>"
"set nrformats=
filetype plugin indent on
syntax on
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set hlsearch
set incsearch
"set laststatus=2
set modeline
"set wildmenu
"set wildmode=full
"set showcmd
"set pastetoggle=<F12>
"set nojoinspaces
"set nolist
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:␣
set ambiwidth=double
"set ambiwidth=single

set background=dark
"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"command T0 set ts=8 sw=8 sts=8 noai nosi nocin noet
"command T2 set ts=2 sw=2 sts=2 ai si cin cino=(0,W2,g0,i0 et
"command T4 set ts=4 sw=4 sts=4 ai si cin cino=(0,W4,g0,i0 et
"command TT2 set ts=2 sw=2 sts=2 ai si cin cino=(0,W2,g0,i0 noet
"command TT4 set ts=4 sw=4 sts=4 ai si cin cino=(0,W4,g0,i0 noet
"command TT8 set ts=8 sw=8 sts=8 ai si cin cino=(0,W8,g0,i0 noet
command T0 set ts=8 sw=8 sts=8 noet
command T2 set ts=2 sw=2 sts=2 et
command T4 set ts=4 sw=4 sts=4 et
command T8 set ts=8 sw=8 sts=8 et
command TT0 set ts=8 sw=8 sts=8 noet
command TT2 set ts=2 sw=2 sts=2 noet
command TT4 set ts=4 sw=4 sts=4 noet
command TT8 set ts=8 sw=8 sts=8 noet

"################################################################
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
"Plug 'vim-jp/vimdoc-ja'
Plug 'vim-skk/eskk.vim'
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
"Plug 'rbtnn/vim-ambiwidth'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"################################################################

"############
"### eskk ###
"############
if !filereadable(expand('~/.skk/SKK-JISYO.L'))
  call mkdir('~/.skk', 'p')
  call system('cd ~/.skk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz')
endif
let g:eskk#directory = "~/.skk"
let g:eskk#dictionary = { 'path': "~/.skk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#egg_like_newline = 1
"############

