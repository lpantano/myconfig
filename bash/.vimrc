let mapleader=","
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

" errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" quick-save \s
noremap <C-c> :quit<CR>
noremap <C-x> :update<CR>
" noremap <C-a> :insert<CR>
" vnoremap <C-c> :update<CR>
inoremap <C-x> <ESC>:update<CR>
inoremap <C-c> <Esc>
inoremap qq <ESC>
" imap <C-c> <Esc>:w<CR>

" moves
inoremap <M-b> <C-o>l 
inoremap <M-j> <C-o>j
inoremap <M-h> <C-o>l
inoremap <M-k> <C-o>k
inoremap <M-b> <C-o>b
inoremap <M-e> <C-o>e

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
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#rename_command = "<leader>r"

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




"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3  ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/share/dict/words"


" add .template as R
au BufNewFile,BufRead *.template set filetype=rmd

let g:slime_target = "tmux"

