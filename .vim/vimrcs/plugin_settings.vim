" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_dirhistmax = 0

" Airline
let g:airline_theme = 'molokai'

" Emmet
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall

" Ale
let g:ale_linters = { 'javascript': ['eslint'], 'html': ['tidy'], 'python': ['pylint'] }

" Vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_auto_header = 1
let g:vimwiki_toc_header_level = 2
let g:vimwiki_list = [
      \   {
      \     'path': '~/vimwiki/src/vimwiki',
      \     'syntax': 'markdown',
      \     'ext': '.md',
      \     'links_space_char': '-',
      \     'auto_toc': 1
      \   }
      \ ]
let g:vimwiki_key_mappings = {
      \ 'all_maps': 1,
      \ 'global': 1,
      \ 'headers': 1,
      \ 'text_objs': 1,
      \ 'table_format': 0,
      \ 'table_mappings': 0,
      \ 'lists': 1,
      \ 'links': 1,
      \ 'html': 0,
      \ 'mouse': 0,
      \ }
