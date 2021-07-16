" " Sends default register to terminal TTY using OSC 52 escape sequence
" function Osc52Yank()
"     let buffer=system('base64 | tr -d "\n"', @0)
"     let buffer='\033]52;c;'.buffer.'\033\'
"     silent exe "!echo -ne ".shellescape(buffer).
"         \ " > ".(exists('g:tty') ? shellescape(g:tty) : '/dev/tty')
" endfunction

" " Automatically call OSC52 function on yank to sync register with host clipboard
" augroup Yank
"   autocmd!
"   autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
" augroup END
