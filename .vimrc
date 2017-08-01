" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

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

" plugins
call plug#begin('~/.vim/plugged')

" Asynchronous Lint Engine, requires NeoVim 1.5+ or Vim 8
" Plug 'w0rp/ale'
" autocompletion
Plug 'davidhalter/jedi-vim'
" supertab
Plug 'ervandew/supertab'
" yaml
Plug 'pearofducks/ansible-vim'
" whitespace
Plug 'itspriddle/vim-stripper'
" pep8
Plug 'tell-k/vim-autopep8'

call plug#end()
