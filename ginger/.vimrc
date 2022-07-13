" Colorscheme to be used
colorscheme murphy 

" Determine filetype to help indent
if has('filetype')
	filetype indent plugin on
endif

" Setting cindent
set autoindent
set cindent

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


" Setting Status Line
"---------------------
" Format = %[0][-][minwidth].[maxwidth]{item}

" Clear
set statusline=

" Left Side
set statusline+=%#PMenuSel#
set statusline+=%{g:gitbranchsl} 
set statusline+=%#CursorColumn#
set statusline+=\ %F%m\ %y%r

" Divider
set statusline+=%=

" Right Side
set statusline+=%b\ %3l,%-3c\ %3p%%

" Show Status Line
set laststatus=2


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
inoremap	{<CR>	{<CR>}<Esc>O
inoremap	{;<CR>	{<CR>};<Esc>O
inoremap	{}		{}

" [
inoremap	[		[]<Left>
inoremap	[<CR>	[<CR>]<Esc>O
inoremap	[;<CR>	[<CR>];<Esc>O
inoremap	[]		[]

" (
inoremap	(		()<Left>
inoremap	(<CR>	(<CR>)<Esc>O
inoremap	(;<CR>	(<CR>);<Esc>O
inoremap	()		()

" "
inoremap	"		""<Left>
inoremap	""		""

" '
inoremap	'		''<Left>
inoremap	''		''


" Saving a file
nnoremap		<F12>	:up<CR>
inoremap		<F12>	<C-o>:up<CR>
vnoremap		<F12>	<C-c>:up<CR>gv


" Variables
"-----------

let g:gitbranchsl = ''


" Custom Functions
"------------------

" To get git branch for statusline
function! UpdateGitBranch()
	let l:gitbranch = system("git branch --show-current 2>/dev/null | tr -d '\n'")
	let g:gitbranchsl = strlen(l:gitbranch) > 0 ? '  '.l:gitbranch.' ' : ''
endfunction
call UpdateGitBranch()
