runtime! debian.vim
execute pathogen#infect()
syntax enable
filetype plugin indent on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set colorcolumn=79
set nu			" Show line number
set incsearch		" Incremental search
set hlsearch            " higlight all matches
nnoremap <space> :nohlsearch<CR> 

set smarttab
set expandtab
set shiftwidth=2        " Indent is 2spaces, also lined to >>/<<
set tabstop=2           " used for reading external files
set softtabstop=2       " expandtab converts tabs into these many spaces

" set autoindent

"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set pastetoggle=<f5>    " Enable paste of external items, and pressF5
" testing  'indent' vim.org file for folding
" set foldenable
" set foldmethod=indent  " fold based on indent level
" set foldlevel=1         " Close all by default while opening 
set foldclose=all " automatically close after moving out
" let python_highlight_all = 1
"set spell
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " Close Nerdtree if only it is left

nmap w :w!<cr>     " Fast saving in buffers with 'w'

" Airline and ALE
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1   " Switch between buffers with tab
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\}
let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_python_flake8_args = '--ignore=E,W,F403,F405 --select=F,C'

let g:ale_completion_enabled = 1  " Enable completion where available.
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:pymode_lint_ignore = 'E111, W0311'  " Ignore Indentation not a mulitple of four
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ycm_python_binary_path = '/usr/bin/python3' " for Youcompletme


" ****** harsha added for autofolding **********
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
  augroup END

set foldnestmax=1

"------- Shortcut for folding and unfolding ----------
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"------- Ctags ---------------------
nnoremap t :CtrlPTag<cr>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
