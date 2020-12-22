nnoremap <buffer> <Leader>cc :!ocamlc -o %:r.byte %<CR>
nnoremap <buffer> <Leader>cr :20Term "./#:r.byte"<CR>
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp+=' . g:opamshare . '/merline/vim'
execute 'runtime ' . g:opamshare . '/merlin/vim/plugged/**/*.vim'
