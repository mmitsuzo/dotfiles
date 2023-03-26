" Plugins will be downloaded under the specified directory.
"call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"" Declare the list of plugins.
""Plug 'tpope/vim-sensible'
""Plug 'junegunn/seoul256.vim'
""Plug 'preservim/nerdtree'
""Plug 'vim-jp/vimdoc-ja'
""Plug 'davidhalter/jedi-vim', {'for': 'python'}
"" List ends here. Plugins become visible to Vim after this call.
"call plug#end()

"set completeopt=menuone
"autocmd! User jedi-vim call s:jedivim_hook()
"function! s:jedivim_hook()
"    let g:jedi#auto_initialization    = 0
"    let g:jedi#auto_vim_configuration = 0
"    let g:jedi#popup_on_dot           = 0
"    let g:jedi#popup_select_first     = 0
"    let g:jedi#show_call_signatures   = 0
"    autocmd FileType python setlocal omnifunc=jedi#completions
"endfunction

"set nocompatible
"set helplang=ja
set shell=bash
set nrformats=
"filetype plugin on
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set hlsearch
set incsearch
set laststatus=2
