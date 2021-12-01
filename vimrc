" vimrc
"
" @ricalbr

" SETTING ENVIRONMENT {{{
if empty($MYVIMRC) | let $MYVIMRC = expand('<sfile>:p') | endif

if empty($XDG_CACHE_HOME)  | let $XDG_CACHE_HOME  = $HOME."/.cache"       | endif
if empty($XDG_CONFIG_HOME) | let $XDG_CONFIG_HOME = $HOME."/.config"      | endif
if empty($XDG_DATA_HOME)   | let $XDG_DATA_HOME   = $HOME."/.local/share" | endif

set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p', 0700)
set viewdir=$XDG_DATA_HOME/vim/view | call mkdir(&viewdir, 'p', 0700)

set backupdir=$XDG_CACHE_HOME/vim/backup | call mkdir(&backupdir, 'p', 0700)
set directory=$XDG_CACHE_HOME/vim/swap   | call mkdir(&directory, 'p', 0700)
set undodir=$XDG_CACHE_HOME/vim/undo     | call mkdir(&undodir,   'p', 0700)

if !has('nvim') " Neovim has its own special location
  set viminfo+=n$XDG_CACHE_HOME/vim/viminfo
endif
" }}}

" BASIC SETTINGS {{{
filetype plugin indent on
syntax on

set autoindent
set backspace=indent,eol,start
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
set expandtab smarttab
set incsearch ignorecase smartcase hlsearch
set clipboard=unnamedplus
set cindent
set cinoptions=:.5s,>1s,p0,t0,(0,g2                     " :.5s = indent case statements 1/2 shiftwidth
set cinwords=if,else,while,do,for,switch,case,class,try " which keywords should indent

" listchars options
set list
set listchars=trail:·
set listchars+=tab:•-                                   " (U+2022, UTF-8: E2 80 A2)
set listchars+=nbsp:⦸                                   " (U+29B8, UTF-8: E2 A6 B8)
set listchars+=precedes:«                               " (U+00BB, UTF-8: C2 BB)
set listchars+=extends:»                                " (U+00AB, UTF-8: C2 AB)

" fillchar options
set fillchars=vert:│                                    " (U+2502, UTF-8: E2 94 82)
set fillchars+=eob:\                                    " use space for end of buffer

set wrap breakindent                                    " wrap long lines to the width set by tw
set linebreak                                           " wrap words without break them
set nrformats-=octal
set splitright splitbelow
set diffopt+=vertical
silent! set splitvertical

" folding options
if has('folding')
  if has('windows')
    set fillchars+=diff:∙                               " (U+2219, UTF-8: E2 88 99)
    set fillchars+=fold:·                               " (U+00B7, UTF-8: C2 B7)
  endif

  set foldmethod=manual
  set foldlevelstart=99                                 " start unfolded
endif

" delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

set wildmenu
set wildmode=longest:full,full
set wildignore+=*.bak,*.swp,*.swo
set wildignore+=*.a,*.o,*.so,*.pyc,*.class
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.pdf
set wildignore+=*/.git*,*.tar,*.zip
set wildignore+=*.obj,*.exe,*.py[co],.svn
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

set path=.,**
set scrolljump=5
set scrolloff=999
set sidescrolloff=5
set noshowmode
set lazyredraw
set redrawtime=10000
set synmaxcol=0
set number

if exists('+relativenumber')
  set relativenumber                                " show relative numbers in gutter
endif

set numberwidth=5
set signcolumn=yes

" undo functionality
if has('persistent_undo')
    set undofile
endif

" encoding and spelling
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" overload q and w command
command! Q  q
command! W  w
command! Wq wq

" smooth grepping
command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr system(&grepprg . ' <args>')

" write file with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %<CR>
" }}}

" AUTOCOMMANDS {{{
" set colorscheme
function! MyHighlights() abort
    highlight Pmenu           cterm=NONE           gui=NONE      guibg=#00010A guifg=white
    highlight Search          cterm=NONE           gui=NONE      guibg=#B16286 guifg=#EBDBB2
    highlight NonText         cterm=NONE           gui=NONE      guifg=bg
    highlight SpellBad        cterm=NONE           gui=undercurl guifg=NONE
    highlight Comment         cterm=italic         gui=italic
    highlight CursorLineNr    cterm=NONE           gui=bold
    highlight SpellBad        cterm=undercurl,bold
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme dark call MyHighlights()
augroup END
colorscheme dark

" remember folds
augroup rememberFold
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" remember cursor position
augroup Operations
  autocmd!
  autocmd BufReadPost * call autocmdfunctions#LastPosition()
  autocmd BufWritePre * call autocmdfunctions#RmvTrailingSpaces()
augroup END
" }}}

" MAPPINGS {{{
nnoremap <Space> <nop>
let mapleader="\<Space>"
nmap \ :bd<CR>

" juggling with files
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

nmap     <Tab>     :bnext<CR>
nmap     <S-Tab>   :bprevious<CR>
nnoremap <leader>d :w !diff % -<CR>
nnoremap <leader>r :retab<CR>

" super quick search and replace
nnoremap <leader><Space> :'{,'}s/\<<C-r>=expand("<cword>")<CR>\>/
nnoremap <leader>%       :%s/\<<C-r>=expand("<cword>")<CR>\>/

