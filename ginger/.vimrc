" Colorscheme to be used
colorscheme murphy 

" Syntax highlighting
filetype plugin on
syntax on

" Indentation
filetype indent on

" Tab and Indent-shift width
set tabstop=4
set shiftwidth=4

" Mouse
set ttymouse=sgr
set mouse=a

" Traverse line breaks
set whichwrap=b,s,<,>,[,]

" Line numbers
set number

" Setting background to which colors should look good on
set background=dark

"
" Indentation Mappings
"


" Repeat indentation without removing selection in Visual mode
vnoremap > >gv
vnoremap < <gv

" Adding Tab Shift-Tab for indent in Normal mode
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_

" Shift-Tab in Insert mode
inoremap <S-Tab> <C-D> 

" Adding Tab Shift-Tab for indent in Visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
