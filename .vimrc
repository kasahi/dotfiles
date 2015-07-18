
" vimrc
" Tab/Indent
" -------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4

"noexpandtab: tab=tab , expandtab: tab=space
set expandtab

set backup
set backupdir=$HOME/backup/vim
set number
"set backspace=2
set backspace=indent,eol,start
set autoindent

set swapfile
set directory=$HOME/backup/vim/swp


" -------------------
" Syntax Highlight
" -------------------
syntax on

highlight LineNr ctermfg=Lightblue
highlight NonText ctermfg=darkgrey
highlight Folded ctermfg=blue
highlight statement ctermfg=Magenta
highlight SpecialKey cterm=underline ctermfg=darkgrey
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=grey
"match ZenkakuSpace /Ž¡Ž¡/
"
" Syntax Highlight for actionscript and mxml files
autocmd BufNewFile,BufRead *.as set filetype=actionscript
autocmd BufNewFile,BufRead *.mxml set filetype=mxml

set showmatch
set showmode


" -------------------
" Japanese Settings
" -------------------
set encoding=japan
set termencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932
set fenc=utf-8
set enc=utf-8


" -------------------
" Search
" -------------------
set ignorecase
set smartcase
set incsearch
set hlsearch "nohlsearch
" -------------------
" File Type
" -------------------
au FileType perl call PerlType()
filetype plugin indent on
autocmd! BufRead,BufNewFile *.php set filetype=php
autocmd! BufRead,BufNewFile *.inc set filetype=php
autocmd! BufRead,BufNewFile *.cgi set filetype=perl
autocmd! BufRead,BufNewFile *.pass setlocal nobackup

" -------------------
set updatetime=500
" -------------------
" buffer Settings
" -------------------
set hidden
" -------------------
" Othser
" -------------------
set notitle
set autowrite
set history=50
set list
set listchars=tab:\ \ ,extends:<,trail:\_
set laststatus=2
set wildmode=full:list
set visualbell t_vb=


"set statusline=%f:<l.%l:c.%c%V>
set statusline=%F\:%l.%c%=%{GetStatusEx()}%m%r%y\


" -------------------
" Key Map
" -------------------
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

nmap <c-m><c-m> :make<cr>
nmap <c-m>m :!sudo /home/y/bin/webctl8507 restart<cr>
set makeprg=/home/y/bin/gmake

nmap gR :grep -Hirn <cword> *<cr>
nmap gr :grep -i <cword> *<cr>
nmap <c-e><c-e> :Explore<cr>
nmap <c-e><c-b> :BufExplore<cr>
nmap <c-W>N :vnew<cr>
let g:explUseSeparators=1


map <F1> <ESC>:bd<CR>
map <F2> <ESC>:bp<CR>
map <F3> <ESC>:bn<CR>
map <silent> <F4> :call BufferList()<CR>
map <silent> <F5> :Explore<CR>
map <silent> <F6> :YRShow <CR>
map <silent> <F9> :Dox <CR>
map <silent> <F10> :! w3m ~/docs/cppreference/cpp.html <CR>

map <F11> :VCgrep
inoremap <C-H>	<BS>

" -------------------
" Define Function
" -------------------_
" get char encooding and Kaigyo code
function! GetStatusEx()
    let str = ''
    let str = str . '' . &fileformat . ']'
    if has('multi_byte') && &fileencoding != ''
        let str = '[' . &fileencoding . ':' . str
    endif
    return str
endfunction
