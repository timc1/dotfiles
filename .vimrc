set nocompatible
set encoding=utf-8 nobomb
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim,/usr/local/opt/fzf
call vundle#begin()

" Vundle manages Vundle 😀
Plugin 'VundleVim/Vundle.vim'

" syntax highlighting
Plugin 'sheerun/vim-polyglot'

" css in js highlighting
Plugin 'styled-components/vim-styled-components'

" brackets
Plugin 'jiangmiao/auto-pairs'

" prettier code formatting
Plugin 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'html']
  \ }

" code completion
Plugin 'Valloric/YouCompleteMe'

" asynchronous linting
Plugin 'w0rp/ale'

" ~lean & mean status/tabline~ 😼
Plugin 'vim-airline/vim-airline'

" reformats indentation when we move lines up and down
Plugin 'tpope/vim-unimpaired'

" comments
Plugin 'tpope/vim-commentary'

" fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" multi cursors
Plugin 'terryma/vim-multiple-cursors'

" navigate directory in vim
Plugin 'scrooloose/nerdtree'

" open in github
Plugin 'timc1/vim-gh-line'

" colorscheme
Plugin 'owickstrom/vim-colors-paramount'

" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" show line numbers
set number
" set relative line numbers
set rnu

" always show sign columns to avoid jumpiness
set signcolumn=yes

set termguicolors
syntax enable
set background=dark
colorscheme paramount

" tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" status bar/airline
set noshowmode " hides -- INSERT --
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_skip_empty_sections=1

" netrw hide mac files
let g:netrw_list_hide='.*\.swp$,\.DS_Store'
let g:netrw_banner=0

" nerdtree config
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" quit vim if nerdtree is the last buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" explicitly open nerdtree in the directory of the current file
map <leader>r :NERDTreeFind<cr>
" open nerdtree in the directory of the current file (or root of the directory if no file is open)
" and close if nerdtree is already open
nmap <silent> <leader>t :call NERDTreeToggleInCurDir()<cr>

function! NERDTreeToggleInCurDir()
  if (IsNERDTreeOpen())
    exe ":NERDTreeClose"
  else
    exe ":NERDTreeFind"
  endif
endfunction

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" YouCompleteMe
" close preview after insertion mode
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
" remove YCM's linter because we're using ale
let g:ycm_show_diagnostics_ui = 0

" fzf
" map ctrl+p to :Files
nnoremap <c-p> :Files<CR>

" wrap text
set tw=100
set formatoptions+=t

" ignores case in searches
set ignorecase

" highlight all matching searches
set incsearch

" begins searching after typing
set hlsearch

" ctrl + l to remove current search
noremap <C-l> :noh<CR>

" show commands that have been typed
set showcmd

" don’t reset cursor to start of line when moving around
set nostartofline

" when toggling between (h)igh, (m)id, (l)ow, keep the cursor line 3 lines from the original target
set scrolloff=3

" disable cursorline in insert mode
set cul
autocmd InsertEnter,InsertLeave * set nocul!

" remap ctrl-c to esc
inoremap <C-c> <Esc><Esc>

" split window vertically, right.
set splitright

" show filename in the window titlebar
set title

" turn off bell sound 🔕
set belloff=all

" remove all scrollbars
set guioptions=

" no .swp files
set noswapfile

" remap capital w and q to lowercase
command! W :w
command! Q :q

" commentary move single lines up and down
nmap <C-k> [e
nmap <C-j> ]e
" move multiple lines up and down
vmap <C-k> [egv
vmap <C-j> ]egv

" run prettier on save
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable yanking to the clipboard
set clipboard=unnamed

" copy ycm to clipboard
ca cp let @+ = v:statusmsg

" disable 'safe write' feature that can potentially interfere with recompilation.
" Reference: https://webpack.js.org/guides/development/#adjusting-your-text-editor
set backupcopy=yes

" fzf
" map ctrl+p to :Files
nnoremap <c-p> :Files<CR>

" map bn and bp to switch buffers
ca bn bnext
ca bp bprev

" faster scrolling
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" default grep
set grepprg=ag\ -i\ --vimgrep\ --ignore={vendor,\"*.lock*\",\"*karma*\",\"*flow*\",\"*svg*\",flow-typed}
