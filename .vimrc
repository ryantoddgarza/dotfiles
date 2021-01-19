" ~/.vimrc

" Section: Bootstrap

let vimcache = $HOME . '/.cache/vim'
if !isdirectory(vimcache)
  call mkdir(vimcache, 'p')
endif

" Section: Important

set nocompatible
set pastetoggle=<F2>

filetype plugin indent on

" Section: Moving around, searching and patterns

set path+=** " Search recursively
set incsearch
set ignorecase
set smartcase

" Section: Displaying text

set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>>
set scrolloff=1
set sidescrolloff=1
set cmdheight=1
set lazyredraw
set number
set numberwidth=5

" Section: Syntax, highlighting and spelling

set background=dark
colorscheme monokai

" Make trailing whitespace obvious
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=1 guibg=darkred
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

syntax on

" Section: GUI

" Redistribute panes on window resize
autocmd VimResized * :wincmd =

" No scrollbars
set guioptions-=l guioptions-=L guioptions-=r guioptions-=R

" Section: Messages and info

set showcmd
set confirm

" Section: Editing text

set undofile
let &undodir = vimcache . '/undo'
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

set backspace=2
set infercase
set showmatch

" Section: Tabs and indenting

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftround

" Section: Folding'

set foldmethod=marker

" Section: Mapping

let mapleader=','

set timeoutlen=1200
set ttimeoutlen=50

noremap j gj
noremap k gk
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <leader>U <esc>gUawea
inoremap <leader>u <esc>guawea

nnoremap n nzz
nnoremap N Nzz
nnoremap <leader>ve :tabe $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>\| :Vexplore<CR>
nnoremap <silent> <leader>_ :Hexplore<CR>

" Section: Reading and writing files

set backupdir=$TMPDIR
set autowrite
set autoread

" Section: The swap file

set directory=$TMPDIR

" Section: Command line editing

set history=200
set wildmode=full
set wildignore+=*.o,*~,*.pyc,*/.DS_Store
set wildignore+=*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*
set wildmenu

" Section: Various

set viminfofile=vimcache/viminfo

" Section: Plugin settings

source ~/.vim/vimrcs/plugin_settings.vim
