"""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
" Reference: Godwin Pang - github @godwinpang
"
"""""""""""""""""""""""""""""""""""""""""""""

"""" General
set nocompatible " No compatibility necessary for mappings to work
set noerrorbells " turn off error sounds
set novisualbell " turn off error flash
au FocusLost * :wa " Save upon losing focus

set number " Line numbers ont he left side of the screen
set ruler " Numbers at the bottom of the screen for column and line


"""" Colors
syntax on " Enable syntax highlighting
colorscheme ron
set colorcolumn=81 " Highlight the 81st column
match Error /\%81v.\+/ " Highlight text over 80 characters in red
set showmatch " Highlight matching brackets


"""" Keys
set backspace=indent,eol,start " Set backspace to act like standard text editor
set whichwrap+=<,>,h,l " Set h l and arrow keys to wrap at end of line


"""" Text format
" Indentation
set autoindent " Maintain indentation on newline
set smartindent " Insert new indentation if needed
set expandtab " Use spaces instead of tabs
" Set tab to 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Text wrap
set textwidth=80 " Set length to wrap at 80 chars
set linebreak " Set wrap to insert linebreak
" Comments
set formatoptions=cro


"""" Search settings
set ignorecase " Set search to be case insensitive
set smartcase " Set search to be case sensitive when item has upper case letter


"""" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
     autocmd BufWritePre *.h,*.c,*.cpp,*.java,*.vimrc,*.txt,*.js,*.py,*.wiki,*.sh :       call CleanExtraSpaces()
endif
 
 
"""" Key mappings
inoremap {<CR> {<CR>}<Esc>O
