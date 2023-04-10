" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
Plug 'preservim/nerdtree'
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
"Plug 'vim-jp/vimdoc-ja'
"Plug 'davidhalter/jedi-vim'
"Plug 'vim-denops/denops.vim'
"Plug 'vim-skk/denops-skkeleton.vim'
Plug 'vim-skk/eskk.vim'
"############################
"### asyncomplete setting ###
"############################
"Plug 'mattn/vim-lsp-settings'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"###########
"### ddc ###
"###########
"Plug 'Shougo/ddc.vim'
"Plug 'shun/ddc-vim-lsp'
"###########
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

""############################
""### asyncomplete setting ###
""############################
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
""inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"
"
"imap <c-space> <Plug>(asyncomplete_force_refresh)
"" For Vim 8 (<c-@> corresponds to <c-space>):
"" imap <c-@> <Plug>(asyncomplete_force_refresh)
"
"let g:asyncomplete_auto_popup = 0
"
"function! s:check_back_space() abort
"    let col = col('.') - 1
"    return !col || getline('.')[col - 1]  =~ '\s'
"endfunction
"
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ asyncomplete#force_refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"" allow modifying the completeopt variable, or it will
"" be overridden all the time
"let g:asyncomplete_auto_completeopt = 0
"
"set completeopt=menuone,noinsert,noselect,preview
"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
""############################

"##################
"### skkeleton ###
"##################
"imap <C-j> <Plug>(skkeleton-toggle)
"cmap <C-j> <Plug>(skkeleton-toggle)
""" JISYO file: https://skk-dev.github.io/dict/
""" https://skk-dev.github.io/dict/SKK-JISYO.L.gz
"call skkeleton#config({
"  \   'eggLikeNewline': v:true,
"  \   'globalJisyo': expand('~/.skk/SKK-JISYO.L'),
"  \ })
"##################

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

"set nocompatible
"set helplang=ja
"set shell=bash
"set nrformats=
filetype plugin on
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"set expandtab
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set autoindent
"set smartindent
set hlsearch
set incsearch
set laststatus=2
set background=dark
set modeline

command Tab0 set tabstop=8 shiftwidth=8 softtabstop=8 noautoindent nosmartindent
command Tab2 set tabstop=2 shiftwidth=2 softtabstop=2 autoindent smartindent
command Tab4 set tabstop=4 shiftwidth=4 softtabstop=4 autoindent smartindent
command Tab8 set tabstop=8 shiftwidth=8 softtabstop=8 autoindent smartindent

