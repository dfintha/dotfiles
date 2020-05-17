set nocompatible                " disable vi compatibility
filetype plugin indent on       " filetype-specific plugins and indentation
syntax on                       " syntax highlighting

set nowrap                      " no line wrapping
set number                      " line numbering
set smarttab                    " smart tab
set expandtab                   " expand tabs to spaces
set smartcase                   " ignore case when pattern is lowercase
set showcmd                     " show commands in bottom bar
set cursorline                  " highlight current line
set lazyredraw                  " redraw only when needed
set showmatch                   " highlight matching parentheses
set hlsearch                    " highlight search matches
set incsearch                   " incremental search
set foldenable                  " enable folding
set shiftround                  " use multiple of shiftwidth when indenting
set visualbell                  " bell would send a visual bell only...
set noerrorbells                " ... but we disable that, too
set tabstop=4                   " number of spaces for a tab character
set softtabstop=4               " number of spaces for a tab when editing
set shiftwidth=4                " number of spaces for auto indentation
set t_Co=256                    " use 256 colors
set encoding=utf-8              " use utf-8 encoding
set foldlevel=99                " don't fold anything by default
set foldmethod=indent           " fold based on markers instead of indentation
set history=100                 " remember last 100 commands
set undolevels=100              " remember last 100 operations
set colorcolumn=81              " ruler
set noswapfile                  " disable swapping
set pastetoggle=<F2>            " F2 to toggle paste mode
set background=dark             " dark mode

colorscheme default           " solarized color scheme
call togglebg#map("<F5>")     " F5 to toggle dark mode

cmap w!! w !sudo tee % > /dev/null
cmap chl!! let @/ = ""
