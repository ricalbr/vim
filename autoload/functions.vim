" return to last wdit position when edit a file
function! functions#LastPosition()
    if line("'\"") > 0 && line("'\"") <= line("$") |
        exe "normal! g`\"" |
    endif
endfunction


" open file or directory under cursor
function! functions#OpenFileInPrevWindow() abort
    let cfile = expand("<cfile>")
    wincmd p
    execute "edit " . cfile
endfunction

