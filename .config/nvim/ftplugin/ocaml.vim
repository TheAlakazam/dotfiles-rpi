nnoremap <buffer> <Leader>cc :!ocamlc -o %:r.byte %<CR>
nnoremap <buffer> <Leader>cb :!ocamlbuild %:r.byte<CR>
nnoremap <buffer> <Leader>cl :!ocamlbuild -clean<CR>
nnoremap <buffer> <Leader>cr :20Term "./#:r.byte"<CR>
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
