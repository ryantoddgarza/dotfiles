" Format
nnoremap <F5> mzgg=G`z

" Compile
setlocal makeprg=javac\ %

function! Compile()
  silent w

  if exists("g:loaded_dispatch")
    Make
  else
    make
  endif
endfunction

nnoremap <silent> <F6> :call Compile()<CR>
