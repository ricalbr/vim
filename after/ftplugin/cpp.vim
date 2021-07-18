" c++

" cpp comment string
setlocal commentstring=//\ %s

" Build and execute
noremap <buffer> <F7> :w <bar> !g++ -std=c++11 -Wall -m64 -g -I include % -o %:r <CR><CR>
noremap <buffer> <F8> :!./%:r<CR><CR>
" Debugging
noremap <buffer> <F9> :!gdb ./%:r<CR>

" noremap <buffer> <F5> :w <bar> :term_sendkeys(
