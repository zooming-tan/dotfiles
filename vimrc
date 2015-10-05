"" Vundle boilerplate code

set nocompatible              " be iMproved, required
filetype off                  " required

"" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" Powerline - status bar
"" FYI: https://github.com/pdf/ubuntu-mono-powerline-ttf
"" FYI: http://vim.wikia.com/wiki/256_colors_in_vim
"" FYI: Konsole > Edit Current Profile > Environment > xterm-256color
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set t_Co=256
let g:Powerline_symbols = "fancy"
set laststatus=2

"" Auto-detect project root directory
Plugin 'airblade/vim-rooter'

"" Source project-specific vimrc, name: .local.vimrc
Plugin 'thinca/vim-localrc'

"" Intuitive, symmetric mapping using [ and ]
Plugin 'tpope/vim-unimpaired'

"" Jedi Vim - Python autocomplete & Supertab
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
let g:SuperTabDefaultCompletionType = "context"

"" Code snipplets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"" Ctrl-P fuzzy file finder
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
       \ --ignore .git
       \ --ignore .svn
       \ --ignore .hg
       \ --ignore .DS_Store
       \ --ignore "**/*.pyc"
       \ -g ""'
endif
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " speedup

"" Colorscheme (select by invoking 'colorscheme <name>')
Plugin 'crusoexia/vim-monokai'
Plugin 'tomasr/molokai'

"" Git integration (operates on individual buffer)
Plugin 'tpope/vim-fugitive'

"" Bookmarks and annotations (for code review)
""Plugin 'MattesGroeger/vim-bookmarks'

"" personal diary
""Plugin 'vimwiki/vimwiki'

"" syntax checker
""Plugin 'scrooloose/syntastic'
""let g:syntastic_always_populate_loc_list=1
""let g:syntastic_error_symbol='✗'
""let g:syntastic_warning_symbol='⚠'
""let g:syntastic_style_error_symbol='✗'
""let g:syntastic_style_warning_symbol='⚠'
""let g:syntastic_auto_loc_list=1
""let g:syntastic_aggregate_errors=1

"" disable syntax checking for python (handled by python-mode)
""let g:syntastic_mode_map = { 'mode': 'active',
""    \ 'active_filetypes': [],
""    \ 'passive_filetypes': ['html'] }

"" A static syntax and style checker for Python
" https://flake8.readthedocs.org/en/latest/config.html
Plugin 'nvie/vim-flake8'
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1
let g:flake8_show_in_file=1

" Navigate between tmux and vim splits seamlessly
Plugin 'christoomey/vim-tmux-navigator'

"" Compare the changes since the last save (not with git revision)
Plugin 'vim-scripts/diffchanges.vim'

"" Show git diff in the gutter (sign column), replaces git diff
""Plugin 'airblade/vim-gitgutter'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

"" use the colorscheme found in 'colors/{name}.vim'
colorscheme monokai

"" Visual autocomplete for command menu
set wildmenu

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

"" Highlight matching [{()}]
set showmatch

" Display extra whitespace
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•
set list

"" Automatically remove trailing whitespaces
autocmd FileType vim,text,python,c,cpp,java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Automatically wrap at 72 characters and spell check git commit messages
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

"" Always keep the cursor centered
set scrolloff=999

"" Set the color of the line numbers
highlight LineNr ctermfg=grey

"" Highlight trailing spaces
highlight SpecialKey ctermbg=darkgrey ctermfg=red

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Show lines numbers
set number

"" Faster line navigation
if v:version >= 703
    set relativenumber
endif

"" Auto-reload files that have been changed outside of vim
set autoread

"" Fix backspace indent
set backspace=indent,eol,start

set visualbell

"" File explorer :Vexplore
let g:netrw_liststyle=3

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to <space>
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set ignorecase
set smartcase

set timeoutlen=500

"" Encoding
set ttyfast
set lazyredraw

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh
set mouse=a

"" Disable 'Press ENTER or type command to continue' prompt when
"" running through an external program. Usage: :SILENT <an external command>
command! -nargs=1 SILENT
\ | execute ':silent '.<q-args>
\ | execute ':redraw!'

"" Easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"" Alternate between the last two files
nnoremap <leader><leader> <c-^>

"" Allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

"" Exit from insert mode
inoremap <esc> <nop>
inoremap jk <esc>

""noremap <Up> <nop>
""noremap <Down> <nop>
noremap <Up> :cp<CR>
noremap <Down> :cn<CR>
noremap <Left> :bp<CR>
noremap <Right> :bn<CR>

"" List search occurences
""nnoremap l :g//p<cr>

"" zz - sleeps... closes current buffer
nnoremap zz :q<cr>

"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
map <silent> <leader> :noh<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"" Shift-b to move cursor to the beginning of line
nnoremap B ^

"" Bracket matching
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

"" No matching
"inoremap '( (
"inoremap '{ {
"inoremap '[ [
"inoremap '< <
"inoremap '' '
"inoremap '" "

"" Compare the changes made since the last save
"" TODO: 1. type zz, if cannot close, invoke diff view
""       2. type zz from within quickfix window should quit the window
nnoremap <leader>d :DiffChangesPatchToggle<cr>

"" Convenient searching
"" s = search (within the current file)
"" sg = search globally
"" sc = search the word under the cursor (within the current file)
"" sgc = search globally for the word under the cursor
"" Within the quickfix window, type 'o' to open the specified AND close the
"" quickfix window. Type 'v' to open in vertical split.
command! -nargs=1 GREP execute 'vimgrep /'.<q-args>.'/j %' | copen
" TODO: Ggrep (git grep does not work well with projects with submodules
command! -nargs=1 GLOBALGREP execute ':silent Ggrep '.<q-args> | redraw! |
     \ copen
" TODO: annoyance -> stop Ggrep from jumping to the first occurence
nnoremap <leader>s :GREP<space>
nnoremap <leader>sg :GLOBALGREP<space>
nnoremap <leader>sc :execute 'GREP '.expand("<cword>")<cr>
nnoremap <leader>sgc :execute 'GLOBALGREP '.expand("<cword>")<cr>
" disable default 's' mapping (sometimes interfere with the typing)
nnoremap s <nop>

" complement vim-unimpaired in navigating the qfix list history
nnoremap ]c :cnewer<cr>
nnoremap [c :colder<cr>

"" open custom help file
" TODO: bind hv, hg etc. for more help files
nnoremap h :vs $HOME/.vim/reference_cards/vim_ref_card.txt<CR>
nnoremap hp :vs $HOME/.vim/reference_cards/python_ref_card.txt<CR>
nnoremap hg :vs $HOME/.vim/reference_cards/git_ref_card.txt<CR>
nnoremap hd :vs $HOME/.vim/reference_cards/django_ref_card.txt<CR>

