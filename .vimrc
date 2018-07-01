" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Highlight current line
set cursorline

" Redraw only when we need to.
set lazyredraw

" Search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2

" prettier format
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

" unfold by default
set foldlevel=99

" supertab configs
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" basics
set number

" syntax
filetype plugin indent on
autocmd Filetype html setlocal ts=2 sw=2
autocmd FileType javascript setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2
autocmd FileType python setlocal ts=4 sw=4
autocmd BufNewFile,BufRead *.json set ft=javascript

" mitigate ale/syntastic conflict warning
let g:ale_emit_conflict_warnings = 0

" plugins
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'HenryNewcomer/vim-theme-mutenight_scene'
" jedi
Plug 'davidhalter/jedi-vim'
Plug 'maralla/completor.vim'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" supertab
Plug 'ervandew/supertab'
" yaml
Plug 'pearofducks/ansible-vim'
" whitespace
Plug 'itspriddle/vim-stripper'
" lint
Plug 'w0rp/ale'
" command-t
Plug 'wincent/command-t', {
\   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
\ }

call plug#end()

let mapleader = ","

" jedi config
" Jedi automatically starts the completion,
" if you type a dot, e.g. str., if you don't want this:
let g:jedi#popup_on_dot = 0
let g:completor_python_binary = '/usr/bin/python3'

" Lint
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ale_linters = {
  \ 'python': ['pylint'] ,
  \ }
let g:ale_completion_enabled = 1
let g:ale_python_pylint_options = '--rcfile $HOME/.pylintrc'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" command-t
let g:CommandTFileScanner = "git"
nnoremap <Leader>e :CommandT<CR>
nnoremap <Leader>b :CommandTBuffer<CR>

" color
colorscheme Monokai

" airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" theme
" let g:airline_theme='simple'

" buffer
" Move to the next buffer
nmap <leader>h :bnext<CR>
" Move to the previous buffer
nmap <leader>f :bprevious<CR>
" kill buffer
nmap <leader>k :bd<CR>
