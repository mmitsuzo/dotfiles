" vim: set sw=2 ts=2 sts=2 et tw=78 :
"let mapleader = "\<Space>"
"let mapleader = " "
"let mapleader = ","
"set nrformats=
filetype plugin indent on
syntax on
nnoremap <silent> <Esc><Esc> :nohlsearch<Enter>
"nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
"tnoremap <C-w><C-n> <C-w>N
"nnoremap <leader>cd :Ex<CR>
"set number
"set relativenumber
set nu rnu
set hlsearch
set incsearch
"set shortmess-=S
set shortmess+=c
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
"set shell=bash
"set cursorline
"set cursorcolumn

"set background=dark
"set termguicolors
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_VS.="\e[2 q" "VS = USUAL mode
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)
"number means followings:
"	0, 1 or none	blinking block cursor
"	2		block cursor
"	3		blinking underline cursor
"	4		underline cursor
"	5		blinking vertical bar cursor
"	6		vertical bar cursor

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

"autocmd FileType qf nnoremap <buffer> p  <CR><C-w>p
autocmd FileType qf nnoremap <buffer> P  <CR>zz<C-w>p
autocmd FileType qf nnoremap <buffer> J j<CR>zz<C-w>p
autocmd FileType qf nnoremap <buffer> K k<CR>zz<C-w>p
"autocmd FileType qf setlocal statusline+=\ %L

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
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'yegappan/lsp'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'vim-fuzzbox/fuzzbox.vim'
"
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'menisadi/kanagawa.vim'
"Plug 'godlygeek/tabular'
"Plug 'preservim/vim-markdown'
"Plug 'mattn/vim-maketable'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'KabbAmine/vZoom.vim', {'on': ['<Plug>(vzoom)', 'VZoomAutoToggle']}
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"################################################################

"#############
"### vZoom ###
"#############
nnoremap <C-w>go :VZoomAutoToggle<cr>

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
"let g:eskk#egg_like_newline = 1
let g:eskk#immediately_dic_rw = 1
"############

"#################
"### lightline ###
"#################
set laststatus=2
let g:lightline = {
      \ 'colorscheme' : 'tokyonight',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

"################
"### kanagawa ###
"################
"set laststatus=2
set termguicolors
colorscheme kanagawa

"###########
"### FZF ###
"###########
"" Files
"nnoremap <leader>ff :Files<CR>
"nnoremap <leader>fo :History<CR>
"nnoremap <leader>fb :Buffers<CR>
"nnoremap <leader>fq :CList<CR>    " For quickfix list
"nnoremap <leader>fh :Helptags<CR>
"" Grep current string
"nnoremap <leader>fs :Rg <C-r><C-w><CR>
"" Grep input string (fzf prompt)
"nnoremap <leader>fg :Rg<Space>
"" Grep for current file name (without extension)
"nnoremap <leader>fc :execute 'Rg ' . expand('%:t:r')<CR>
"" Find files in your Vim config
"nnoremap <leader>fi :Files ~/.vim<CR>

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
"
"set completeopt=menu,menuone,noselect
"
" setting for vim-plug
" set options
"autocmd User LspSetup call LspOptionsSet(#{
"      \ autoHighlightDiags: v:true,
"      \ diagVirtualText: v:true,
"      \ diagSign: v:true,
"      \})
"" reference: https://github.com/yegappan/lsp/pull/332
""      \ completionTextEdit: v:false,
""      \ snippetSupport: v:true,
""      \ ultisnipsSupport: v:false,
""      \ vsnipSupport: v:true,

let lspOpts = #{autoHighlightDiag: v:true}
let lspServers = []
" for C/C++ LSP: apt install clangd
let lspServers = add(lspServers,#{
      \ name: 'clangd',
      \ filetype: ['c', 'cpp'],
      \ path: '/usr/bin/clangd',
      \ args: ['--background-index']
      \})
" for python LSP: apt install python3-pylsp
let lspServers = add(lspServers,#{
      \	  name: 'pylsp',
      \	  filetype: ['python'],
      \	  path: '/usr/bin/pylsp',
      \	  args: []
      \})
" for CSS: npm install --global vscode-css-languageserver-bin
let lspServers = add(lspServers,#{
      \	  name: 'cssls',
      \	  filetype: ['css'],
      \	  path: '/usr/bin/css-languageserver',
      \	  args: ['--stdio']
      \})
" for AWK: npm install -g awk-language-server
let lspServers = add(lspServers,#{
      \	  name: 'awkls',
      \	  filetype: ['awk'],
      \	  path: '/usr/bin/awk-language-server',
      \	  args: []
      \})
" for TypeScript/JavaScript: npm install -g typescript-language-server typescript
let lspServers = add(lspServers,#{
      \	  name: 'tsserver',
      \	  filetype: ['javascript', 'typescript'],
      \	  path: '/usr/bin/typescript-language-server',
      \	  args: ['--stdio']
      \})
" for Vimscript: npm install -g vim-language-server
let lspServers = add(lspServers,#{
      \	  name: 'vimls',
      \	  filetype: ['vim'],
      \	  path: '/usr/bin/vim-language-server',
      \	  args: ['--stdio']
      \})

"autocmd User LspSetup call LspOptionsSet(lspOpts)
"autocmd User LspSetup call LspAddServer(lspServers)
"
"nnoremap <leader>gd <cmd>LspGotoDefinition<CR>
"nnoremap <leader>gr <cmd>LspShowReference<CR>
"nnoremap <leader>K <cmd>LspHover<CR>
""nnoremap K :LspHover<CR>
"nnoremap <leader>gl <cmd>LspDiag current<CR>
"nnoremap <leader>nd <cmd>LspDiag next \| LspDiag current<CR>
"nnoremap <leader>pd <cmd>LspDiag prev \| LspDiag current<CR>
"inoremap <silent> <leader><Space> <C-x><C-o>
"nnoremap <leader>gi <cmd>LspGotoImpl<CR>
"nnoremap <leader>gt <cmd>LspGotoTypeDef<CR>
"nnoremap <leader>rn <cmd>LspRename<CR>
"nnoremap <leader>ca <cmd>LspCodeAction<CR>
"" combine with fzf
"nnoremap <leader>ss :LspSymbolSearch<CR>

"" TAB as completion or indent based on the situation
"inoremap <silent><expr> <Tab>
"      \ pumvisible() ? "\<C-n>" :
"      \ getline('.')[col('.')-1] =~ '\k' ? "\<C-x>\<C-o>" :
"      \ "\<Tab>"
"
"" Shift-TAB does reverse of TAB
"inoremap <silent><expr> <S-Tab>
"      \ pumvisible() ? "\<C-p>" : "\<C-h>"
"
"" Enter as confirmation
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" color of popup menu
"hi Pmenu      ctermbg=236
"hi PmenuSel   ctermbg=240 ctermfg=255
"###########

"#########################
"### vsnip/vsnip-integ ###
"#########################
"" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
"
"inoremap <silent><expr> <Tab>  pumvisible() ? "\<C-n>" : getline('.')[col('.')-1] =~ '\k' ? "\<C-x>\<C-o>" : "\<Tab>"
"inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

function! s:FoldMarkdown()
  let maxfold = 3
  let line = getline(v:lnum)
  for n in range(1, maxfold)
    if line =~ '^#\{' . n . '}[^#]\+'
      return '>' . n
    endif
  endfor
  return '='
endfunction
autocmd FileType markdown setlocal foldmethod=expr foldexpr=<SID>FoldMarkdown()

