" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.
"Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'preservim/nerdtree'
"Plug 'vim-jp/vimdoc-ja'
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'vim-denops/denops.vim'
Plug 'vim-skk/denops-skkeleton.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'mattn/efm-langserver'
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'rafamadriz/friendly-snippets'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'tpope/vim-commentary'
"Plug 'cohama/lexima.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

call skkeleton#config({
\'eggLikeNewline':v:true
\})

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

""set nocompatible
""set helplang=ja
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

"let g:mapleader = "\<Space>"
"" vim-lsp がバッファで有効になったときに実行される関数
"" バッファローカルなキーバインドやオプションを指定
"" See: https://mattn.kaoriya.net/software/vim/20191231213507.htm
"function! s:on_lsp_buffer_enabled() abort
"    if &ft =~ 'ctrlp\|dirvish'
"        return
"    endif
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    nmap <buffer> <leader>a <plug>(lsp-code-action)
"    nmap <buffer> <leader>l <plug>(lsp-code-lens)
"    nmap <buffer> <leader>L <plug>(lsp-document-diagnostics)
"    " nmap <buffer> <leader>d <plug>(lsp-decralation)
"    nmap <buffer> <leader>D <plug>(lsp-definition)
"    nmap <buffer> <leader>y <plug>(lsp-type-definition)
"    nmap <buffer> <leader>i <plug>(lsp-implementation)
"    nmap <buffer> <leader>r <plug>(lsp-references)
"    nmap <buffer> <leader>R <plug>(lsp-rename)
"    nmap <buffer> <leader>S <plug>(lsp-document-symbol)
"    nmap <silent><buffer> <C-j> <plug>(lsp-next-diagnostic)
"    nmap <silent><buffer> <C-k> <plug>(lsp-previous-diagnostic)
"
"    if &ft =~ 'typescript\|javascript'
"        nmap <buffer> <leader>f :LspDocumentFormatSync --server=efm-langserver<CR>
"        xmap <buffer> <leader>f :LspDocumentRangeFormatSync --server=efm-langserver<CR>
"    else
"        nmap <buffer> <leader>f <plug>(lsp-document-format)
"        xmap <buffer> <leader>f <plug>(lsp-document-range-format)
"    endif
"endfunction
"augroup lsp_install
"  au!
"  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END
"" vim-lsp デバッグログの出力
"command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')
"
"" lightline.vim のステータスラインに vim-lsp diagnostics の数を表示する
"" augroup LightLineOnLSP
""   autocmd!
""   autocmd User lsp_diagnostics_updated call lightline#update()
"" augroup END
"
"let g:lsp_diagnostics_echo_cursor = 1
"
"" vim-lsp 経由でバッファの保存前にフォーマットをかける
"" See: https://zenn.dev/yami_beta/articles/589c567199ea28
"augroup MyLSPTypeScript
"    autocmd!
"    autocmd BufWritePre *.ts,*.tsx call execute('LspDocumentFormatSync --server=efm-langserver')
"augroup END
"
"let g:lsp_settings = {
"    \ 'efm-langserver': {
"        \ 'disabled': v:false
"    \ },
"\ }
"
"let g:asyncomplete_popup_delay = 200
"
"let g:vsnip_snippet_dir = expand($XDG_CONFIG_HOME . '/vsnip')
"" 補完のポップアップメニュー表示中
""   <CR> で候補を確定
"inoremap <expr><CR> pumvisible() ? "\<c-y>" : "\<cr>"
"" :h vsnip-mapping
"" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"" Expand or jump
"imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
"" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

