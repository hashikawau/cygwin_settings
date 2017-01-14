"--------------------------------------
" set encoding, line feed
"--------------------------------------
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,ucs-bom,latin1
"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"    set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,ucs-bom,latin1
"endif
set fileformats=unix,dos,mac

"--------------------------------------
" vimdiff's color
"--------------------------------------
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21

"--------------------------------------
"
"--------------------------------------
set history=200
set mouse=n
set ignorecase
set smartcase
set autoindent
set incsearch
set number
set list
set listchars=tab:>\ ,trail:.

"--------------------------------------
" Set colorscheme
"--------------------------------------
"highlight NonText guibg=none guifg=LightMagenta
"highlight SpecialKey guibg=none guifg=LightMagenta
"highlight Search guibg=none guifg='NONE'
"set cursorline
"highlight Normal term=none cterm=none ctermbg=white ctermfg=black
"highlight StatusLine term=none cterm=none ctermfg=black ctermbg=gray
"highlight CursorLine term=none cterm=none ctermfg=black ctermbg=lightgray
"highlight Comment ctermfg=LightCyan


"--------------------------------------
" Writing vim command
"   :read !ls /usr/share/vim/vim74/colors/ | sed 's/ +/\n/g' | awk -F'.' '/.*\.vim/{print "\"colorscheme " $1}'
"colorscheme blue
"colorscheme darkblue
"colorscheme default
"colorscheme delek
colorscheme desert
"colorscheme elflord
"colorscheme evening
"colorscheme koehler
"colorscheme morning
"colorscheme murphy
"colorscheme pablo
"colorscheme peachpuff
"colorscheme ron
"colorscheme shine
"colorscheme slate
"colorscheme torte
"colorscheme zellner

set hlsearch
"set nohlsearch
set showmatch

"--------------------------------------
"
"--------------------------------------
set wildmenu wildmode=list:full
"set clipboard=unnamed
set clipboard=autoselect
"set guioptions+=a
syntax on

set nowrap
set nowrapscan


set nocompatible	" Use Vim defaults (much better!)
set backspace=indent,eol,start		" allow backspacing over everything in insert mode


set ai			" always set autoindenting on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backup		" keep a backup file
set backupdir=~/.vim/bak


set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

"" Switch syntax highlighting on, when the terminal has colors
"" Also switch on highlighting the last used search pattern.
"if &t_Co > 2 || has("gui_running")
"  syntax on
"  set hlsearch
"endif

filetype plugin on
"filetype plugin indent on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

"--------------------------------------
" Key mapping
"--------------------------------------
imap <Nul> <C-p>

