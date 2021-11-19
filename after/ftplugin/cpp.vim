" c++

packadd vim-cpp-modern

" cpp comment string
setlocal commentstring=//\ %s
setlocal comments -=://
setlocal comments +=f://

" build and execute
noremap <buffer> <F7> :w <bar> !g++ -std=c++11 -Wall -m64 -g -I include % -o %:r <CR>
noremap <buffer> <F8> :!./%:r<CR>
" debugging
noremap <buffer> <F9> :!gdb ./%:r<CR>

" NB: to remove/change these mappings use :mapclear <buffer>
"     see also :h map-<buffer>
