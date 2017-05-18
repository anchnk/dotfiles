"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug list of plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'goatslacker/mango.vim'
Plug 'dracula/vim'
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
color dracula

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='dracula'
"let g:airline_mode_map = {
"  \ '__' : '-',
"	\ 'n'  : 'N',
"	\ 'i'  : 'I',
"	\ 'R'  : 'R',
"	\ 'c'  : 'C',
"	\ 'v'  : 'V',
"	\ 'V'  : 'V',
"	\ '' : 'V',
"	\ 's'  : 'S',
"	\ 'S'  : 'S',
"	\ '' : 'S',
"	\ }

" nerdtree Settings
map <C-k><C-b> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

" vim-better-whitespace settings
autocmd FileType <javascript, json, jproperties, sh, vim> \
autocmd BufEnter <buffer> EnableStripWhitespaceOnSave

" jshint2 settings
let jshint2_read = 1
let jshint2_save = 1

" vim-javascript settings
set foldmethod=syntax
set foldlevelstart=20
let g:javascript_plugin_jsdoc = 1

" typescript-vim
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
let g:EditorConfig_exec_path = '/usr/bin/editorconfig'

let g:vim_markdown_conceal = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark
set colorcolumn=80 " 80 character column delimiter
set encoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set number
set numberwidth=4
set shiftwidth=2
set tabstop=2
set tabline=2
set title " Show file title in terminal tab
set relativenumber
autocmd FileType markdown set textwidth=80
autocmd FileType gitcommit set textwidth=72

" Colors
set termguicolors

" Highights
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE
\ guifg=DarkOrchid4 guibg=NONE
highlight Search term=bold cterm=bold ctermfg=Red ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Arrow Keys in all modes
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>
