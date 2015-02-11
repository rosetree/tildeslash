" ~/.vimrc
"
" Source:
"   https://github.com/rosetree/tildeslash
"
" Description:
"   This is my personal Vim configuration. Never trust the comments. Instead
"   read the official documentation with the `:help` command in Vim. For
"   example `:help :ab`.
"
" Inspiration:
"   https://github.com/jdavis/dotfiles/blob/master/.vimrc
"   and many others ...

set nocompatible

" Load pathogen, install plugins and help files.
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('~/.vim/bundle/{}', '~/tmp/.vim/bundle/{}')
call pathogen#helptags()

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set encoding=utf-8
" Autoreread files that changed on disk.
set autoread
" Don't keep backups of modified files.
set nobackup
set nowritebackup

" Keep 50 lines of command line history.
set history=50

" Enable incremental searching.
set incsearch
" Ignore case, when I search for lowercase patterns.
set ignorecase
" Don't ignore case, when I search for uppercase patterns.
set smartcase
" Assume I want to substitute all matches.
set gdefault

" Show the cursor position in the statusbar.
set ruler
" Display incomplete commands in the lower right corner.
set showcmd
" Show line numbers per default.
set number
" Show matching parenthesis/brackets.
set showmatch

" Use some smart indent and tab defaults.
set smarttab
set smartindent
set autoindent

" Wrap lines that are to long for my view.
set wrap
" Don't store viminfo at $HOME.
set viminfo+=n~/tmp/.vim/viminfo
" The two slashes at the end of the swap directory tell Vim it should use the
" whole path as file name. `/` is replaced with `%`.
set directory^=~/tmp/.vim/swap//
" Always show the status line.
set laststatus=2
" Disable my mouse in Vim; I don't use it anyway.
set mouse=""
" Use bash-like behaviour by default
set wildmode=longest,list,full
set wildmenu
" Ignore some file extensions.
set wildignore=*.pdf,*.aux,*.toc,*.lot,*.out,*.lock,*.desktop,*.lof
" Do not store global and local values in a session. They are likely to change
" from time to time.
set ssop-=options
" Show some whitespace.
set listchars=tab:→\ ,nbsp:_,trail:·
"set list

" Default tex mode: LaTeX.
let g:tex_flavor='latex'

" Use tab for snippets.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Sometimes I try to open another tab in my browser, while I am still in Vim.
" Don't do anything at this mistake.
nnoremap <C-t> <NOP>

" Remove trailing whitespace when hitting F12.
nnoremap <silent> <F12> :let _s=@/<Bar>:let position=getpos(".")<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:call setpos('.', position)<Bar>:nohl<CR>

" Try breaking the habbit of using the arrow keys in Vim.
noremap <Up> <NOP>
noremap <Right> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap h <NOP>
noremap j <NOP>
noremap k <NOP>
noremap l <NOP>

" Source:
"   http://vimrcfu.com/snippet/77
"
" Move visual block up or down.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Copy from cursor to the end of the line.
noremap Y y$

" Open new vertical split window and switch to it.
nnoremap <Leader>v <C-w>v<C-w>l
" Open new horizontal split window and switch to it.
nnoremap <Leader>h <C-w>s<C-w>j

" Write and source the current file
nnoremap <Leader>so :w<CR>:so %<CR>

" Quickly open this file.
nnoremap <Leader>rc :e ~/.tildeslash/.vimrc<CR>

" Quickly open zeal and search for a keyword
nnoremap gz :!zeal --query "<cword>"&<CR><CR>

" Quickly open meld and diff the current file with version control.
nnoremap gd :!meld %&<CR><CR>

" Use `s{char}{char}{label}` to navigate through the file.
nmap s <Plug>(easymotion-s2)

" Use normal regex to search.
nnoremap / /\v
vnoremap / /\v

" Jump to first char with ^ and jump to first char in column, that is not
" whitespace, with `0`.
noremap 0 ^
noremap <Home> ^
noremap ^ 0

" Easily edit files in the current directory (:e %%/)
cabbr <expr> %% expand('%:p:h')

if has("gui_running")
  " Don’t show a colored column. I don’t pay any attention on it.
  set colorcolumn=0
  " Disable some gui features.
  set guioptions-=T " toolbar
  set guioptions-=r " scrollbar right
  set guioptions-=L " scrollbar left
  set guioptions-=m " menubar
  " Turn of blinking cursor in normal mode. Keep blinking in insert mode
  " to remind my off leaving it when I finished typing.
  set guicursor=n:blinkon0
endif " has("gui_running")

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  " set hlsearch
  match Todo /\(\(X\|%\)\{3}\|#MR\|TODO\)/
endif

colorscheme desert
" Make some changes to colorscheme desert.
hi LineNr guifg=#666600
"hi ColorColumn guibg=gray21

" Add some colorscheme changes for GitGutter.
hi clear SignColumn
hi GitGutterAddDefault       guibg=grey20
hi GitGutterDeleteDefault    guibg=grey20
hi GitGutterChangeDefault    guibg=grey20
hi GitGutterInvisibleDefault guibg=grey20

" Enable file type detection.
filetype plugin indent on

" All files ending with `.md` should be handled as markdown.
au BufNewFile,BufRead *.md setlocal filetype=markdown
" For all text files set 'textwidth' to 78 characters.
au FileType text setlocal textwidth=78
" Indent LaTeX with 2 spaces
au BufNewFile,BufRead *.tex setlocal sw=2 ts=2 et
au BufNewFile,BufRead *.sty setlocal sw=2 ts=2 et
" Indent Ruby with 2 spaces
au FileType ruby,eruby setlocal sw=2 ts=2 et
" Indent html,php with 2 spaces
au FileType html,php setlocal sw=2 ts=2 noet
" Indent coffeescript with 2 spaces and enable fold by indent
au BufNewFile,BufRead *.coffee setlocal sw=2 ts=2 et foldmethod=indent nofoldenable

" Enable spell checking when an language code is present in the filename.
au BufNewFile,BufRead *.en.* setlocal spell spelllang=en
au BufNewFile,BufRead *.de.* setlocal spell spelllang=de

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
au BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! DiffOrig :w !diff --context % -

" This rewires n and N to do the highlighing.
nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

" Source:
"   http://tinyurl.com/IBV2013
"
" Blink the line containing the match.
function! HLNext (blinktime)
  set invcursorline
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  set invcursorline
  redraw
endfunction

" vim: sw=2 ts=2 et
" eof ~/.vimrc
