setlocal makeprg=clang\ %\ -o\ %<

function! Compile()
  silent w

  if exists("g:loaded_dispatch")
    Make
  else
    make
  endif
endfunction


nnoremap <silent> <F6> :call Compile()<CR>
