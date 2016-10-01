" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
execute pathogen#infect()

" Turn on syntax highlighting
"syntax on

" For plugins to load correctly
filetype plugin indent on


colorscheme badwolf " awesome colorscheme

syntax enable  " enable syntax processing

set shiftwidth=2

set cindent

set tabstop=2 " number of visual spaces per TAB

set softtabstop=2 " number of spaces in tab when editing

set expandtab  " tabs are spaces

" UI Configuration
set colorcolumn=80 "draws a colored line at the 80th coloumn

set number

set showcmd  " show command in bottom bar

set cursorline

"filetype indent on " load filetype-specific indent files

set wildmenu " visual autocomplete for command menu

set lazyredraw          " redraw only when we need to.

set showmatch           " highlight matching [{()}]

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Custom key binding
"nnoremap


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

"important comands for certain files
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
        \:call <SID>StripTrailingWhitespaces()
  autocmd FileType java setlocal expandtab
  "autocmd FileType java setlocal list
  "autocmd FileType java setlocal listchars=tab:+\ ,eol:-
  "autocmd FileType java setlocal formatprg=par\ -w80\ -T4
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal list
  autocmd FileType php setlocal listchars=tab:+\ ,eol:-
  autocmd FileType php setlocal formatprg=par\ -w80\ -T4
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

augroup filetype                                                     
  au BufRead,BufNewFile *.flex,*.jflex,*jlex    set filetype=jflex         
augroup END                                                          
au Syntax jflex    so ~/.vim/syntax/jflex.vim                        
