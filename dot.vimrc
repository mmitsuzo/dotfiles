" vim: set sw=2 ts=2 sts=2 et tw=78 :
let mapleader = "\<Space>"
"set clipboard=unnamed,unnamedplug
"set nocompatible
"set helplang=ja
"set shell=bash
"set nrformats=
filetype plugin indent on
syntax on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"nmap <silent> // :nohlsearch<CR>
"nnoremap <silent> <leader>/ :nohlsearch<CR>
set hlsearch
set incsearch
set laststatus=2
set modeline
"set omnifunc=syntaxcomplete#Complete
set wildmenu
set wildmode=full
set number
"set ruler
"set cursorline
"set cursorcolumn
set mouse=a
set noerrorbells visualbell t_vb=
set showcmd
set autoindent
"set smartindent
"set cindent
set pastetoggle=<F12>
"set nojoinspaces
set signcolumn=no
set nolist
"set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:␣

set background=dark
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"command T0 set ts=8 sw=8 sts=8 noai nosi nocin noet
"command T2 set ts=2 sw=2 sts=2 ai si cin cino=(0,W2,g0,i0 et
"command T4 set ts=4 sw=4 sts=4 ai si cin cino=(0,W4,g0,i0 et
"command TT2 set ts=2 sw=2 sts=2 ai si cin cino=(0,W2,g0,i0 noet
"command TT4 set ts=4 sw=4 sts=4 ai si cin cino=(0,W4,g0,i0 noet
"command TT8 set ts=8 sw=8 sts=8 ai si cin cino=(0,W8,g0,i0 noet
command T0 set ts=8 sw=8 sts=8 noai nosi nocin noet
command T2 set ts=2 sw=2 sts=2 ai et
command T4 set ts=4 sw=4 sts=4 ai et
command TT2 set ts=2 sw=2 sts=2 ai noet
command TT4 set ts=4 sw=4 sts=4 ai noet
command TT8 set ts=8 sw=8 sts=8 ai noet

"################################################################
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
"Plug 'junegunn/seoul256.vim'
"Plug 'vim-jp/vimdoc-ja'
Plug 'vim-skk/eskk.vim'
Plug 'mattn/vim-lsp-settings'
"Plug 'mattn/vim-lsp-icons'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/vsnip-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/calendar.vim'
"Plug 'OmniSharp/omnisharp-vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"################################################################
silent! colorscheme solarized8
"let g:indent_guides_enable_on_vim_startup = 1
"let g:lightline.colorscheme = 'solarized'
"let g:calendar_google_calendar = 1
"let g:calendar_google_task = 1

"############################
"### asyncomplete setting ###
"############################
"let g:asyncomplete_auto_popup = 1
"let g:asyncomplete_auto_completeopt = 1
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
"inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"
inoremap <expr> <C-y>   pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e>   pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"############################


"#####################
"### vsnip setting ###
"#####################
" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
"nmap        s   <Plug>(vsnip-select-text)
"xmap        s   <Plug>(vsnip-select-text)
"nmap        S   <Plug>(vsnip-cut-text)
"xmap        S   <Plug>(vsnip-cut-text)
" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
"let g:vsnip_filetypes = {}
"let g:vsnip_filetypes.javascriptreact = ['javascript']
"let g:vsnip_filetypes.typescriptreact = ['typescript']
"#####################


"##################################
"###  mix ayncomplete and vsnip ###
"##################################
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : "\<S-Tab>"
"##################################


"#######################
"### vim-lsp setting ###
"#######################
let g:lsp_log_verbose = 0
let g:lsp_log_file = ""
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand(s:settings_data_dir . '/lsp.log')
" let g:asyncomplete_log_file = expand(s:settings_data_dir. '/asyncomplete.log')
"let g:lsp_use_native_client = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_format_sync_timeout = 1000
let g:lsp_documentation_float_docked = 1
"let g:lsp_inlay_hints_enabled = 0
let g:lsp_semantic_enabled = 1
let g:lsp_code_actions_use_popup_menu = 1

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
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  if has('nvim')
    nnoremap <buffer> <leader>ca :LspCodeAction<CR>
    xnoremap <buffer> <leader>ca :LspCodeAction<CR>
  else
    nmap <buffer> ca <Plug>(lsp-code-action-float)
  endif

  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> <leader>cl :LspCodeLens<CR>
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
  autocmd! BufWritePre *.ts,*.tsx call execute('LspDocumentFormatSync --server=efm-langserver')

  "nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
  "nnoremap <buffer> <expr><c-d> lsp#scroll(-4)
endfunction

augroup configure_lsp
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" custom toggle
function! AsyncompleteToggle() abort
    if b:asyncomplete_enable == 1
        let b:asyncomplete_enable = 0
        let b:asyncomplete_auto_popup = 0
        let b:asyncomplete_auto_completeopt = 0
        let b:lsp_diagnostics_enabled = 0
        setlocal signcolumn=no
    else
        let b:asyncomplete_enable = 1
        let b:asyncomplete_auto_popup = 1
        let b:asyncomplete_auto_completeopt = 1
        let b:lsp_diagnostics_enabled = 1
        setlocal signcolumn=yes
    endif
endfunction
command AT call AsyncompleteToggle()
"#######################


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


"#####################
"### private macro ###
"#####################
command NT :NERDTreeToggle

