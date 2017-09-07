" ~/.config/nvim/init.vim
"
" vim: sw=2 ts=2 et foldmethod=marker foldlevel=0
"
" Author:
"   Micha Rosenbaum <micha@rosetree.de>
"
" Description:
"   This is my personal Neovim/Vim configuration. Never trust the comments.
"   Instead read the official documentation with the `:help` command in
"   Neovim/Vim. For example `:help :ab`.
"
" Uncomplete:
" TODO: http://vim.wikia.com/wiki/Keep_your_vimrc_file_clean?useskin=monobook
" TODO: http://vim.wikia.com/wiki/How_to_initialize_plugins?useskin=monobook

" Load Plugins {{{
set nocp
" Load pathogen, install plugins and help files.
" source $HOME/.config/nvim/bundle/vim-pathogen/autoload/pathogen.vim
" Load plugins from vim directories
" call pathogen#infect('~/.config/nvim/bundle/{}')
" call pathogen#helptags()

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" Files & Directories {{{
let g:netrw_home="~/tmp/.vim/"
" The two slashes at the end of the swap directory tell Vim it should use the
" whole path as file name. A / will be replaced with %
set directory^=~/tmp/.vim/swap//
set undodir=~/tmp/.vim/undo/
" Use persistent undo
set undofile

" search files in **; use :find
set path+=**

set nobackup
set nowritebackup

" Use ripgrep
" set grepprg=rg\ --vimgrep
" }}}

" Display Options {{{

" Colors {{{
" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2
  syntax on
  match Todo /\(\(X\|%\)\{3}\|#MR\|TODO\)/
endif
" }}}

" Statusline {{{
" Show current branch in the statusline
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
" Display incomplete commands in the lower right corner.
set showcmd
" }}}

" Wrap lines that are to long for my view.
set wrap

" Use bash-like behaviour by default
set wildmode=longest,list,full
" Ignore some file extensions.
set wildignore=*.pdf,*.aux,*.toc,*.lot,*.out,*.lock,*.desktop,*.lof

" Show some whitespace.
set listchars=tab:\ \ ,nbsp:_,trail:·
set list

" Open diff view on the right.
set diffopt+=vertical
" }}}

" Editing {{{

" Search & Substitute {{{
" Ignore case, when I search for lowercase patterns.
set ignorecase
" Don't ignore case, when I search for uppercase patterns.
set smartcase
" Assume I want to substitute all matches.
set gdefault
" Don’t highlight search results per default
set nohls
" }}}

" Allow project specific configuration
set exrc

" Use some smart indent and tab defaults. (More via vim-sensible.)
set smartindent
" }}}

" Vim Specific {{{
if !has('nvim')
  " Don't store viminfo at $HOME.
  set viminfo+=n~/tmp/.vim/viminfo
endif
" }}}

" Gui Specific {{{
if has("gui_running")
  set linespace=4
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
  colo desert
  set background=dark
  set macligatures
  set guifont=Fira\ Code:h12
endif
" }}} Gui Specific

" Keys / Shortcuts {{{

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Remove trailing whitespace when hitting F12.
" nnoremap <silent> <F12> :let _s=@/<Bar>:let position=getpos(".")<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:call setpos('.', position)<Bar>:nohl<CR>

" Copy from cursor to the end of the line.
noremap Y y$

noremap ± ~
noremap § `

" Easily edit files in the current directory (:e %%/)
cabbr <expr> %% expand('%:p:h')

" Close current fold, move one fold up/down, open fold, center fold start
noremap zK zczkzozz
noremap zJ zczjzozz

" Leader {{{

" Open new vertical split window and switch to it.
nnoremap <Leader>v <C-w>v<C-w>l
" Open new horizontal split window and switch to it.
nnoremap <Leader>h <C-w>s<C-w>j

" Don’t higlight search
nnoremap <Leader><Space> :set hls!<CR>
nnoremap <Leader>, :so $MDR_TILDESLASH_DIR/nvim/init.vim<CR>

" }}}

" }}}

" FileTypes {{{

" Enable file type detection.
filetype plugin indent on

augroup configgroup
  au!
  " All files ending with `.md` should be handled as markdown.
  " au BufEnter *.md setlocal filetype=text
  " au TextChanged,TextChangedI *.md silent write
  " For all text files set 'textwidth' to 78 characters.
  " au FileType text setlocal textwidth=78
  " Indent Ruby with 2 spaces
  " au FileType ruby,eruby setlocal sw=2 ts=2 et

  " Indent LaTeX/TeX with 2 spaces
  au FileType tex setlocal sw=2 ts=2 et

  au FileType markdown setlocal commentstring=<!--%s-->

  au FileType php setlocal commentstring=//%s
  au FileType php setlocal textwidth=120
  " http://vim.wikia.com/wiki/PHP_online_help?useskin=monobook
  au FileType php setlocal keywordprg=$HOME/.vim/phpdoc.sh

  " Indent JavaScript files with 4 spaces, as recommended by Douglas Crockford
  " http://javascript.crockford.com/code.html
  " au FileType javascript setlocal sw=4 ts=4 et

  " Use correct filetype, when I’m preparing a commit
  au BufEnter .gitmessage setlocal filetype=gitcommit
  au FileType gitcommit setlocal spell
  au FileType gitcommit setlocal commentstring=#\ %s

  " Indent ruby with 2 spaces and enable fold by indent
  au FileType ruby setlocal sw=2 ts=2 et foldmethod=indent

  " Indent coffeescript with 2 spaces and enable fold by indent
  au FileType coffee setlocal sw=2 ts=2 et foldmethod=indent

  au FileType c setlocal nolist

  au BufNewFile .editorconfig :!cp $MDR_TILDESLASH_DIR/editorconfig %

  " Files with mail extensions are mail
  au BufEnter *.mail setlocal filetype=mail

  " When editing a file, always jump to the last known cursor position and
  " center that position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"zz" |
        \ endif
augroup END

" }}}

" Local Customization {{{
let $LOCALFILE=expand("~/.config/vimrc")
if filereadable($LOCALFILE)
  source $LOCALFILE
endif
" }}}

" eof ~/.config/nvim/init.vim
