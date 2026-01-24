" vim: set ts=2 sw=2 sts=2 et ft=vim:
"
"let mapleader = " "
"let mapleader = ","
"set nrformats=
filetype plugin indent on
syntax on
nnoremap <silent> <Esc><Esc> :nohlsearch<Enter>
tnoremap <silent> <Esc> <C-w>N
set hlsearch
set incsearch
"set clipboard+=unnamedplus
set modeline
"set wildmenu
"set showcmd
"set wildmode=full
"set termguicolors
"set notermguicolors
"set background=dark
"colorscheme default
set shell=bash
set laststatus=2

"let &t_SH = "\e[2 q" "SH: cursor shape?
"let &t_EI = "\e[2 q" "EI: normal mode
let &t_SH = "\e[1 q" "SH: cursor shape?
let &t_EI = "\e[1 q" "EI: normal mode
let &t_SI = "\e[5 q" "SI: insert mode
let &t_SR = "\e[3 q" "SR: replace mode
let &t_VS = "\e[1 q" "VS: visual mode
"let &t_ti = "\e[1 q" "EI: normal mode
"let &t_te = "\e[0 q" "EI: normal mode
"	definition
"	0, 1 or none	blinking block cursor
"	2		block cursor
"	3		blinking underline cursor
"	4		underline cursor
"	5		blinking vertical bar cursor
"	6		vertical bar cursor


function! SimpleModeCommand(width, is_expand)
  "set ts=n sw=n sts=n et (or noet)
  let indent_width = a:width != 0 ? a:width : 8
  let command_str = "set"
  let command_str .= " ts=" . indent_width
  let command_str .= " sw=" . indent_width
  let command_str .= " sts=" . indent_width
  let command_str .= eval(a:is_expand) ? " et" : " noet"
  return command_str
endfunction

function! SimpleModelineString(width, is_expand)
  "?? vim: set ts=n sw=n sts=n et: (or noet:)
  let modeline_str = "vim: "
  let modeline_str .= SimpleModeCommand(a:width, a:is_expand)
  let modeline_str .= ":"
  let modeline_str = printf(&commentstring, modeline_str)
  return modeline_str
endfunction

command T0   execute(SimpleModeCommand(8, v:false))
command T2   execute(SimpleModeCommand(2, v:true))
command T4   execute(SimpleModeCommand(4, v:true))
command T8   execute(SimpleModeCommand(8, v:true))
command TT2  execute(SimpleModeCommand(2, v:false))
command TT4  execute(SimpleModeCommand(4, v:false))
command TT8  execute(SimpleModeCommand(8, v:false))
command T2i  call append(eval(line('.')-1), SimpleModelineString(2, v:true))
command T4i  call append(eval(line('.')-1), SimpleModelineString(4, v:true))
command T8i  call append(eval(line('.')-1), SimpleModelineString(8, v:true))
command TT2i call append(eval(line('.')-1), SimpleModelineString(2, v:false))
command TT4i call append(eval(line('.')-1), SimpleModelineString(4, v:false))
command TT8i call append(eval(line('.')-1), SimpleModelineString(8, v:false))

"autocmd FileType qf nnoremap <buffer> p  <CR><C-w>p
autocmd FileType qf nnoremap <buffer> P  <CR>zz<C-w>p
autocmd FileType qf nnoremap <buffer> J j<CR>zz<C-w>p
autocmd FileType qf nnoremap <buffer> K k<CR>zz<C-w>p
"autocmd FileType qf setlocal statusline+=\ %L

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Declare the list of plugins.

" SKK
"Plug 'vim-skk/eskk.vim'
Plug 'vim-skk/skk.vim'
""" skkeleton is in denops part

" Tim Pope
"Plug 'tpope/vim-commentary'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'

" Copilot
"Plug 'github/copilot.vim'

" Junegunn
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'

" LSP
Plug 'yegappan/lsp'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'

" Christian Brabandt
"Plug 'chrisbra/vim_faq'
Plug 'chrisbra/csv.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

" Lamdalisue-san/Denops
"Plug 'lambdalisue/vim-fern'
Plug 'vim-denops/denops.vim'
Plug 'lambdalisue/vim-gin'
Plug 'vim-denops/denops-helloworld.vim'
"Plug 'rhysd/vim-healthcheck'
"Plug 'vim-skk/skkeleton'

" Others
"Plug 'ryanoasis/vim-devicons'
"Plug 'vim/colorschemes'
Plug 'ghifarit53/tokyonight-vim'
Plug 'itchyny/lightline.vim'
Plug 'menisadi/kanagawa.vim'
"Plug 'EdenEast/nightfox.nvimk'
"Plug 'godlygeek/tabular'
"Plug 'preservim/vim-markdown'
"Plug 'mattn/vim-maketable'
"Plug 'dhruvasagar/vim-table-mode'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"###########
"### skk ###
"###########
if !filereadable(expand('~/.skk/SKK-JISYO.L'))
  call mkdir(expand('~/.skk'), 'p')
  call system('cd ~/.skk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz')
endif
let g:skk_jisyo = "~/.skk/my_jisyo"
let g:skk_large_jisyo = "~/.skk/SKK-JISYO.L"
"let g:skk_large_jisyo_encoding = "euc-jp"
"let g:skk_auto_save_jisyo = 1
let g:skk_auto_save_jisyo = -1
let g:skk_sticky_key = ';'
"let g:skk_egg_like_newline = 1
"let g:skk_ascii_mode_string = 'SKK:aA'
"let g:skk_hira_mode_string = 'SKK:あ'
"let g:skk_kata_mode_string = 'SKK:ア'
"let g:skk_zenei_mode_string = 'SKK:Ａ'
"let g:skk_abbrev_mode_string = 'SKK:aあ'
let g:skk_ascii_mode_string = 'aA'
let g:skk_hira_mode_string = 'あ'
let g:skk_kata_mode_string = 'ア'
let g:skk_zenei_mode_string = 'Ａ'
let g:skk_abbrev_mode_string = 'aあ'
"TODO: terminal modeでのskkへの対応

"############
"### eskk ###
"############
"if !filereadable(expand('~/.skk/SKK-JISYO.L'))
"  call mkdir('~/.skk', 'p')
"  call system('cd ~/.skk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz')
"endif
"let g:eskk#directory = "~/.skk"
"let g:eskk#dictionary = { 'path': "~/.skk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
"let g:eskk#large_dictionary = {'path': "~/.skk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
""let g:eskk#egg_like_newline = 1
"let g:eskk#immediately_dic_rw = 1
"############

"#################
"### skkeleton ###
"#################
"function! s:skkeleton_init() abort
"  if !filereadable(expand('~/.skk/SKK-JISYO.L'))
"    call mkdir('~/.skk', 'p')
"    call system('cd ~/.skk/ && wget http://openlab.jp/skk/dic/SKK-JISYO.L.gz && gzip -d SKK-JISYO.L.gz')
"  endif
"  call skkeleton#config({
"        \ 'eggLikeNewline': v:true,
"        \ 'globalDictionaries': ['~/.skk/SKK-JISYO.L'],
"        \ 'userDictionary': '~/.skk/my_jisyo'
"        \ })
"  call skkeleton#register_kanatable('rom', {
"        \ "z\<Space>": ["\u3000", ''],
"        \ })
"endfunction
"augroup skkeleton-initialize-pre
"  autocmd!
"  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
"  inoremap <C-j> <Plug>(skkeleton-toggle)
"  cnoremap <C-j> <Plug>(skkeleton-toggle)
"  tnoremap <C-j> <Plug>(skkeleton-toggle)
"augroup END


"#################
"### lightline ###
"#################
""set laststatus=2
""let g:lightline = {'colorscheme' : 'tokyonight'}
""      \ 'colorscheme' : 'tokyonight',
""      \ 'colorscheme' : 'kanagawa',
let g:lightline = {
      \ 'colorscheme' : 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'skkmode' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'skkmode': 'SkkGetModeStrAdjusted',
      \   'gitbranch': 'FugitiveHeadAdjusted',
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction
function! SkkGetModeStrAdjusted()
  let s = exists('*SkkGetModeStr') ? SkkGetModeStr() : ' '
  return s == ' ' ? '' : s
endfunction
function! FugitiveHeadAdjusted()
  let s = exists('*FugitiveHead') ? FugitiveHead() : ''
  return s == '' ? '' : '⎇ ' . s
endfunction
function! FugitiveHeadAdjusted2()
  let s = FugitiveHeadAdjusted()
  return s == '' ? '' : '[' . s . ']'
endfunction


"###################################
"### custom statusline by myself ###
"###################################
" default status line?
"set statusline=%<%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P

"set statusline=%<%f\ %{%FugitiveHeadAdjusted2()%}%h%w%m%r%=%-14.(%l/%L,%c%V%)\ %P
"set statusline=%<%f\ %{%SkkGetModeStrAdjusted()%}%{%FugitiveHeadAdjusted2()%}%h%w%m%r%=%-14.(%l/%L,%c%V%)\ %P
" '-14.(' means as follows:
"   '-'   : left justify
"   '14.' : minimum width = 14, and maximum width is not specified
"   '('   : start of the item group, and must be followed by '%)' somewhere

"###############
"### airline ###
"###############
"let g:airline_theme = "tokyonight"
"let g:airline_theme = "deus"

"###########
"### csv ###
"###########
" do not allow to convert "," to "|" on the screen
let g:csv_no_conceal = 1

"################
"### kanagawa ###
"################
"-----------------------------------------------------------------------
" [terminal color]
function! SetTerminalAnsiColors()
  if !exists('g:terminal_ansi_colors_defined')
    " default definition
    "let g:terminal_ansi_colors = [
    "      \ 'black',         'red',             'green',         'yellow',
    "      \ 'blue',          'magenta',         'cyan',          'white',
    "      \ 'black(bright)', 'red(bright)',     'green(bright)', 'yellow(bright)',
    "      \ 'blue(bright)',  'magenta(bright)', 'cyan(bright)',  'white(bright)' ]

    " kanagawa(wave) scheme
    let g:terminal_ansi_colors = [
          \ "#090618", "#C34043", "#76946A", "#C0A36E",
          \ "#7E9CD8", "#957FB8", "#6A9589", "#C8C093",
          \ "#727169", "#E82424", "#98BB6C", "#E6C384",
          \ "#7FB4CA", "#938AA9", "#7AA89F", "#DCD7BA" ]

    " terminal sexy
    "let g:terminal_ansi_colors = [
    "      \ '#282a2e', '#a54242', '#8c9440', '#de935f',
    "      \ '#5f819d', '#85678f', '#5e8d87', '#707880',
    "      \ '#373b41', '#cc6666', '#b5bd68', '#f0c674',
    "      \ '#81a2be', '#b294bb', '#8abeb7', '#c5c8c6' ]
    let g:terminal_ansi_colors_defined = 1
  endif
endfunction
"-----------------------------------------------------------------------
"let g:custom_colorscheme_not_available = 1 
function CustomColorscheme()
  if !exists('g:custom_colorscheme_not_available')
    try 
      colorscheme kanagawa
      highlight StatusLine   gui=NONE term=NONE cterm=NONE guibg=#c8c093 guifg=#16161d ctermbg=NONE ctermfg=NONE
      highlight StatusLineNC gui=NONE term=NONE cterm=NONE guibg=#54546d guifg=#16161d ctermbg=NONE ctermfg=NONE
      "highlight! link StatusLineTerm StatusLine
      highlight! link StatusLineTermNC StatusLineNC
      highlight StatusLineTerm   gui=NONE term=NONE cterm=NONE guibg=#7fb4ca guifg=#16161d ctermbg=NONE ctermfg=NONE
      "highlight StatusLineTermNC gui=NONE term=NONE cterm=NONE guibg=#54546d guifg=#16161d ctermbg=NONE ctermfg=NONE
      "highlight! Visual guibg=gray80 guifg=gray20
      highlight! Visual guibg=#30435F
      "highlight! LineNr guifg=#c5c8c6
      highlight! LineNr guifg=#707880
      "set cursorline
      "highlight clear CursorLine
      call SetTerminalAnsiColors()
    catch /^Vim\%((\a\+)\)\=:E185/
      let g:custom_colorscheme_not_available = 1 
    endtry
  else
    colorscheme default
    set background=dark
    set termguicolors
    highlight Pmenu guibg=DarkMagenta
    "set notermguicolors
  endif
endfunction
call CustomColorscheme()

"############
"### Goyo ###
"############
function! s:goyo_enter()
  set nu rnu
endfunction

function! s:goyo_leave()
  call CustomColorscheme()
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width = '95%'
let g:goyo_height = '95%'
"let g:goyo_linenr = 1

nnoremap <C-w>go :Goyo<CR>

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

"let lspOpts = #{autoHighlightDiag: v:true}
let lspOpts = #{
      \ autoHighlightDiag: v:true,
      \ popupBorder: v:true,
      \}
"      \ popupBorderCodeAction: v:true,
"      \ popupBorderCompletion: v:true,
"      \ popupBorderDiag: v:true,
"      \ popupBorderHover: v:true,
"      \ popupBorderPeek: v:true,
"      \ popupBorderSignatureHelp: v:true,
"      \ popupBorderSymbolMenu: v:true,
"      \ popupBorderSymbolMenuInput: v:true,
"      \ popupBorderTypeHierarchy: v:true,
"      \}
"let lspOpts2 = #{
"      \ closePreviewOnComplete: v:true,
"      \ hoverInPreview: v:false,
"      \ completionInPreview: v:false
"      \}
let lspServers = []
" for C/C++ LSP: apt install clangd
let lspServers = add(lspServers,#{
      \ name: 'clangd',
      \ filetype: ['c', 'cpp'],
      \ path: 'clangd',
      \ args: ['--background-index']
      \})
" for python LSP: apt install python3-pylsp
if executable('pylsp')
  let lspServers = add(lspServers,#{
        \	  name: 'pylsp',
        \	  filetype: ['python'],
        \	  path: 'pylsp',
        \	  args: []
        \})
endif
" for CSS: npm install --global vscode-css-languageserver-bin
let lspServers = add(lspServers,#{
      \	  name: 'cssls',
      \	  filetype: ['css'],
      \	  path: 'css-languageserver',
      \	  args: ['--stdio']
      \})
" for AWK: npm install -g awk-language-server
let lspServers = add(lspServers,#{
      \	  name: 'awkls',
      \	  filetype: ['awk'],
      \	  path: 'awk-language-server',
      \	  args: []
      \})
" for TypeScript/JavaScript: npm install -g typescript-language-server typescript
let lspServers = add(lspServers,#{
      \	  name: 'tsserver',
      \	  filetype: ['javascript', 'typescript'],
      \	  path: 'typescript-language-server',
      \	  args: ['--stdio']
      \})
" for TypeScript/JavaScript: deno version
"let lspServers = add(lspServers,#{
"      \	  name: 'deno',
"      \	  filetype: ['javascript', 'typescript' ],
"      \	  path: 'deno',
"      \	  args: ['lsp'],
"      \   debug: v:true,
"      \   rootSearch: ['deno.json', 'deno.jsonc'],
"      \   initializationOptions: #{
"      \       enable: v:true,
"      \       lint: v:true,
"      \       unstable: v:false
"      \   }
"      \})
" for Vimscript: npm install -g vim-language-server
let lspServers = add(lspServers,#{
      \	  name: 'vimls',
      \	  filetype: ['vim'],
      \	  path: 'vim-language-server',
      \	  args: ['--stdio']
      \})

autocmd User LspSetup call LspOptionsSet(lspOpts)
autocmd User LspSetup call LspAddServer(lspServers)

"-----------------------------------------------------------
"nnoremap          <leader>K       <cmd>LspHover<cr>
nnoremap          gK              <cmd>LspHover<cr>
"nnoremap          <leader><C-]>   <cmd>LspGotoDefinition<cr>
nnoremap          g<C-]>          <cmd>LspGotoDefinition<cr>
"nnoremap          <leader>g]      <cmd>LspPeekDefinition<cr>
"nnoremap          <leader>gq      <plug>(LspFormat)
"xnoremap          <leader>gq      <plug>(LspFormat)
"nnoremap <buffer> <leader>gd      <cmd>LspGotoDefinition<cr>
"nnoremap <buffer> <leader><C-w>gd <cmd>topleft LspGotoDefinition<cr>
"nnoremap <buffer> <leader>gd      <cmd>execute v:count .. 'LspGotoDefinition'<cr>
"nnoremap <buffer> <leader><C-w>gd <cmd>execute 'topleft' .. v:count .. 'LspGotoDefinition'<cr>
"nnoremap <buffer> <leader>gi      <cmd>LspGotoImpl<cr>
"nnoremap <buffer> <leader>gt      <cmd>LspGotoTypeDef<cr>

"xnoremap <silent> <leader>e       <Cmd>LspSelectionExpand<cr>
"xnoremap <silent> <leader>s       <Cmd>LspSelectionShrink<cr>

"inoremap <C-space> <C-\><C-o>:call lsp#completion#LspComplete(v:true)<cr>

"nnoremap          <leader>gl      <cmd>LspDiag current<cr>
nnoremap          gl              <cmd>LspDiag current<cr>
"nnoremap          <leader>nd      <cmd>LspDiag next \| LspDiag current<cr>
"nnoremap          <leader>pd      <cmd>LspDiag prev \| LspDiag current<cr>

"nnoremap          <leader>rn      <cmd>LspRename<CR>
"nnoremap          <leader>ca      <cmd>LspCodeAction<CR>
"" combine with fzf
"nnoremap          <leader>ss      <cmd>LspSymbolSearch<CR>
"-----------------------------------------------------------

" TAB as completion or indent based on the situation
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ getline('.')[col('.')-1] =~ '\k' ? "\<C-x>\<C-o>" :
      \ "\<Tab>"

" Shift-TAB does reverse of TAB
inoremap <silent><expr> <S-Tab>
      \ pumvisible() ? "\<C-p>" : "\<C-h>"

" Enter as confirmation
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Markdown folding
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

