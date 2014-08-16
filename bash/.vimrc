execute pathogen#infect()
filetype plugin indent on
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
set nu
set autochdir 
set tags+=./tags; " jump to functions; Need to do ctags -R inside the project; 
" Ctrl-] open file same widnows; Ctrl-W ] open file new windows
"colorscheme blackboard
colorscheme sweyla611286
"set background=dark
"colorscheme solarized
highlight MatchParen cterm=bold ctermfg=cyan
let python_highlight_all = 1
let python_version_2 = 1

" Tell vim to remember certain things when we exit
"
" "  '10  :  marks will be remembered for up to 10 previously edited files
" "  100 :  will save up to 100 lines for each register
" "  :20  :  up to 20 lines of command-line history will be remembered
" "  %    :  saves and restores the buffer list
" "  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
 if line("'\"") <= line("$")
   normal! g`"
   return 1
 endif
endfunction

augroup resCur
 autocmd!
 autocmd BufWinEnter * call ResCur()
augroup END


" jedi-vim <C-Space> to autocomplation
let g:pymode_rope = 0 " to be compatible with jedivim
autocmd FileType python set completeopt-=preview " not showing __doc__ during autocompletion
let g:jedi#auto_vim_configuration = 0
let g:jedi#auto_initialization = 0

" spell option
nmap sc :setlocal spell spelllang=en_us
nmap dsc :set nospell 

"tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


"status line
set statusline=%{fugitive#statusline()}
set statusline+=%t       "tail of the filename
"set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
