Vim�UnDo� V�T���i��c�����aۺ9�'j��yWPW|      E" Sends default register to terminal TTY using OSC 52 escape sequence                              `�WM    _�                             ����                                                                                                                                                                                                                                                                                                                                                             `�WG     �                E" Sends default register to terminal TTY using OSC 52 escape sequence5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        `�WL    �                augroup END�                O  autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif�   
             
  autocmd!�   	             augroup Yank�      
          P" Automatically call OSC52 function on yank to sync register with host clipboard�      	           �                endfunction�                C        \ " > ".(exists('g:tty') ? shellescape(g:tty) : '/dev/tty')�                0    silent exe "!echo -ne ".shellescape(buffer).�                *    let buffer='\033]52;c;'.buffer.'\033\'�                0    let buffer=system('base64 | tr -d "\n"', @0)�                function Osc52Yank()�                 E" Sends default register to terminal TTY using OSC 52 escape sequence5��