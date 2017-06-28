"-------------------------------------------------------------------------------
" Plugins Install
"-------------------------------------------------------------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'goatslacker/mango.vim'
Plug 'dracula/vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'shutnik/jshint2.vim'
Plug 'moll/vim-node'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rhysd/vim-grammarous'
Plug 'potatoesmaster/i3-vim-syntax'
call plug#end()

"-------------------------------------------------------------------------------
" Plugin Settings - airline
"-------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dracula'

"-------------------------------------------------------------------------------
" Plugin Settings - nerdtree
"-------------------------------------------------------------------------------
map <C-k><C-b> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

"-------------------------------------------------------------------------------
" Plugin Settings - vim-better-whitespace
"-------------------------------------------------------------------------------
autocmd FileType <javascript, json, jproperties, sh, vim> \
autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

"-------------------------------------------------------------------------------
" Plugin Settings - jshint2
"-------------------------------------------------------------------------------
" jshint2 settings
let jshint2_read = 1
let jshint2_save = 1

"-------------------------------------------------------------------------------
" Plugin Settings - vim-javascript
"-------------------------------------------------------------------------------
set foldmethod=syntax
set foldlevel=20
let g:javascript_plugin_jsdoc = 1

"-------------------------------------------------------------------------------
" Plugin Settings - typescript-vim
"-------------------------------------------------------------------------------
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"-------------------------------------------------------------------------------
" Plugin Settings - editorconfig-vim
"-------------------------------------------------------------------------------
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

"-------------------------------------------------------------------------------
" Plugin Settings - vim-markdown
"-------------------------------------------------------------------------------
let g:vim_markdown_conceal = 0

"-------------------------------------------------------------------------------
" Options - Behaviour
"-------------------------------------------------------------------------------
" Highights
"highlight Search term=bold cterm=bold ctermfg=Red ctermbg=NONE
"highlight NonText ctermfg=5
"hi Normal guibg=NONE ctermbg=NONE

"-------------------------------------------------------------------------------
" Options - Appearance
"-------------------------------------------------------------------------------
if !exists("$COLORTERM") && $TERM ==# 'xterm-256color' || $TERM ==# 'screen'
  set termguicolors
endif
set background=dark
colorscheme dracula
hi CursorLineNr term=bold ctermbg=NONE guibg=NONE cterm=bold gui=bold
set guifont=SauceCodePro\ NF\ 11
hi Normal guibg=#1D1E26
set number          " Show line numbers
set numberwidth=6   " Number of columns to use for line number
set colorcolumn=80  " 80 character column delimiter
set relativenumber  " Show relative line numbers

set encoding=utf-8
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_,space:.
set title           " Show file title in terminal tab

"-------------------------------------------------------------------------------
" Options - Idents and Tabs
"-------------------------------------------------------------------------------
set expandtab       " Replace tabs with spaces in Insert mode.
set tabstop=2       " Spaces that a <Tab> in file counts for.
set shiftwidth=2    " Spaces for each (auto)indent.

" Ident and tab options for specific file types.
autocmd FileType markdown set textwidth=80
autocmd FileType gitcommit set textwidth=72

"-------------------------------------------------------------------------------
" Mappings - General
"-------------------------------------------------------------------------------
" Disable Arrow Keys in all modes
noremap  <Up> ""
"noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

let mapleader = ','
noremap <Leader>l :! hxvw <cword><cr><cr>
nnoremap <C-L> :noh<cr>
nnoremap <C-s> :w!<cr>
nnoremap <C-q> :wq!<cr>
