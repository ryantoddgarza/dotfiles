" ~/.vimrc

" Sections:
"   - Basic setup
"   - Displaying text
"   - Windows
"   - GUI
"   - Messages and info
"   - Text, tab and indent
"   - Maps
"   - Reading and writing files
"   - Command line editing
"   - Moving around, searching, patterns and tags
"   - Filetype settings
"   - Plugin settings

" Section: Basic setup

set nocompatible
set pastetoggle=<F2>

filetype plugin indent on

" Section: Displaying text

set scrolloff=1
set sidescrolloff=1
set lazyredraw
set cmdheight=1

" Section: Windows

autocmd VimResized * :wincmd =

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Section: GUI

syntax on
set background=dark
colorscheme monokai

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

set number
set numberwidth=5

set guioptions-=l guioptions-=L guioptions-=r guioptions-=R

" Section: Messages and info

set confirm
set showcmd

" Section: Text, tab and indent

set backspace=2

set expandtab

set softtabstop=2
set shiftwidth=2

set tabstop=8

set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=>>

set infercase
set showmatch

" Section: Maps

let mapleader=","

set timeoutlen=1200
set ttimeoutlen=50

nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>\| :Vexplore<CR>
nnoremap <silent> <leader>_ :Hexplore<CR>
nnoremap <silent> <leader>ss :setlocal spell!<CR>
nnoremap <silent> <leader>ts :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>

" Section: Reading and writing files

set autoread
set autowrite

set backupdir=$TMPDIR
set directory=$TMPDIR
set undodir=$TMPDIR

" Section: Command line editing

set history=200
set wildmenu
set wildmode=full
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Section: Moving around, searching, patterns and tags

set ignorecase
set smartcase
set incsearch

" Search down into subfolders
set path+=**

" Section: Filetype settings

autocmd FileType * setlocal nolinebreak
autocmd FileType markdown,text,txt setlocal linebreak spell

" Section: Plugin settings

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:airline_theme='molokai'
let g:user_emmet_leader_key=','
let g:ale_linters = { 'javascript': ['eslint'], }
let g:ale_enabled = 1
