" Variables
"-----------

let g:gitbranchsl = ""
let mapleader="\<Space>"


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

" Better command-line completion
set wildmenu

" Mouse
set ttymouse=sgr
set mouse=a

" Traverse line breaks
set whichwrap=b,s,<,>,[,]

" Line numbers and CursorLine
set number
set cursorline

" Show partial commands on last line
set showcmd

" Setting background to which colors should look good on
set background=dark

" Setting cursor scroll off
set scrolloff=5

" Buffer Settings
"-----------------

" Hide buffer
set hidden

" Basic Mappings
nnoremap <Leader>b :ls<CR>:b
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>N :bp<CR>

" Number Mappings
let i = 1
while i <= 10
	execute "nnoremap <Leader>" . i . " :b" . i ."<CR>"
	let i += 1
endwhile


" Indent Specifications
"-----------------------

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

" Automate make views
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


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


" Function Key Mappings
"-----------------------

" Saving a file
nnoremap		<F12>	:update<CR>
inoremap		<F12>	<C-o>:update<CR>
vnoremap		<F12>	<C-c>:update<CR>gv

" Reload configuration
nnoremap		<F5>	:source $MYVIMRC<CR>
inoremap		<F5>	<C-o>:source $MYVIMRC<CR>
vnoremap		<F5>	<C-c>:source $MYVIMRC<CR>gv

"" Buffers
"nnoremap		<F9>	:ls<CR>:b
"inoremap		<F9>	<C-o>:ls<CR>:b
"vnoremap		<F9>	<C-c>:ls<CR>:b


" Custom Functions
"------------------

" To get git branch for statusline
function! UpdateGitBranch()
	let l:gitbranch = system("git branch --show-current 2>/dev/null | tr -d '\n'")
	let g:gitbranchsl = strlen(l:gitbranch) > 0 ? '  '.l:gitbranch.' ' : ''
endfunction
call UpdateGitBranch()


" Custom highlight
"------------------

highlight Comment cterm=italic
