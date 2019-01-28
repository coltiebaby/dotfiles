set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'
" Markdown Preview
Plugin 'JamshedVesuna/vim-markdown-preview'
" vim-scala
Plugin 'derekwyatt/vim-scala'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"     filetype plugin on
"
" Brief help
"  :PluginList       - lists configured plugins
"  :PluginInstall    - installs plugins; append `!` to update or just
"  :PluginUpdate
"  :PluginSearch foo - searches for foo; append `!` to refresh local cache
"  :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
"
" PUT YOUR NON-PLUGIN STUFF AFTER THIS LINE

" Set copy to clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

" Let vim preview markdown in the browser
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Quantum'

" Turn on syntax by default
syntax on

" Allow mouse scrolling
set mouse=a
vnoremap p pgvy

" Colorscheme
syntax enable
set background=dark
colorscheme special_boards

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show current mode down the bottom
set showmode
set number      "show line numbers

" default indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab

" no backups, please!
set nobackup
set noswapfile

" reselect when indenting
vnoremap < <gv
vnoremap > >gv

" highlight search results
set hlsearch

" keep cursor somewhat centered
set scrolloff=5

" Shows line limit
set colorcolumn=80
highlight ColorColumn ctermbg=grey


"Show highting groups for current word
nmap <C-S-P> :call <SID>SynStack<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" extra whitespace sucks, make it RED
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
"set wildignore+=doc            " should not break helptags
set wildignore+=.git            " should not break clone
set wildignore+=.git/*          " should not break clone
set wildignore+=*/.git/*
set wildignore+=*/.hg/*
set wildignore+=*/.svn/*
"set wildignore+=*/.tox/*
set wildignore+=*.pyc,*.pyo
"set wildignore+=*/.*/*

" Splitting Settings
set splitbelow
set splitright

nnoremap ,j <C-W><C-J>
nnoremap ,k <C-W><C-K>
nnoremap ,l <C-W><C-L>
nnoremap ,h <C-W><C-H>


" yaml indentation
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType yml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Remove whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Scala settings
let g:scala_scaladoc_indent = 1
au FileType scala setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd BufEnter *.scala colorscheme thor
