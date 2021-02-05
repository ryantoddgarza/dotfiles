" Ale
function! ToggleAle()
  if exists("g:loaded_ale")
    ALEToggle
  endif
endfunction

" Lexical highlighting
function! ToggleLexical()
  if exists("g:syntax_on")
    syntax off
  else
    syntax enable
  endif
endfunction

" Spell
function! ToggleSpell()
  setlocal spell! spell?
endfunction

" Tabs
function! UseSpaces()
  set expandtab
  set smarttab
  echo "spaces"
endfunction

function! UseTabs()
  set noexpandtab
  set nosmarttab
  echo "tabs"
endfunction

function! ToggleTabs()
  if &expandtab
    call UseTabs()
  else
    call UseSpaces()
  endif
endfunction

command! -bar ToggleAle :call ToggleAle()
command! -bar ToggleSpell :call ToggleSpell()
command! -bar ToggleLexical :call ToggleLexical()
command! -bar ToggleTabs :call ToggleTabs()

nnoremap <silent> <Plug>toggle_ale :ToggleAle<CR>
nnoremap <silent> <Plug>toggle_spell :ToggleSpell<CR>
nnoremap <silent> <Plug>toggle_lexical :ToggleLexical<CR>
nnoremap <silent> <Plug>toggle_tabs :ToggleTabs<CR>

let g:toggle_prefix = 'tg'

execute 'nmap ' . g:toggle_prefix . 'a <Plug>toggle_ale'
execute 'nmap ' . g:toggle_prefix . 'l <Plug>toggle_lexical'
execute 'nmap ' . g:toggle_prefix . 's <Plug>toggle_spell'
execute 'nmap ' . g:toggle_prefix . '<TAB> <Plug>toggle_tabs'
