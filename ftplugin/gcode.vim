" G-code"

" set comment string
augroup Comment
  autocmd!
  autocmd FileType gcode setl cms='%s
augroup END
