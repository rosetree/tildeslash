" ~/.vim/colors/green-on-dark-gray.vim
"
" Maintainer:   Micha Rosenbaum <micha@rosetree.de>
" Last Change:  2014-06-25
"
" TODO: Look at unknown/unused properties when an unedited style appears.
" TODO: Edit the style of the “Diff‟ group.

set background=dark
hi clear

if exists("syntax_on")
	syntax clear
	syntax on
endif

let g:colors_name="green-on-dark-gray"

" ===[ Unknown/Unused properties ]============================================
" I do not know what some of them are doing. From others I do not use the
" functionality. But they shall stand out with an annoying white background so
" that it is obvious when there is something that needs to be changed.
hi Conceal          guifg=#000000 guibg=#ffffff gui=NONE
hi SignColumn       guifg=#000000 guibg=#ffffff gui=NONE
hi MoreMsg          guifg=#000000 guibg=#ffffff gui=NONE
hi Pmenu            guifg=#000000 guibg=#ffffff gui=NONE
hi PmenuSel         guifg=#000000 guibg=#ffffff gui=NONE
hi PmenuSbar        guifg=#000000 guibg=#ffffff gui=NONE
hi PmenuThumb       guifg=#000000 guibg=#ffffff gui=NONE
hi TabLine          guifg=#000000 guibg=#ffffff gui=NONE
hi TabLineFill      guifg=#000000 guibg=#ffffff gui=NONE
hi TabLineSel       guifg=#000000 guibg=#ffffff gui=NONE
hi WildMenu         guifg=#000000 guibg=#ffffff gui=NONE
hi FoldColumn       guifg=#000000 guibg=#ffffff gui=NONE

" ===[ Position properties ]==================================================
" Styles that should help you find your position in the document.
hi Cursor           guifg=#000000 guibg=#888800 gui=NONE
hi CursorColumn     guifg=#000000 guibg=#191919 gui=NONE
hi CursorLine       guibg=#191919 gui=NONE
hi LineNr           guifg=#333355 guibg=#090909 gui=NONE
hi CursorLineNr     guifg=#888833 guibg=#090909 gui=bold

" ===[ MISC ]=================================================================
" Let me know if you have a good idea how those could be categorized.
hi Search           guifg=#ffffff guibg=#333333 gui=NONE
hi IncSearch        guifg=#ffffff guibg=#333333 gui=italic
hi MatchParen       guifg=#000000 guibg=#009977 gui=NONE
hi Title            guifg=#22bb22 guibg=#090909 gui=bold
hi Normal           guifg=#33bb33 guibg=#090909 gui=NONE
hi Directory        guifg=#33bb33 guibg=#090909 gui=italic
hi SpecialKey       guifg=#333333 guibg=#090909 gui=NONE
hi NonText          guifg=#555555 guibg=#000000 gui=NONE
hi Visual           guifg=#33cc33 guibg=#222222 gui=NONE
hi ColorColumn      guibg=#000000 gui=NONE

" ===[ Delimiters ]===========================================================
" Split between buffers.
hi VertSplit        guifg=#aaffaa guibg=#222222 gui=NONE
hi StatusLine       guifg=#aaffaa guibg=#222222 gui=bold
hi StatusLineNC     guifg=#aaffaa guibg=#222222 gui=NONE
hi Folded           guifg=#225522 guibg=#000000 gui=NONE

" ===[ Messages and Questions ]===============================================
hi ModeMsg          guifg=#555555 guibg=#090909 gui=NONE
hi ErrorMsg         guifg=#ff2222 guibg=#000000 gui=italic
hi WarningMsg       guifg=#2222ff guibg=#000000 gui=italic
hi Question         guifg=#55bb55 guibg=#090909 gui=NONE

" ===[ Spell checks ]=========================================================
hi SpellBad         guifg=#55bb33 guibg=#090909 guisp=#aa0000 gui=undercurl
hi SpellCap         guifg=#33bb33 guibg=#090909 guisp=#770077 gui=undercurl
hi SpellLocal       guifg=#33bb33 guibg=#090909 guisp=#663020 gui=undercurl
hi SpellRare        guifg=#55bb33 guibg=#090909 guisp=#003300 gui=undercurl

" ===[ Diff ]=================================================================
hi DiffAdd          guifg=#000000 guibg=#ffffff gui=NONE
hi DiffChange       guifg=#000000 guibg=#ffffff gui=NONE
hi DiffDelete       guifg=#000000 guibg=#ffffff gui=NONE
hi DiffText         guifg=#000000 guibg=#ffffff gui=NONE

" ===[ Syntax Groups ]========================================================
" Highlighting when writing code.
hi Comment          guifg=#098009 guibg=#090909 gui=NONE
hi Constant         guifg=#33bb55 guibg=#090909 gui=NONE
hi Identifier       guifg=#77bb33 guibg=#090909 gui=NONE
hi Statement        guifg=#66bb66 guibg=#090909 gui=NONE
hi PreProc          guifg=#66bb33 guibg=#090909 gui=NONE
hi Type             guifg=#33bb33 guibg=#090909 gui=NONE
hi Special          guifg=#11cc11 guibg=#090909 gui=NONE
hi Underlined       guifg=#33bb33 guibg=#090909 gui=underline
hi Ignore           guifg=#33bb33 guibg=#090909 gui=NONE
hi Error            guifg=#bb3333 guibg=#090909 gui=NONE
hi Todo             guifg=#999999 guibg=#440000 gui=NONE

