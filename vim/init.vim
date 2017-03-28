"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug list of plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'shutnik/jshint2.vim'
Plug 'moll/vim-node'
Plug 'goatslacker/mango.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
color mango

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ }

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
set colorcolumn=80 " 80 character column delimiter
set encoding=utf-8
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
set listchars=eol:$,tab:>-,trail:.,extends:>,precedes:<,nbsp:_
set number
set numberwidth=2
set shiftwidth=2

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