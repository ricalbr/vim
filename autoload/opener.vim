" open file or directory under cursor
function! opener#OpenFileInPrevWindow() abort
    let cfile = expand("<cfile>")
    wincmd p
    execute "edit " . cfile
endfunction

nmap <F8> :call opener#OpenFileInPrevWindow()<CR>
