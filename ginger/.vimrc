" Colorscheme to be used
colorscheme murphy 

" Determine filetype to help indent
if has('filetype')
	filetype indent plugin on
endif
set autoindent

" Syntax highlighting
if has('syntax')
	syntax on
endif

" Mouse
set ttymouse=sgr
set mouse=a

" Traverse line breaks
set whichwrap=b,s,<,>,[,]

" Line numbers and CursorLine
set number
set cursorline

" Last Line
set showcmd

" Setting background to which colors should look good on
set background=dark

" Setting cursor scroll off
set scrolloff=5

" Indent Specifications
set tabstop=4
set shiftwidth=4
set shiftround


" Indentation Mappings
"----------------------

" Repeat indentation without removing selection in Visual mode
vnoremap	>	>gv
vnoremap	<	<gv

" Adding Tab Shift-Tab for indent in Normal mode
nnoremap	<Tab>	>>_
nnoremap	<S-Tab>	<<_

" Shift-Tab in Insert mode
inoremap	<S-Tab>	<C-D> 

" Adding Tab Shift-Tab for indent in Visual mode
vnoremap	<Tab>	>gv
vnoremap	<S-Tab>	<gv


" Automatically Append Closing Characters
"-----------------------------------------
" Use <C-v> before to escape automatic-append

" {
inoremap	{		{}<Left>
inoremap	{<CR>	{<CR>}<Esc>O<Tab>
inoremap	{;<CR>	{<CR>};<Esc>O<Tab>
inoremap	{}		{}

" [
inoremap	[		[]<Left>
inoremap	[<CR>	[<CR>]<Esc>O<Tab>
inoremap	[;<CR>	[<CR>];<Esc>O<Tab>
inoremap	[]		[]

" (
inoremap	(		()<Left>
inoremap	(<CR>	(<CR>)<Esc>O<Tab>
inoremap	(;<CR>	(<CR>);<Esc>O<Tab>
inoremap	()		()

" "
inoremap	"		""<Left>
inoremap	""		""

" '
inoremap	'		''<Left>
inoremap	''		''
