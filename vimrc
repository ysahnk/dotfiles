"for .vimrc file {{{
augroup vimrc
 autocmd!
 autocmd BufRead $MYVIMRC setlocal foldmethod=marker
 autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END
" }}}

"for C file {{{
let s:c_template = [
	\ "#include <stdio.h>", "",
	\ "int main(int argc, char *argv[]) {", "",
	\ "\treturn 0;", "}"
	\ ]

function s:Eatchar(pat)
	let c = nr2char(getchar(0))
	return (c =~# a:pat) ? "" : c
endfunction

function s:SetCAbbrev()
	inoreabbrev <buffer> iff
	\ if (z) {<CR><CR>}
	\<C-O>?z<CR><Del><C-O>:nohlsearch<CR><C-R>=<SID>Eatchar('\s')<CR>
	inoreabbrev <buffer> forr
	\ for (int i = 0; i < z; i++) {<CR><CR>}
	\<C-O>?z<CR><Del><C-O>:nohlsearch<CR><C-R>=<SID>Eatchar('\s')<CR>
endfunction

augroup C
 autocmd!
 autocmd BufNewFile *.c call setline(1, s:c_template) 
 autocmd BufNewFile,BufRead *.c call <SID>SetCAbbrev()
augroup END
" }}}

"for todo.md file {{{
function s:ToggleDone() 
	let line = getline(".")
	let @t = strftime("[%Y-%m-%d %H:%M:%S] ")
	if line[0:4] ==# "- [ ]"
		normal! 03lrx3l"tP0
	elseif line[0:4] ==# "- [x]"
		normal! 03lr 2ldf]0
	endif
endfunction

function s:ToggleComp() 
	let line = getline(".")
	let current_num = line(".")
	let done_num = search('^### DONE$', "nw")
	if line[0:4] ==# "- [ ]"
		call s:ToggleDone()
		normal! ddGp''0
	elseif line[0:4] ==# "- [x]"
		if current_num < done_num
			normal! ddGp''0
		else
			call s:ToggleDone()
			normal! dd2Gp0
		endif
	endif
endfunction

augroup todo
 autocmd!
 autocmd BufNewFile,BufRead ~/todo.md nnoremap <buffer> x <Esc>:call <SID>ToggleDone()<CR> 
 autocmd BufNewFile,BufRead ~/todo.md nnoremap <buffer> t <Esc>:call <SID>ToggleComp()<CR> 
 autocmd BufNewFile,BufRead ~/todo.md nnoremap <buffer> o o- [ ] 
augroup END
" }}}

let mapleader = " "
"let maplocalleader = ","

nnoremap <leader>v :edit $MYVIMRC<CR>
nnoremap <leader>t :terminal<CR>
nnoremap <leader>x :Explore<CR>
nnoremap <leader>r :registers<CR>

nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
"nnoremap <Tab> :bnext<CR>

let g:markdown_fenced_languages = ['bash', 'c', 'javascript']

""" SETTINGS
syntax on
set number
"set autochdir
set autoread
set confirm
set showcmd
set scrolloff=3
"set laststatus=2
set nobackup
set noswapfile

""" INDENT
set autoindent
"set expandtab
set tabstop=4
set shiftwidth=4

""" SEARCH
nnoremap / /\v
"nnoremap ? ?\v
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set shortmess-=S

""" MOVE
set whichwrap=h,l
"set backspace=indent,eol,start

""" DISPLAY
set splitbelow
set splitright
set wildmenu
set wildoptions=pum

""" PAREN
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

""" COMPLETION
set shortmess+=c
set complete=.,w,b,u,i
set completeopt=menuone,preview
for k in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_"
	execute "inoremap " . k . " " . k . "<C-N><C-P>"
endfor
inoremap <expr> <Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
