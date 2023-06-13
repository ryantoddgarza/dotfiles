" ~/.vimrc

" Section: Important

set nocompatible
set pastetoggle=<F2>

filetype plugin indent on

" Section: Moving around, searching and patterns

set path+=** " Search recursively
set regexpengine=0
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

" Section: Syntax, highlighting and spelling

" Make trailing whitespace obvious (set before `syntax on`)
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=1 guibg=darkred
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

syntax on
colorscheme monokai

set background=dark
set colorcolumn=81

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
let &undodir = $XDG_STATE_HOME . '/vim_undo'
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif

set infercase
set showmatch
set backspace=0

" Section: Tabs and indenting

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set smartindent
set shiftround

" Section: Folding

set foldmethod=marker

" Section: Mapping

let mapleader=','

set timeoutlen=1200
set ttimeoutlen=50

" Always move by display (wrapped) lines
noremap j gj
noremap k gk
" Center line vertically when repeating a search
nnoremap n nzz
nnoremap N Nzz
" Manage vimrc
nnoremap <leader>ve :tabe $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
" Trim whitespace
nnoremap <leader>tw :%s/\s\+$<CR>
" Quick window splits.
nnoremap <silent> <leader>\| :Vexplore<CR>
nnoremap <silent> <leader>_ :Hexplore<CR>
" Disable backspace in [normal, visual, select, operator-pending]
noremap <backspace> <nop>
" Disable arrow keys in [normal, visual, select, operator-pending]
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
" Disable arrow keys in [insert]
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Section: Reading and writing files

set backupcopy=yes
set backupdir=$TMPDIR
set autowrite
set autoread

" Section: The swap file

set directory=$TMPDIR

" Section: Command line editing

set history=200
set wildmode=full
set wildignore+=*.o,*~,*.pyc,*/.DS_Store
set wildignore+=*/Library/*,*/node_modules/*,*/.git/*,*/.hg/*,*/.svn/*
set wildmenu

" Section: Multi-byte characters

set encoding=utf-8

" Section: Filetype settings

autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall

" Section: Various

let &viminfofile = $XDG_CACHE_HOME . '/viminfo'

" Section: Plugin settings

let g:airline_theme = 'molokai'
let g:ale_virtualtext_cursor = 0
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_dirhistmax = 0
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_header = 1
let g:vimwiki_list = [
      \  {
      \    'path': '~/vimwiki/src/vimwiki',
      \    'syntax': 'markdown',
      \    'ext': '.md',
      \    'links_space_char': '-',
      \  }
      \]
let g:vimwiki_key_mappings = {
      \  'all_maps': 1,
      \  'global': 1,
      \  'headers': 1,
      \  'text_objs': 1,
      \  'table_format': 0,
      \  'table_mappings': 0,
      \  'lists': 1,
      \  'links': 1,
      \  'html': 0,
      \  'mouse': 0,
      \}
