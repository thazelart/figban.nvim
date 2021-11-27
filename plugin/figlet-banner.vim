" Last Change:  2021 Nov 28
" Maintainer:   Thibault Hazelart <thazelart@gmail.com>
" License:      GNU General Public License v3.0

if exists('g:loaded_figban') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo
set cpo&vim

hi def link FigbanHeader      Number
hi def link FigbanSubHeader   Identifier
" hi FigbanCursorLine ctermbg=238 cterm=none

command! -nargs=+ Figban lua require'figban'.figban(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_figban = 1

" Figlet fontfile to use
let g:figban_fontfile = "standard"
