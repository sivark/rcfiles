set showmode "Show the current mode? YES!
set nocompatible
set autoindent
set tabstop=4
set shiftwidth=2
set ignorecase
set smartcase
syntax on
"set spell

" Enable the mouse!
set mouse=a

set autowrite
"Automatically write the contents of the buffer if one changes buffer


"==================================================
" Line numbering: absolute or relative to cursor position
"==================================================
set number
" set relativenumber

set showmatch
set incsearch
set hlsearch!
" Search highlighting and removing
nnoremap <F3> :set hlsearch!<CR>

set report=0 "show all changes!
set showcmd "Show current uncompleted command?  Absolutely!
"OmniCppComplete options
"map <C-Z> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" The leader key give you your own namespace for keyboard shortcuts
" timeoutlen sets the timeout for how many milliseconds after the leader key
" Vim waits for your shortcuts. By default it's 1000ms
let mapleader=","
"set timeoutlen=1000ms

"==================================================
" Commenting code in blocks
"==================================================

" ,/ C/C++/C#/Java // comments
map ,/ :s/^/\/\//<CR>

" ,< HTML comment
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR><Esc>:nohlsearch<CR>


"==================================================
" Folding
"==================================================

" Toggle fold state between closed and opened. 
" If there is no fold at current line, just moves forward. 
" If it is present, reverse it's state. 
fun! ToggleFold() 
  if foldlevel('.') == 0 
	normal! l 
  else 
	if foldclosed('.') < 0 
	  . foldclose 
	else 
	  . foldopen 
	endif 
  endif 
  " Clear status line 
  echo 
endfun 

" Map this function to Space key. 
noremap <space> :call ToggleFold()<CR>

augroup END

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


"==================================================
" Multiple tabs
"==================================================

"map <C-S-]> gt
"map <C-S-[> gT

" Adding keybinding for tab usage, in normal mode
map <C-n> :tabnew<CR>
"map <C-w> :q<CR>


"==================================================
" Soft wrap
"==================================================
set wrap linebreak textwidth=0

" Making vim move by display line, rather than line numbers
" helpful when lines(nos) are wrapped(display)
map <Up> gk
map <Down> gj
map <End> g$
map <Home> g0

"==================================================
" Vim-PLUG
"==================================================

call plug#begin('~/.vim/plugged')

Plug 'chrisbra/Recover.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'


call plug#end()

""==================================================
"" VUNDLE
""==================================================
"
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
"
"" let Vundle manage Vundle  " required! 
"Bundle 'gmarik/vundle'
"
"" " My Bundles here:
"" "
"" " original repos on github
""Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'ap/vim-css-color'
"Bundle 'altercation/vim-colors-solarized'
"Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/nerdtree'
"Bundle 'jistr/vim-nerdtree-tabs'
"Bundle 'rstacruz/sparkup'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-surround'
"Bundle 'mikewest/vimroom'
"Bundle 'vim-pandoc/vim-pandoc'
""Bundle 'vim-pandoc/vim-pandoc-extras'
""Bundle 'fmoralesc/panbeamer'
""Bundle 'tpope/vim-git'
""Bundle 'scrooloose/syntastic'
"
""Bundle 'vim-scripts/xoria256.vim'
"
"
"" " vim-scripts repos
""Bundle 'LanguageTool' " Installed through AUR
"
"" Bundle 'L9'
"" Bundle 'FuzzyFinder'
"" " non github repos
""Bundle 'git://git.wincent.com/command-t.git'
"
" Indentation based on filetype
filetype plugin indent on     " required! (for Vundle?)


"==================================================
" Vim airline/powerline configurations
"==================================================
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

let g:airline_theme='dark'
set ttimeoutlen=50
set noshowmode
let g:airline#extensions#whitespace#show_message = 0
let g:airline_symbols={}
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.linenr = '|'
let g:airline#extensions#tabline#enabled = 1
" use below if line/col is getting painful
let g:airline_section_b='[%P%:%4l:%c]'
let g:airline_section_z='%F'
set statusline=%F%m%r%h%w\ [%l,%v\ %p%%]\ [LEN=%L]\ [%Y]\ [%{&ff}]
set statusline+=(%{WordCount()})\



"==================================================
" Colorscheme 
"==================================================

"colorscheme default 

"==================================================
" Solarized Colorscheme Config
"==================================================

" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"
" ------------------------------------------------------------------
syntax enable
" set background=light
" colorscheme solarized
colorscheme default
" ------------------------------------------------------------------
" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_hitrail=0
" let g:solarized_menu=1


"==================================================
" Text Wrapping
"==================================================
"
""(normal options)
""set formatoptions=cq
""set wrapmargin=72
""set textwidth=72
"" Highlight characters past 80 columns
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
"  autocmd BufEnter * match OverLength /\%100v.*/


"==================================================
" Miscellaneous
"==================================================

"Disabling arrow keys
"if you want to practice using h,j,k,l in the normal mode
"inoremap <Up>      <NOP>
"inoremap <Down>    <NOP>
"inoremap <Left>    <NOP>
"inoremap <Right>   <NOP>
"noremap <Up>       <NOP>
"noremap <Down>     <NOP>
"noremap <Left>     <NOP>
"noremap <Right>    <NOP>

" In command mode, when you end up typing capitals :P
cabbrev W write
cabbrev Q quit

" To stop backup and tmp files from cluttering working directories
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

"" Show classes and functions in a separate window with F8
"" For the taglist.vim plugin
"nnoremap <silent> <F8> :Tlist<CR>
"set tags=./tags;tags;/
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'


" Counting the total number of words in the currently open file 
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim/
function! WordCount()
  if &modified || !exists("b:wordcount")
    let l:old_position = getpos('.')
    let l:old_status = v:statusmsg
    execute "silent normal g\<c-g>"
    if v:statusmsg == "--No lines in buffer--"
      let b:wordcount = 0
    else
      let b:wordcount = str2nr(split(v:statusmsg)[11])
      let v:statusmsg = l:old_status
    endif
    call setpos('.', l:old_position)
    return b:wordcount
  else
    return b:wordcount
  endif
endfunction


let g:NERDTreeWinPos = "right"
"let g:nerdtree_tabs_open_on_gui_startup = 1
"let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_smart_start_focus = 0

"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Select all text
map <C-a> <esc>ggVG<CR>

"==================================================
"Autosave on FocusLost
"==================================================

:au FocusLost * silent! wa


