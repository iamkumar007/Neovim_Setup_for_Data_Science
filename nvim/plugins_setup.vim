" Part of Plugins setup

" Neovim config
syntax enable " enable syntax highglighting
syntax on " turn on syntax highlighting

" set vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=230

" Easy motion – Text Navigation
map <Leader> <Plug>(easymotion-prefix)

" NERDTree
let g:NERDTreeShowHidden = 1 
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed 
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " Map to open current file in NERDTree and set size
nnoremap <C-f> :NERDTreeFind<bar> :vertical resize 45<CR>

" NERDTree Syntax Highlight

" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1 
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1 
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {} 
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue 
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {} 
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange 
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {} 
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red 
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige 
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue 

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Ignored"   : "☒",
    \ "Unknown"   : "?"
    \ }

" Airline
"let g:airline_powerline_fonts = 1
"let g:airline_section_b = '%{getcwd()}' " in section B of the status line display the CWD

" " TABLINE
"let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
"let g:airline#extensions#branch#enabled = 1            " enable git branch
"let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
"let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
"let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
"let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
"let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
"let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
"let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
"let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
"let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
"let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" Lightline
let g:lightline = {
  \     'colorscheme': 'powerline',
  \     'active': {
  \         'left': [['mode', 'paste' ], ['gitbranch', 'readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \ },
  \     'component_function': {
  \         'gitbranch': 'FugitiveHead'
  \ },
  \ }

" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings 
" " to bind Ctmd+/ to ++
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" set neoterm
let g:neoterm_bracketed_paste = 1
let g:neoterm_auto_repl_cmd = 0
" " Open the neoterm in a vertical split if current window width is bigger than
" " 100, otherwise use a horizontal split.
let g:neoterm_callbacks = {}
function! g:neoterm_callbacks.before_new()
  if winwidth('.') > 100
    let g:neoterm_default_mod = 'botright vertical'
  else
    let g:neoterm_default_mod = 'botright'
  end
endfunction
" " Send selected contents in visual mode and move to the next line.
xmap gx $<Plug>(neoterm-repl-send)'>j0
" " Send the current line in normal mode and move to the next line.
nmap gx <Plug>(neoterm-repl-send-line)j0
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au VimEnter,BufRead,BufNewFile *.idr set filetype=idris
au VimEnter,BufRead,BufNewFile *.lidr set filetype=lidris
au VimEnter,BufRead,BufNewFile *.lfe set filetype=lfe
" " Set shortcut to enter normal mode in terminal buffer
tnoremap <esc> <c-\><c-n>

" " Use radian instead of R for nvim-R
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" " set rmarkdown file type for safety
au BufNewFile,BufRead *.Rmd set filetype=rmd

" " set r file type for safety
au BufNewFile,BufRead *.R set filetype=r

" " Set R shortcuts
autocmd FileType r inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType rnoweb inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType rmd inoremap <buffer> %% <Esc>:normal! a %>%<CR>a
autocmd FileType r inoremap <buffer> << <Esc>:normal! a <- <CR>a
autocmd FileType rnoweb inoremap <buffer> << <Esc>:normal! a <- <CR>a
autocmd FileType rmd inoremap <buffer> << <Esc>:normal! a <- <CR>a

