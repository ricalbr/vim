" terminal settings
augroup Term
  autocmd!
  " close the terminal buffer with <C-d>
  autocmd! BufWinEnter,WinEnter * if &buftype == 'terminal' | silent! normal i | endif
  autocmd! TerminalOpen * set nonu nornu
augroup END


tnoremap <Esc> <C-\><C-N>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
