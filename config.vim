function! s:markdownPreviewConfig()
    function! g:Open_browser(url)
        silent exe 'silent !osascript ~/.config/lvim/preview-markdown.scpt ' . a:url
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
    let g:mkdp_page_title = '${name} markdown preview'
    function! s:Close_browser()
        :MarkdownPreviewStop
        silent exe 'silent !osascript ~/.config/lvim/preview-markdown.scpt close'
    endfunction
    command! MarkdownPreviewS call s:Close_browser()
endfunction
call s:markdownPreviewConfig()

nnoremap <leader>S 

