"set nocompatible
"set helplang=ja
"set shell=bash
"set nrformats=
filetype plugin on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set hlsearch
set incsearch
set laststatus=2
set modeline
"set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=full
"set number
set ruler
"set cursorline
"set cursorcolumn

set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

command T0 set ts=8 sw=8 sts=8 noai nosi nocin noet
command T2 set ts=2 sw=2 sts=2 ai si cin cino=(0,W2,g0,i0 et
command T4 set ts=4 sw=4 sts=4 ai si cin cino=(0,W4,g0,i0 et
command T8 set ts=8 sw=8 sts=8 ai si cin cino=(0,W8,g0,i0 et

"################################################################
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
"Plug 'vim-jp/vimdoc-ja'
Plug 'vim-skk/eskk.vim'
"Plug 'tpope/vim-surround'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"################################################################

"let g:airline_theme='<theme>'
"let g:airline_theme='luna'
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:indent_guides_enable_on_vim_startup = 1

"#######################
"### vim-lsp setting ###
"#######################
"let g:lsp_auto_enable = 0
"let g:lsp_auto_enable = 1
"let g:lsp_document_highlight_enabled = 0
"let g:lsp_diagnostics_enabled = 0
"let g:lsp_diagnostics_echo_cursor = 0
"set signcolumn=no
let g:lsp_log_verbose = 0
let g:lsp_log_file = ""

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gs <plug>(lsp-document-symbol-search)
  nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
"  nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
"  nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

  let g:lsp_format_sync_timeout = 1000
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

  " refer to doc to add more commands
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the
  " server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
"#######################


"############################
"### asyncomplete setting ###
"############################
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

imap <c-space> <Plug>(asyncomplete_force_refresh)
" For Vim 8 (<c-@> corresponds to <c-space>):
" imap <c-@> <Plug>(asyncomplete_force_refresh)

"let g:asyncomplete_auto_popup = 0
"let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"let g:OmniSharp_server_use_net6 = 1

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"############################


"############
"### eskk ###
"############
"if !filereadable(expand('~/.skk/SKK-JISYO.L'))
"  call mkdir('~/.skk', 'p')
"  call system('cd ~/.skk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz')
"endif
let g:eskk#directory = "~/.skk"
let g:eskk#dictionary = { 'path': "~/.skk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
let g:eskk#egg_like_newline = 1
"############

