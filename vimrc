" vimrc
"
" @ricalbr

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

set list listchars=trail:·,tab:•-                       " use tab to navigate in list mode
set fillchars+=vert:\▏,eob:\                            " requires a patched nerd font
set wrap breakindent                                    " wrap long lines to the width set by tw
set linebreak                                           " wrap words without break them
set nrformats-=octal
set splitright splitbelow
set diffopt+=vertical
silent! set splitvertical

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
set number relativenumber
set numberwidth=5
set signcolumn=yes

" undo functionality
if has('persistent_undo')
    set undodir=$HOME/.vimundo
    set undofile
endif

" encoding and spelling
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

" colorscheme
function! MyHighlights() abort
    highlight Pmenu        cterm=NONE           gui=NONE      guibg=#00010A guifg=white
    highlight Search       cterm=NONE           gui=NONE      guibg=#B16286 guifg=#EBDBB2
    highlight NonText      cterm=NONE           gui=NONE      guifg=bg
    highlight SpellBad     cterm=NONE           gui=undercurl guifg=NONE
    highlight Comment      cterm=italic         gui=italic
    highlight CursorLineNr cterm=NONE           gui=bold
    highlight SpellBad     cterm=undercurl,bold
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme dark call MyHighlights()
augroup END
colorscheme dark

augroup Operations
  autocmd!
  autocmd BufReadPost * call autocmdfunctions#LastPosition()
  autocmd BufWritePre * call autocmdfunctions#RmvTrailingSpaces()
augroup END

" overload q and w command
command! Q  q
command! W  w
command! Wq wq

" smooth grepping
" command! -nargs=+ -complete=file_in_path -bar Grep cgetexpr system(&grepprg . ' <args>')

" write file with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %<CR>

" -- MAPPINGS -- "
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
"   menu navigation with <Tab> and <S-Tab>
"   ,, trigger line completion
"   ,. trigger keyword completion
"   ,- trigger filename compeltion
inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
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
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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
xnoremap <silent>al     :<C-u>silent call align#Align()<CR>
nnoremap <F8>           :call opener#OpenFileInPrevWindow()<CR>
cnoremap <expr> <CR>    cmdline#AutoComplete()
nnoremap <silent> <expr> <Leader><Space> wordshl#Highlighting()

" access file data
cnoremap \fp <C-R>=expand("%:p:h")<CR>
inoremap \fp <C-R>=expand("%:p:h")<CR>
cnoremap \fn <C-R>=expand("%:t:r")<CR>
inoremap \fn <C-R>=expand("%:t:r")<CR>

