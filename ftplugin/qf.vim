"" credit: https://github.com/romainl/vim-qf/

setlocal nowrap

if v:version >= 703
    setlocal norelativenumber
endif
setlocal number

" we don't want quickfix buffers to pop up when doing :bn or :bp
set nobuflisted

" are we in a location list or a quickfix list?
let b:isLoc = len(getloclist(0)) > 0 ? 1 : 0

" force the quickfix window to be opened at the bottom
" of the screen and take the full width
wincmd J

" open entry in a new horizontal window
nnoremap <buffer> s <C-w><CR>

" open entry in a new vertical window.
nnoremap <buffer> v <C-w><CR><C-w>L<C-w>p<C-w>J<C-w>p

" open entry in a new tab.
nnoremap <buffer> t <C-w><CR><C-w>T

" open entry and come back
" nnoremap <buffer> o <CR><C-w>p

" open entry and close the location/quickfix window.
if b:isLoc == 1
"   nnoremap <buffer> O <CR>:lclose<CR>
    nnoremap <buffer> o <CR>:lclose<CR>
else
"   nnoremap <buffer> O <CR>:cclose<CR>
    nnoremap <buffer> o <CR>:cclose<CR>
endif
