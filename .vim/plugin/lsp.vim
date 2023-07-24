function! s:on_lsp_buffer_enabled() abort
    setlocal completeopt+=preview
    setlocal completeopt+=noselect
    setlocal omnifunc=lsp#omni#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    " nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_diagnostics_echo_delay = 250
    let g:lsp_diagnostics_highlights_enabled = 0
    let g:lsp_diagnostics_signs_enabled = 1
    let g:lsp_diagnostics_signs_insert_mode_enabled = 0
    let g:lsp_diagnostics_virtual_text_enabled = 1
    let g:lsp_diagnostics_virtual_text_align = 'right'
    let g:lsp_diagnostics_virtual_text_wrap = 'truncate'

    highlight LspErrorText ctermfg=196
    highlight LspWarningText ctermfg=208
    highlight LspInformationText ctermfg=253
    highlight LspHintText ctermfg=253

    autocmd TextChangedI * call lsp#omni#complete(0, 'keyword')
endfunction

augroup lsp_register_server
    if executable('clangd')
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'allowlist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
    endif

    if executable('sourcekit-lsp')
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'sourcekit',
                    \ 'cmd': {server_info->['sourcekit-lsp']},
                    \ 'allowlist': ['swift'],
                    \ })
    endif

    if executable('pylsp')
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'pylsp',
                    \ 'cmd': {server_info->['pylsp']},
                    \ 'allowlist': ['python'],
                    \ })
    endif

    if executable('typescript-language-server')
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'tsserver',
                    \ 'cmd': {server_info->['typescript-language-server', '--stdio']},
                    \ 'allowlist': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
                    \ })
    endif
augroup END

augroup lsp_install
    autocmd!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
