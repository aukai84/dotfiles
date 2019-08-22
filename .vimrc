"vim plugins
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'sheerun/vim-polyglot'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'posva/vim-vue'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'jesstelford/vim-js-pretty-template'
Plug 'maxmellon/vim-jsx-pretty'
" post install (yarn install | npm install)
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'alampros/vim-styled-jsx'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" yank to clipboard
"if has("clipboard")
"  set clipboard=unnamed " copy to the system clipboard
"endif

"set encoding to show glyphs
set encoding=utf8

"set font for icons
set guifont=DroidSansMono_for_Powerline_Nerd_Font_Complete:h11

let g:indentLine_setColors = 0

"airline configurations
let g:airline_theme='deus'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' | '
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

"Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

"Edwards configurations
set nocompatible
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
if has('mouse')
	  set mouse=a
  endif
"--------------------
"GENERAL SETTINGS
"--------------------

" Display line numbers on the left
set number

" When searching try to be smart about cases 
 set smartcase

" Highlight search results
 set hlsearch

" Makes search act like search in modern browsers
 set incsearch

" For regular expressions turn magic on
 set magic

" Show matching brackets when text indicator is over them
 set showmatch

" How many tenths of a second to blink when matching brackets
 set mat=2

" set tabs to have 4 spaces
 set ts=4

" indent when moving ot the next line while writing code
 set autoindent

" show a visual line under the cursor's current line
 set cursorline

" enable all Python syntax highlighting features
 let python_highlight_all = 1

" No annoying sound on errors
 set noerrorbells
 set novisualbell
 set t_vb=
 set tm=500

 " Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

"mapping ESC to new key
inoremap jk <esc>

"remap leader key to space
let mapleader = "\<Space>"

"--------------------
"APPEARANCE SETTINGS
"--------------------

syntax enable
set background=dark
set t_Co=256
"let g:molokai_original = 1
let g:rehash256 = 1
colorscheme palenight 

set wildmenu            " visual autocomplete for command menu

"set transparent background
hi Normal guibg=NONE ctermbg=NONE

"Nerd Tree Configurations
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
	
"Syntastic configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:user_emmet_leader_key=','

"styled-jsx/template syntax highlighting

call jspretmpl#register_tag('css', 'css')
autocmd FileType javascript JsPreTmpl css

let g:jsx_ext_required = 0
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1
let g:xml_syntax_folding = 1

