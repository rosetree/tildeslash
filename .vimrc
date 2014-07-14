" ~/.vimrc
"
" Maintainer:	Micha Rosenbaum <micha@rosetree.de>
" Last Change:	2014-06-27

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set nobackup		" do not keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
"set cursorline		" show current line
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set encoding=utf-8	" use UTF-8
set autoread		" Autoreread files that changed on disk
set ignorecase		" Ignore case when searching
set smartcase		" But don't ignore it, when I use uppercase letters
set gdefault		" always add /g per default
set colorcolumn=80	" Show long lines
set number		" Show line numbers per default
set showmatch		" Show matching parenthesis/brackets
set wrap		" Wrap lines
set viminfo+=n~/tmp/.vim/viminfo " don't store .viminfo in $HOME
set directory^=~/tmp/.vim/swap " swap file directory
set laststatus=2	" Always show the status line.
set mouse=""		" Disable mouse; I don't use it anyway.
" Ignore some files
set wildignore=*.pdf,*.aux,*.toc,*.lot,*.out,*.lock,*.desktop,*.lof
set ssop-=options    " do not store global and local values in a session
" Show some whitespace
set listchars=tab:▶\ ,nbsp:_,trail:·
set list

let g:tex_flavor='latex' " Default tex mode: LaTeX

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" type table,,, to get <table></table> automatically close a tag
" TODO: Does not work for one letter tags
"imap ,,, <esc>bdwa<<esc>pa><cr></<esc>pa><esc>kA

" Remove trailing whitespace when hitting F12.
:nnoremap <silent> <F12> :let _s=@/<Bar>:let position=getpos(".")<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:call setpos('.', position)<Bar>:nohl<CR>

" When pressing <F11> toggle relative numbers. Disable normal numbers before
" enabling relative numbers, because of awkward behaviour.
:nnoremap <silent> <F11> :set nonu rnu! rnu?<CR>

" <C-F11> toggles normal line numbers and shows current value. Disable
" relative line numbers before showing normal line numbers (see above).
:nnoremap <silent> <C-F11> :set nornu nu! nu?<CR>

" Try breaking the habbit of using the arrow keys in Vim.
nnoremap <Up> <NOP>
nnoremap <Right> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
" Don't move in insert mode.
inoremap <Up> <NOP>
inoremap <Right> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>

" Exit insert mode faster then hitting escape.
inoremap jj <ESC>

" Open new vertical split window and switch to it.
nnoremap <Leader>w <C-w>v<C-w>l

" Write and source the current file
nnoremap <Leader>ws :w<CR>:so %<CR>

" Disable search highlighting with <C-n> in normal mode.
nmap <Leader><Space> :set hls! hls?<CR>
" Use normal regex to search.
nnoremap / /\v
vnoremap / /\v

" Easily edit files in the current directory (:e %%/)
cabbr <expr> %% expand('%:p:h')

if has("gui_running")
	" Disable toolbar (T)
	set guioptions-=T
	" Disable scrollbar (r)
	set guioptions-=r
	" Disable scrollbar on the left (L)
	set guioptions-=L
	" Disable menubar at the top (m)
	set guioptions-=m
	" Activate a dark colorscheme
	colorscheme green-on-dark-gray
	set guicursor=n:blinkon0
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	" set hlsearch
	match Todo /\(\(X\|%\)\{3}\|#MR\|TODO\)/
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" Override filetypes
		au BufNewFile,BufRead *.md setlocal filetype=markdown

		" For all text files set 'textwidth' to 78 characters.
		au FileType text setlocal textwidth=78

		" Indent LaTeX with 2 spaces
		au FileType LaTeX setlocal sw=2 ts=2 et
		" Indent Ruby with 2 spaces
		au FileType ruby,eruby setlocal sw=2 ts=2 et

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

	augroup END

else
	set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


""===[ From tinyurl.com/IBV2013 ]
" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.3)<cr>
nnoremap <silent> N   N:call HLNext(0.3)<cr>

" blink the line containing the match...
function! HLNext (blinktime)
	set invcursorline
	redraw
	exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
	set invcursorline
	redraw
endfunction

vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++
""===[ Until here from tinyurl.com/IBV2013 ]

" vim: nospell
" eof ~/.vimrc
