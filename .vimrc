syntax on
filetype plugin indent on

set autoindent
set encoding=utf-8
set nofixendofline

set clipboard=unnamed " Use the default OS Clipboard
set pastetoggle=<F2>

set ruler
set cursorline
set cursorcolumn
set relativenumber " Show in column relative number of line
set number " Show current line number

set tabstop=2
set shiftwidth=2 expandtab


"" Colors
set termguicolors

"" Highlight found search patterns
"set hlsearch

" Press jj to escape of insert mode
inoremap jj <Esc>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" ss to generate new horizontal split
nnoremap <silent> ss <C-w>s

" split sanity
set splitbelow
set splitright

"fzf Ag
nnoremap <C-g>g :Ag<CR>

"fzf Find 
nnoremap <C-p> :Files<CR>

" on osx the <leader> key is \
nnoremap <leader><leader> :w<cr>
inoremap <leader><leader> <ESC>:w<cr>
nnoremap <tab><tab> :NERDTreeToggle<cr>
nnoremap <tab>m :NERDTreeFind<cr>
inoremap ;; <C-o>A;
inoremap ;;; <C-o>A;<cr>
inoremap ,, <C-o>A,

"ref: https://stackoverflow.com/questions/21888869/how-to-make-ctrlps-search-directory-change-according-to-nerdtrees-root
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

nnoremap <Leader>= :vertical resize +15<cr>
nnoremap <Leader>- :vertical resize -15<cr>

set backspace=indent,eol,start


let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](bower_components|node_modules|mirage|tmp|_build|dist|deps)$',
  \ }

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


let g:AutoPairsShortcutFastWrap = '<C-e>'

let g:mustache_abbreviations = 1

let g:vim_javascript_imports_map = '<Leader>e'


" ----------------------------------------------------------------------------
" vim-airline
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme='atomic'

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------
nnoremap <Leader>ln :ALENextWrap<CR>
nnoremap <Leader>lp :ALEPreviousWrap<CR>
nnoremap <leader>p :ALEFix<CR>

autocmd FileType html.handlebars let g:ale_javascript_prettier_options = '--parser=glimmer'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': ['prettier'],
\   'html.handlebars': ['prettier'],
\   'markdown': ['prettier'],
\}
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': [''],
\   'html.handlebars': ['ember-template-lint'],
\}

let g:ale_sign_error = '🍄'
let g:ale_sign_warning = '🙀'
let g:fugitive_gitlab_domains = ['https://gitlab.qonto.co']


"Start of vim-plug manager
call plug#begin()
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  " Plug 'vim-airline/vim-airline'
  Plug 'pangloss/vim-javascript'
  Plug 'alexlafroscia/vim-ember-cli'
  Plug 'vim-scripts/matchit.zip'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-lang/vim-elixir'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-css-color'
  Plug 'hail2u/vim-css3-syntax'
  Plug 'heartsentwined/vim-emblem'
  Plug 'tpope/vim-fugitive'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  Plug 'sukima/vim-javascript-imports'
  Plug 'terryma/vim-multiple-cursors'
  " Plug 'altercation/vim-colors-solarized'
  " Plug 'vim-airline/vim-airline-themes'
  Plug 'dracula/vim'
  Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()
"End vim-plug manager

"" Must come after vim-plug config 
"" https://github.com/altercation/vim-colors-solarized/issues/190
" colorscheme solarized
colorscheme dracula 
