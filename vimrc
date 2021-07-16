" vimrc
"
" @ricalbr

filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
set complete-=i
set hidden
set noswapfile

" load matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" define shell
if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set tabstop=4 softtabstop=4 shiftwidth=4
set smartindent
set expandtab smarttab
set incsearch ignorecase smartcase hlsearch
set clipboard=unnamedplus

set list listchars=trail:·,tab:•-                       " use tab to navigate in list mode
set fillchars+=vert:\▏,eob:\                            " requires a patched nerd font
set wrap breakindent                                    " wrap long lines to the width set by tw
set linebreak                                           " wrap words without break them
set nrformats-=octal
set splitright
set splitbelow
set diffopt+=vertical
silent! set splitvertical

" delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

set wildmenu
set wildmode=full
set completeopt=longest,menuone
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn

set path+=.,**
set scrolljump=5
set scrolloff=999                                       " keep cursor in the middle of the screen
set sidescrolloff=5
set lazyredraw
set redrawtime=10000
set synmaxcol=0
set number relativenumber
set numberwidth=5

" undo functionality
if has('persistent_undo')
  set undodir=$HOME/.vim/undo
  set undofile
endif

" encoding and spelling
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif
" setlocal spell
" set spelllang=en_gb

set omnifunc=syntaxcomplete#Complete
colorscheme dark

" File Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_localrmdir='rm -rf'

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" MAPPINGS
nnoremap <Space> <nop>
let mapleader="\<Space>"
nmap \ :bd

" juggling with files
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
noremap <leader>n :call ToggleNetrw()<CR>
nnoremap <leader>d :w !diff % -<CR>|
nnoremap <leader>r :retab<CR>|

" super quick search and replace
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" better completion menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap        ,,      <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap        ,:      <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap        ,=      <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>

" " smooth grepping
" command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr system(&grepprg . ' <args>')

" mapping C-S to save the file, in all the modes
nnoremap <silent><C-s> :<c-u>update<CR>
vnoremap <silent><C-s> <c-c>:update<CR>gv
inoremap <silent><C-s> <c-o>:update<CR><Esc>

" write file with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %|

" join lines keepin the cursor position
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" retain visual selection after `>` or `<`
vnoremap > >gv
vnoremap < <gv

" horizontal navigation
nnoremap <S-h> g^
nnoremap <S-l> g$
vnoremap <S-h> g^
vnoremap <S-l> g$

" move visual selection
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" emulate windows copy, cut behavior
vnoremap <LeftRelease> "+y<LeftRelease>
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+d<CR>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <esc><esc> <esc>:noh<CR><esc>

inoremap (<CR> (<CR>)<Esc>O
inoremap (;    (<CR>);<Esc>O
inoremap (,    (<CR>),<Esc>O
inoremap {<CR> {<CR>}<Esc>O
inoremap {;    {<CR>};<Esc>O
inoremap {,    {<CR>},<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap [;    [<CR>];<Esc>O
inoremap [,    [<CR>],<Esc>O
" formatting parenthesis for programming
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" overload q and w command
command! Q q
command! W w
command! Wq wq

" file navigation
map <F2> :!ls<CR>:e

function! OpenFileInPrevWindow()
    let cfile = expand("<cfile>")
    wincmd p
    execute "edit " . cfile
endfunction
nmap <F8> :call OpenFileInPrevWindow()<CR>

" " status line
set laststatus=2
set statusline=
set statusline+=%#LineNr#
set statusline+=\ \ \ %F
set statusline+=\ %m%r
set statusline+=%#LineNr#
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %m
set statusline+=\[%{&fileformat}\]
set statusline+=\ \ \ %p%%
set statusline+=\ (%l:%c)
set statusline+=\ \ %m
