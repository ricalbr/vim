" set compiler
compiler tex

" generate the document and open pdf
inoremap <F7> <Esc> :w \| :Make % <CR>
nnoremap <F7> :w \| :Make % <CR>

" compilation using pdflatex
inoremap <F8> <Esc> :w \| :! pdflatex % <CR><CR>
nnoremap <F8> :w \| :! pdflatex % <CR><CR>

noremap <leader>o :! zathura %<.pdf & <CR><CR>
