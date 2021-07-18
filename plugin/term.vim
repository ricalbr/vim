" terminal settings
augroup Term
  autocmd!
  " close the terminal buffer with <C-d>
  autocmd! BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
  autocmd! TerminalOpen * set nonu nornu
  tnoremap <Esc> <C-\><C-n>
augroup END