" better completion menu
"   menu navigation with <C-n> and <C-p>
"   ,, trigger line completion
"   ,. trigger keyword completion
"   ,- trigger filename compeltion
inoremap        ,,      <C-x><C-l><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap        ,.      <C-n><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>
inoremap        ,-      <C-x><C-f><C-r>=pumvisible() ? "\<lt>Down>\<lt>C-p>\<lt>Down>\<lt>C-p>" : ""<CR>

" mapping C-S to save the file, in all the modes
nnoremap <silent><C-s> :<C-u>update<CR>
vnoremap <silent><C-s> <C-c>:update<CR>gv
inoremap <silent><C-s> <C-o>:update<CR><Esc>

" join lines keepin the cursor position
nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

" capital Y standard behaviour
nnoremap Y y$

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" retain visual selection after `>` or `<`
vnoremap > >gv
vnoremap < <gv

" move visual selection
xnoremap J :move '>+1<CR>gv=gv
xnoremap K :move '<-2<CR>gv=gv

" argslist navigation
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>

" quickfix list navigation
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window management
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 6/5)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 5/6)<CR>

" no arrow keys
nnoremap <Down>  <NOP>
nnoremap <Up>    <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" autoload functions mappings
xnoremap <silent>al                 :<C-u>silent call align#Align()<CR>
nnoremap <silent><leader>p          :call opener#OpenFileInPrevWindow()<CR>
cnoremap <expr><CR>                 cmdline#AutoComplete()
nnoremap <silent><expr> <Leader>h   wordshl#Highlighting()

" access file data
cnoremap \fp <C-R>=expand("%:p:h")<CR>
inoremap \fp <C-R>=expand("%:p:h")<CR>
cnoremap \fn <C-R>=expand("%:t:r")<CR>
inoremap \fn <C-R>=expand("%:t:r")<CR>
" }}}

" PLUGIN-SPECIFIC OPTIONS {{{

" UltiSnips
let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Use carriage returns as a surround character
let g:surround_13 = "\n\t\r\n"

" Sometimes UltiSnips does not auto reload snippets
cnoreabbrev resnip call UltiSnips#RefreshSnippets()
nnoremap <leader>u :UltiSnipsEdit!<CR>

" GitGutter
set updatetime=250

" change signs and colors
let g:gitgutter_sign_added = '▐'
let g:gitgutter_sign_modified = '▐'
let g:gitgutter_sign_removed = '▐'

highlight GitGutterAdd    ctermfg=22
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=196
" }}}
