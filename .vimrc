execute pathogen#infect()
syntax on
filetype plugin indent on

set autoindent

set encoding=utf-8

"set number

set pastetoggle=<F2>

set ruler
set cursorline
set cursorcolumn

set tabstop=2
set shiftwidth=2 expandtab

" Start Nerdtree automatically
"autocmd vimenter * NERDTree
"autocmd VimEnter * wincmd p

"" Solarized stuff
set background=dark
let g:solarized_termtrans = 1

"" Highlight found search patterns
set hlsearch

"" Press jj to escape of insert mode
inoremap jj <Esc>

"inoremap {<cr> {<cr>}<c-o>O<tab>
"inoremap ({<cr> ({<cr>});<c-o>O<tab>

"inoremap {<cr> {<cr>}<c-o>O
"inoremap { {<CR>}<Esc>ko
"inoremap ({ ({<CR>})<C-o>A;<Esc>ko

"inoremap [<cr> [<cr>]<c-o>O
"inoremap (<cr> (<cr>)<c-o>O


nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <ESC>:w<cr>
nnoremap <tab><tab> :NERDTreeToggle<cr>
inoremap ;; <C-o>A;
inoremap ;;; <C-o>A;<cr>
inoremap ,, <C-o>A,

let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](bower_components|node_modules|tmp|_build|dist|deps)$',
  \ }

""let g:airline_theme='solarized'


""
"" Backup and swap files
""
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

""
"" mustache
""
let g:mustache_abbreviations = 1

""
"" htmlbars
""
""autocmd BufRead,BufNewFile *.js HighlightInlineHbs

""
"" For autocompletion with SuperTab
""
set iskeyword+=-

let g:AutoPairsShortcutFastWrap = '<C-e>'

"Start of vim-plug manager
call plug#begin()
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }
  Plug 'scrooloose/nerdtree'
  Plug 'altercation/vim-colors-solarized'
  Plug 'kien/ctrlp.vim'
  Plug 'scrooloose/syntastic'
  Plug 'alexlafroscia/vim-ember-cli'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'jiangmiao/auto-pairs'
call plug#end()
"End vim-plug manager

"" Must come after vim-plug config 
"" https://github.com/altercation/vim-colors-solarized/issues/190
colorscheme solarized