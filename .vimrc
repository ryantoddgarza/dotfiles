" ~/.vimrc

" Section: Basic setup

setglobal nocompatible
setglobal pastetoggle=<F2>

filetype plugin indent on

" Section: Displaying text

setglobal scrolloff=1
setglobal sidescrolloff=1
setglobal lazyredraw
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

setglobal number
setglobal numberwidth=5
setglobal guioptions-=l guioptions-=L guioptions-=r guioptions-=R

" Section: Messages and info

setglobal confirm
setglobal showcmd

" Section: Text, tab and indent

setglobal backspace=2
setglobal expandtab
setglobal softtabstop=2
setglobal shiftwidth=2
setglobal tabstop=8

setglobal breakindent
setglobal breakindentopt=shift:4,min:40,sbr
setglobal showbreak=>>

setglobal infercase
setglobal showmatch

" Section: Maps

let mapleader=","

setglobal timeoutlen=1200
setglobal ttimeoutlen=50

nnoremap <leader>r :source ~/.vimrc<CR>

nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>\| :Vexplore<CR>
nnoremap <silent> <leader>_ :Hexplore<CR>
nnoremap <silent> <leader>ss :setlocal spell!<CR>
nnoremap <silent> <leader>ts :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>

" Section: Reading and writing files

setglobal autoread
setglobal autowrite

function! EnsureCacheExists ()
  if !isdirectory($VIM_CACHE)
    call mkdir($VIM_CACHE, 'p')
  endif
endfunction

call EnsureCacheExists()
setglobal viminfofile=$VIM_CACHE/viminfo

setglobal backupdir=$TMPDIR
setglobal directory=$TMPDIR
setglobal undodir=$TMPDIR

" Section: Command line editing

setglobal history=200
setglobal wildmenu
setglobal wildmode=full
setglobal wildignore=*.o,*~,*.pyc
setglobal wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

" Section: Moving around, searching, patterns and tags

setglobal ignorecase
setglobal smartcase
setglobal incsearch

" Search down into subfolders
setglobal path+=**

" Section: Filetype settings

autocmd FileType * setlocal nolinebreak
autocmd FileType markdown,text,txt setlocal linebreak spell

" Section: Plugin settings

let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_dirhistmax=0
let g:airline_theme='molokai'
let g:user_emmet_leader_key=','
let g:ale_linters = { 'javascript': ['eslint'], }
let g:ale_enabled = 1
