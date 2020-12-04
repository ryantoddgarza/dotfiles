" ~/.vimrc

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

" Section: GUI

colorscheme monokai

" Redistribute panes on window resize
autocmd VimResized * :wincmd =

" Make trailing whitespace obvious
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkred guibg=darkred
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" No scrollbars
set guioptions-=l guioptions-=L guioptions-=r guioptions-=R

" Section: Syntax, highlighting and spelling

set background=dark
syntax on
highlight ExtraWhitespace ctermbg=darkred guibg=darkred

" Section: Messages and info

set showcmd
set confirm

" Section: Editing text

set undodir=$TMPDIR
set backspace=2
set infercase
set showmatch

" Section: Tabs and indenting

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Section: Mapping

let mapleader=","

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
nnoremap <leader>ve :tabe $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>\| :Vexplore<CR>
nnoremap <silent> <leader>_ :Hexplore<CR>
nnoremap <silent> <leader>ss :setlocal spell!<CR>
nnoremap <silent> <leader>ts :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
nnoremap <silent> <leader>ta :if exists("g:loaded_ale") <Bar> ALEToggle <Bar> endif <CR>

" Integrating pane switching with tmux
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
  noremap <C-h> <C-w>h
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l
endif

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

function! EnsureCacheExists ()
  if !isdirectory($VIM_CACHE)
    call mkdir($VIM_CACHE, 'p')
  endif
endfunction

call EnsureCacheExists()
set viminfofile=$VIM_CACHE/viminfo

" Section: Filetype settings

autocmd FileType * setlocal nolinebreak
autocmd FileType markdown,text,vimwiki setlocal linebreak
autocmd FileType markdown,text setlocal spell

" Section: Plugin settings

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_dirhistmax = 0
let g:airline_theme = 'molokai'
let g:user_emmet_leader_key = ','
let g:ale_linters = { 'javascript': ['eslint'], 'html': ['tidy'] }
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_header = 1
let g:vimwiki_toc_header_level = 2
let g:vimwiki_list = [{ 'path': '~/vimwiki', 'auto_toc': 1 }]
let g:vimwiki_key_mappings = {
  \   'all_maps': 1,
  \   'global': 1,
  \   'headers': 1,
  \   'text_objs': 1,
  \   'table_format': 0,
  \   'table_mappings': 0,
  \   'lists': 1,
  \   'links': 1,
  \   'html': 0,
  \   'mouse': 0,
  \ }
