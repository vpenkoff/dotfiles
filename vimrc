syntax off
filetype indent on
set expandtab
set autoread
set ignorecase
set smartcase
set incsearch
set ai
set smartindent
set wildmenu
set showmatch
set nobackup
set nowritebackup
set colorcolumn=80
set laststatus=2
set background=dark

" make backspace to work again - since VIM8
set backspace=indent,eol,start
"

" Break bad habbits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Turn on paste mode [and insert mode]
:nnoremap <leader>sp :set paste<cr>i
" Turn off paste mode [and insert mode]
:nnoremap <leader>sP :set nopaste<cr>

" Edit and Source the $MYVIMRC
:nnoremap <leader>se :vsplit $MYVIMRC<cr>
:nnoremap <leader>sr :source $MYVIMRC<cr>

" Highlight on write Orphan Whitespaces at the end of the line
highlight OrphanWS ctermbg=green guibg=green
autocmd BufWritePost * match OrphanWS /\s\+$/

" Remove the whitespaces
:vnoremap <space>s :s/\s\+$//g<CR>

" FZF
let fzf_path = finddir(".fzf", ".;")
if (fzf_path != "")
	execute 'set rtp+=' . fzf_path
	map ; :FZF<CR>
endif

" Configs for ruby
augroup filetype_ruby
	autocmd!
	autocmd FileType ruby nnoremap <buffer><localleader>c I#<esc>
	set softtabstop=2
	set shiftwidth=2
	set tabstop=2
	set expandtab
augroup END

"" Configs for js
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript nnoremap <buffer><localleader>c I//<esc>
	set softtabstop=2
	set shiftwidth=2
	set tabstop=2
	set expandtab
augroup END

"" Configs for vue
augroup filetype_vue
	autocmd!
	set softtabstop=2
	set shiftwidth=2
	set tabstop=2
	set expandtab
augroup END

augroup filetype_python
	autocmd!
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set expandtab
augroup END

augroup filetype_go
	autocmd!
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set expandtab
	autocmd FileType go nnoremap <buffer> <space>f :%!gofmt<CR>
	autocmd FileType go vnoremap <buffer> <space>f :'<,'>!gofmt<CR>
augroup END

augroup filetype_yaml
  autocmd!
  set softtabstop=2
  set shiftwidth=2
  set tabstop=2
  set expandtab
augroup END

augroup filetype_php
	autocmd!
	set softtabstop=4
	set shiftwidth=4
	set tabstop=4
	set expandtab
augroup END

augroup filetype_json
	autocmd!
	autocmd FileType json nnoremap <buffer> <space>f :%!python -m json.tool<CR>
augroup END

autocmd FileType make setlocal noexpandtab

" Operate between paranthesis
:onoremap p i(

" Statusline
:set statusline=%<%F
:set statusline+=\ %y
:set statusline+=%m
:set statusline+=%r
:set statusline+=%=
:set statusline+=\ [%l:%c]
:set statusline+=\ %L
:set statusline+=\ %P
:set statusline+=\ %p%%

" Search for the word under the cursor
if executable('rg')
	" Use rg over grep
	set grepprg=rg\ --vimgrep\ --no-heading
endif

set grepformat=%f:%l:%c:%m,%f:%l:%m
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" vimpg
let g:VimPgDbHostname = "localhost"
