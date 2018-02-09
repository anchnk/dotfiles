""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     ███╗   ██╗   ███████╗    ██████╗    ██╗   ██╗   ██╗   ███╗   ███╗
"     ████╗  ██║   ██╔════╝   ██╔═══██╗   ██║   ██║   ██║   ████╗ ████║
"     ██╔██╗ ██║   █████╗     ██║   ██║   ██║   ██║   ██║   ██╔████╔██║
"     ██║╚██╗██║   ██╔══╝     ██║   ██║   ╚██╗ ██╔╝   ██║   ██║╚██╔╝██║
"     ██║ ╚████║   ███████╗   ╚██████╔╝    ╚████╔╝    ██║   ██║ ╚═╝ ██║
"     ╚═╝  ╚═══╝   ╚══════╝    ╚═════╝      ╚═══╝     ╚═╝   ╚═╝     ╚═╝
"
"     File: neovim/.config/nvim/init.vim
"     Author: anchnk <anachronikgmail{dot}com>
"     Date: 27.11.2017
"     Last Modified Date: 27.11.2017
"     Last Modified By: anchnk <anachronikgmail{dot}com>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins {{{
  call plug#begin('~/.local/share/nvim/plugged')

  " Generic Utilities {{{
    Plug 'bkzl/vim-arrows'
    Plug 'rhysd/vim-grammarous'
  " }}}

  " Generic Coding Utilities {{{
    Plug 'editorconfig/editorconfig-vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'alpertuna/vim-header'
  " }}}

  " File Navigation {{{
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
  " }}}

  " Statusline {{{
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
  " }}}

  " Colorschemes {{{
    Plug 'dracula/vim'
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'trevordmiller/nova-vim'
  " }}}

  " Syntax highlight {{{
    Plug 'potatoesmaster/i3-vim-syntax'
    Plug 'plasticboy/vim-markdown'
  " }}}

  " Linters {{{
    Plug 'w0rp/ale'
    Plug 'eslint/eslint'
  " }}}

  " JavaScript {{{
    Plug 'pangloss/vim-javascript'
    Plug 'moll/vim-node'
    Plug 'leafgarland/typescript-vim'
    Plug 'elzr/vim-json'
  " }}}

  " Source Versioning {{{
    Plug 'tpope/vim-fugitive'
  " }}}

  " Tmux integration {{{
    Plug 'tmux-plugins/vim-tmux'
    Plug 'benmills/vimux'
  " }}}


  call plug#end()
" }}}

" Plugin Settings {{{
  " airline {{{
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_theme='dracula'
  " }}}

  " vim-header {{{
    let g:header_auto_add_header = 0
    let g:header_field_author = 'anchnk'
    let g:header_field_author_email = 'anachronikgmail{dot}com'
    let g:header_max_size = 17
    let g:header_alignment = 0
  " }}}

  " vim-better-whitespace {{{
    autocmd FileType <javascript, json, jproperties, sh, vim> \
    autocmd BufEnter <buffer> EnableStripWhitespaceOnSave
  " }}}

  " fzf {{{
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
    " }}}

  " nerdcommenter {{{
    let g:NERDSpaceDelims = 1
  " }}}

  " vim-javascript {{{
    set foldmethod=syntax
    set foldlevel=20
    let g:javascript_plugin_jsdoc = 1
  " }}}

  " vim-node {{{
    " Vertical split file under cursor
    autocmd User Node
      \ if &filetype == "javascript" |
      \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
      \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
      \ endif
  " }}}

  " typescript-vim {{{
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
  " }}}

  " editorconfig-vim {{{
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
    let g:EditorConfig_exec_path = '/usr/bin/editorconfig'
  " }}}

  " vim-markdown {{{
    let g:vim_markdown_conceal = 0
  " }}}
" }}}

" Neovim Providers {{{
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Options - Behaviour {{{
  let mapleader = ','
  set cursorline
  set encoding=utf-8
  if has("nvim")
    set inccommand=nosplit
  endif
  set number          " Show line numbers
  set relativenumber  " Show relative line numbers
" }}}

" Options - Appearance {{{

  " True Color Support {{{
    if has('nvim') || has('termguicolors')
      set termguicolors
    endif
  " }}}

  syntax enable
  set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
  set title           " Show file title in terminal tab
  set colorcolumn=80  " 80 character column delimiter

  " Colorscheme {{{
    set background=dark
    colorscheme dracula
  " }}}

  " Highlights {{{
    hi Normal guibg=NONE
    hi LineNr guibg=NONE
    hi Folded guibg=NONE
    " hi Normal guibg=#1C1E26
    " hi LineNr guibg=#1C1E26
    " hi StatusLine guibg=#1C1E26
    " hi ExtraWhitespace guibg=#ff5555
    " hi CursorLineNr term=bold ctermbg=NONE guibg=#1c1e26 cterm=bold gui=bold
  " }}}
" }}}

" Options Indents and Tabs {{{
  set expandtab       " Replace tabs with spaces in Insert mode.
  set tabstop=2       " Spaces that a <Tab> in file counts for.
  set shiftwidth=2    " Spaces for each (auto)indent.

  " Ident and tab options for specific file types.
  autocmd FileType markdown set textwidth=80
  autocmd FileType gitcommit set textwidth=72
" }}}

" Mappings - General {{{
  " Disable arrows keys in normal mode {{{
    nnoremap <Up>    ""
    nnoremap <Down>  ""
    nnoremap <Left>  ""
    nnoremap <Right> ""
  " }}}

  " File navigation {{{
    " fzf {{{
      nmap <leader>f :call fzf#run(
            \fzf#wrap({
            \'source': 'git ls-files --exclude-standard --others --cached'
            \}))<cr>
      nmap <leader>F :call fzf#run(
            \fzf#wrap({
            \'source': 'git ls-files --exclude-standard --others --cached'
            \}, 1))<cr>
    " }}}

    " buffers {{{
      nnoremap <C-j> :bprevious<CR>
      nnoremap <C-k> :bnext<CR>
    " }}}
  " }}}

  " Buffer actions {{{
    nnoremap <C-s> :w!<CR>
    nnoremap <C-q> :wq!<CR>
    noremap  <C-c> :bd!<CR>
    nnoremap <C-L> :noh<CR>
  " }}}

  nmap <leader>t :call VimuxRunCommand("./node_modules/.bin/mocha " .
      \ expand('%'))<CR>

  map <leader>y "*y
  map <leader>P "*p
" }}}

au VimLeave * set guicursor=a:hor80-blinkon2

" vim: foldmethod=marker:foldlevel=0
