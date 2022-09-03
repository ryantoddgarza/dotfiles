setlocal equalprg=clang-format
setlocal makeprg=clang\ %\ -o\ %<

function! Compile()
  silent w

  if exists("g:loaded_dispatch")
    Make
  else
    make
  endif
endfunction

nnoremap <F5> mzgg=G`z
nnoremap <silent> <F6> :call Compile()<CR>
