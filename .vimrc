" prettier format on save
autocmd FileType javascript set formatprg=prettier\ --stdin
autocmd BufWritePre *.js :normal gggqG

" unfold by default
set foldlevel=99

