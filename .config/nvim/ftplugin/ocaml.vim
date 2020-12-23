nnoremap <buffer> <Leader>bc :!ocamlc -o %:r.byte %<CR>
nnoremap <buffer> <Leader>bb :!ocamlbuild %:r.byte<CR>
nnoremap <buffer> <Leader>bl :!ocamlbuild -clean<CR>
nnoremap <buffer> <Leader>br :20Term "./#:r.byte"<CR>
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
