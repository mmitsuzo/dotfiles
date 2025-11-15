" vim: set sw=2 ts=2 sts=2 et tw=78 :
"let mapleader = "\<Space>"
"set nrformats=
filetype plugin indent on
syntax on
nmap <Esc><Esc> :nohlsearch<Enter>
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"tnoremap <C-w><C-n> <C-w>N
set hlsearch
set incsearch
set shortmess-=S
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
"set ambiwidth=double
"set ambiwidth=single
set shell=bash

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
"Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yegappan/lsp'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
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

""###############
""### vim-lsp ###
""###############
"if executable('pylsp')
"  " pip install python-lsp-server
"  au User lsp_setup call lsp#register_server({
"    \ 'name': 'pylsp',
"    \ 'cmd': {server_info->['pylsp']},
"    \ 'allowlist': ['python'],
"    \ })
"endif
"
"function! s:on_lsp_buffer_enabled() abort
"  setlocal omnifunc=lsp#complete
"  setlocal signcolumn=yes
"  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"  nmap <buffer> gd <plug>(lsp-definition)
"  nmap <buffer> gs <plug>(lsp-document-symbol-search)
"  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"  nmap <buffer> gr <plug>(lsp-references)
"  nmap <buffer> gi <plug>(lsp-implementation)
"  nmap <buffer> gt <plug>(lsp-type-definition)
"  nmap <buffer> <leader>rn <plug>(lsp-rename)
"  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"  nmap <buffer> K <plug>(lsp-hover)
"  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"  let g:lsp_format_sync_timeout = 1000
"  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"
"  " refer to doc to add more commands
"endfunction
"
"augroup lsp_install
"  au!
"  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
""###############

"###########
"### LSP ###
"###########
" reference: https://github.com/girishji/vimcomplete
" (vimcomplete is implemented as core feature in latest vim)
" reference: https://github.com/yegappan/lsp/
" reference: https://github.com/yegappan/lsp/blob/main/doc/configs.md

"" Clangd language server
"call LspAddServer([#{
"	\    name: 'clangd',
"	\    filetype: ['c', 'cpp'],
"	\    path: '/usr/local/bin/clangd',
"	\    args: ['--background-index']
"	\  }])

" setting for vim-plug
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let lspServers = []
" for C/C++ LSP: apt install clangd
call add(lspServers, #{
      \ name: 'clang',
      \ filetype: ['c', 'cpp'],
      \ path: '/usr/bin/clangd',
      \ args: ['--background-index']
      \})
" for python LSP: apt install python3-pylsp
call add(lspServers, #{
      \	  name: 'pylsp',
      \	  filetype: 'python',
      \	  path: '/usr/bin/pylsp',
      \	  args: []
      \})
autocmd User LspSetup call LspAddServer(lspServers)
"###########

