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
"     Last Modified Date: 05.03.2019
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
    Plug 'autozimu/LanguageClient-neovim', {
         \ 'branch': 'next',
         \ 'do': 'bash install.sh',
         \ }
    Plug 'Shougo/denite.nvim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'junegunn/goyo.vim'
    Plug 'scrooloose/nerdcommenter'
    Plug 'godlygeek/tabular'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'alpertuna/vim-header'
    Plug 'tpope/vim-projectionist'
    Plug 'janko-m/vim-test'
  " }}}

  " File Navigation {{{
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
    Plug 'Quramy/vison'
    Plug 'rstacruz/vim-node-import'
    Plug 'retorillo/istanbul.vim'
    Plug 'neoclide/npm.nvim'
  " }}}

  " Rust {{{
    Plug 'rust-lang/rust.vim'
    Plug 'racer-rust/vim-racer'
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
  " ale {{{
    let g:ale_javascript_prettier_use_local_config = 1
    let g:ale_fixers = {
    \  'javascript': ['prettier', 'eslint'],
    \}
  " }}}

  " airline {{{
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#ale#enabled = 1
    let g:airline#extensions#branch#enabled = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline_theme='dracula'
  " }}}

  " deoplete {{{
    let g:deoplete#enable_at_startup  = 1
  " }}}

  " LanguageClient-neovim {{{
    set hidden

    let g:LanguageClient_serverCommands = {
        \ 'rust': ['rustup', 'run', 'stable', 'rls'],
        \ 'javascript': ['javascript-typescript-stdio']
        \ }
  " }}}

  " vim-header {{{
    let g:header_auto_add_header = 0
    let g:header_field_author = 'anchnk'
    let g:header_field_author_email = 'anachronikgmail{dot}com'
    let g:header_max_size = 14
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

    " use ripgrep
    command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
  " }}}

  " nerdcommenter {{{
    let g:NERDSpaceDelims = 1
    let g:NERDDefaultAlign = 'left'
  " }}}

  " rust {{{
    let g:rustfmt_autosave = 1
  " }}}

  " vim-javascript {{{
    set conceallevel=1
    let g:javascript_plugin_jsdoc = 1

    augroup javascript_folding
      au!
      au FileType javascript setlocal foldmethod=syntax
    augroup END
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

  " vimux {{{
    let g:VimuxOrientation = "h"
  " }}}

  " vim-test {{{
    let test#strategy = "vimux"
  " }}}
" }}}

" Neovim Providers {{{
  let g:python_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/bin/python3'
" }}}

" Options - Behaviour {{{
  let mapleader = ','
  " set cursorline
  set encoding=utf-8
  if has("nvim")
    set inccommand=nosplit
  endif
  set number          " Show line numbers
  set relativenumber  " Show relative line numbers

  " Templates {{{
    if has("autocmd")
      augroup templates
        autocmd BufNewFile *.js 0r ~/.vim-templates/skeleton.js
      augroup END
    endif
  " }}}
" }}}

" Options - Appearance {{{

  " True Color Support {{{
    if has('nvim') || has('termguicolors')
      set termguicolors
    endif
  " }}}

  " Set symbols
  set listchars=space:.,eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
  " Show file title in terminal tab
  set title
  " 80 Character column delimiter
  set colorcolumn=80
  " reset cursor shape after exit
  au VimLeave * set guicursor=a:hor80-blinkon2

  " Colorscheme {{{
    set background=dark
    colorscheme dracula
  " }}}

  " Highlights {{{
    hi Normal guibg=NONE
    hi Folded guibg=NONE
    hi ExtraWhitespace guibg=#ff5555
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
    " ale {{{
      nmap <silent> <leader>k <Plug>(ale_previous_wrap)
      nmap <silent> <leader>j <Plug>(ale_next_wrap)
    " }}}

    " nerdtree {{{
    nmap <C-k><C-b> :NERDTreeToggle<CR>
    " }}}

    " fzf {{{
      nmap <leader>f :call fzf#run(
            \fzf#wrap({
            \'source': 'git ls-files --exclude-standard --others --cached'
            \}))<cr>

      nmap <leader>F :call fzf#run(
            \fzf#wrap({
            \'source': 'git ls-files --exclude-standard --others --cached'
            \}, 1))<cr>

      nmap <leader>r :Rg <C-R>"<CR>
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

  " Saved Macros {{{
    function! FormatCloudWatchLogs()
      normal 0v$:s/] /]\r/gggvG:sort
    endfunction
  " }}}

  map <leader>a :ALEFix<CR>
  map <leader>A :A<CR>
  map <leader>I :IstanbulToggle<CR>
  map <leader>y "*y
  map <leader>P "*p

  " let g:clipboard = {
        " \   'name': 'xclip-custom',
        " \   'copy': {
        " \      '+': 'xclip -quiet -i -selection clipboard',
        " \      '*': 'xclip -quiet -i -selection primary',
        " \    },
        " \   'paste': {
        " \      '+': 'xclip -o -selection clipboard',
        " \      '*': 'xclip -o -selection primary',
        " \   },
        " \ }
" }}}

" vim: foldmethod=marker:foldlevel=0
