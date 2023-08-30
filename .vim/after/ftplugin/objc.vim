" Prefer single line comments
setlocal commentstring=//\ %s

" Compile
setlocal makeprg=clang\ -fobjc-arc\ %\ -o\ %<

function! Compile()
  silent w

  if exists("g:loaded_dispatch")
    Make
  else
    make
  endif
endfunction

nnoremap <silent> <F6> :call Compile()<CR>
