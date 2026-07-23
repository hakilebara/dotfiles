" Getting started
"
" ```
" # install vim-plug https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" mkdir ~/.vim/{_temp,_backup}
" # install flake8 a python styleguide linter
" brew install flake8
" brew install black
" brew install isort
" ```
syntax on
filetype plugin indent on

autocmd BufNewFile * startinsert " open new file in insert mode

set autoindent
set smartindent
set encoding=utf-8
set nofixendofline

set clipboard=unnamed " Use the default OS Clipboard
" set pastetoggle=<F2>

set ruler
set cursorline
set cursorcolumn
set relativenumber " Show in column relative number of line
set number " Show current line number

set colorcolumn=88

set tabstop=2
set shiftwidth=2 expandtab

" allow mouse to resize window panes
set mouse=a

" open link under cursor with ':gx'
let g:netrw_browsex_viewer= "open"

" Delete word backward in insert mode with Option+Backspace
" imap <M-BS> <C-W>
imap  <C-W>

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
nnoremap <C-g>g :Ag!<CR>
" to have Ag ignore specific files run this command in your project folder
" echo package-lock.json > .ignore

"fzf Find
" install bat to enable file preview
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

nnoremap <Leader>= :vertical resize +15<cr>
nnoremap <Leader>- :vertical resize -15<cr>

set backspace=indent,eol,start

""
"" Backup and swap files
""
set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

let g:AutoPairsShortcutFastWrap = '<C-e>'

let g:mustache_abbreviations = 1

let g:vim_javascript_imports_map = '<Leader>e'

" ----------------------------------------------------------------------------
" Vim terminal
" ----------------------------------------------------------------------------

" vim-powered terminal in split window
map <Leader>t :term ++close<cr>
tmap <Leader>t <c-w>:term ++close<cr>

" vim-powered terminal in new tab
map <Leader>T :tab term ++close<cr>
tmap <Leader>T <c-w>:tab term ++close<cr>
" ----------------------------------------------------------------------------
" Emmet
" ----------------------------------------------------------------------------

" CTRL + y + ,

" ----------------------------------------------------------------------------
" Coc
" ----------------------------------------------------------------------------

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" scroll within the coc popup
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"


" Show documentation/hover popup
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)

" Go to references
nmap <silent> gr <Plug>(coc-references)

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" confirm coc autocompletion selection
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" toggle inlay hints
nnoremap <Leader>ih :CocCommand document.toggleInlayHint<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>q :<C-u>CocDiagnostics<cr>

let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-rust-analyzer',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-snippets',
  \ 'coc-clangd',
\]

" ----------------------------------------------------------------------------
" ZIG LSP with Coc
" https://zigtools.org/zls/editors/vim/coc/
" ----------------------------------------------------------------------------

" don't show parse errors in a separate window
let g:zig_fmt_parse_errors = 0
" disable format-on-save from `ziglang/zig.vim`
let g:zig_fmt_autosave = 0

" code action on save
" autocmd BufWritePre *.zig,*.zon call CocActionAsync('fixAll')
" autocmd BufWritePre *.zig,*.zon call CocActionAsync('format')

" source.organizeImport
" autocmd BufWritePre *.zig,*.zon call CocActionAsync('organizeImport')

" ----------------------------------------------------------------------------
" ALE
" ----------------------------------------------------------------------------

let g:ale_disable_lsp = 1  " Let coc handle all LSP, ALE just fixes
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--extend-ignore=E203,E501 --max-line-length=88' " disable line-too-long lint errors

nnoremap <Leader>ln :ALENextWrap<CR>
nnoremap <Leader>lp :ALEPreviousWrap<CR>
nnoremap <leader>p :ALEFix<CR>

autocmd FileType html.handlebars let g:ale_javascript_prettier_options = '--parser=glimmer'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': ['prettier'],
\   'html.handlebars': ['prettier'],
\   'markdown': ['prettier'],
\}
let g:ale_linters = {
\   'rust': [],
\   'json': [],
\   'jsonc': [],
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\   'css': ['stylelint'],
\   'scss': ['stylelint'],
\   'html': [''],
\   'html.handlebars': ['ember-template-lint'],
\}
let g:ale_cpp_cc_options = '-std=c++17 -Wall -I/usr/local/Cellar/sdl2/2.32.0/include/SDL2 -L/usr/local/Cellar/sdl2/2.32.0/lib'

let g:ale_c_cc_executable = 'clang'
let g:ale_c_cc_options = '-std=c23 -Wall -I/usr/local/Cellar/raylib/5.5/include -L/usr/local/Cellar/raylib/5.5/lib'

let g:ale_sign_error = '🍄'
let g:ale_sign_warning = '🙀'

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o "Disable automatic comment insertion
autocmd FileType rust setlocal formatoptions+=r "keep auto comment insertion in rust files

"Start of im-plug manager
call plug#begin()
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-surround'
  " Plug 'pangloss/vim-javascript'
  " Plug 'joukevandermaas/vim-ember-hbs'
  Plug 'jiangmiao/auto-pairs'
  Plug 'mattn/emmet-vim' " CTRL+y+,
  Plug 'tomtom/tcomment_vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Plug 'ap/vim-css-color'
  " Plug 'hail2u/vim-css3-syntax'

  " Git extensions
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  " a commit browser
  Plug 'junegunn/gv.vim'

  Plug 'sukima/vim-javascript-imports'
  " Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'vim-utils/vim-man'
  Plug 'fidian/hexmode'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ziglang/zig.vim'
  Plug 'neoclide/jsonc.vim'
  Plug 'yggdroot/indentline'
  Plug 'morhetz/gruvbox'
call plug#end()
"End vim-plug manager

"" Must come after vim-plug config
set background=dark
colorscheme gruvbox
" highlight ColorColumn guibg=#44475a

" allow background transparency
highlight Normal guibg=NONE ctermbg=NONE
highlight CocHintHighlight guifg=#fabd2f guibg=NONE ctermbg=NONE ctermfg=yellow
highlight CocUnusedHighlight guifg=#fabd2f guibg=NONE ctermbg=NONE ctermfg=yellow
highlight CocErrorHighlight guifg=#fabd2f guibg=NONE ctermbg=NONE ctermfg=yellow
highlight CursorLine guibg=#504945 ctermbg=239
highlight CursorColumn guibg=#504945 ctermbg=239
