set term=screen-256color
execute pathogen#infect()
filetype plugin indent on
au BufNewFile,BufRead *.pdf set filetype=eruby.html
set backspace=indent,eol,start
syntax enable
set background=light
colorscheme solarized
"
" Gutter
set number
set relativenumber
set cursorline

" Tabbing
set expandtab
set tabstop=2
set shiftwidth=2

" File searching
set wildmode=longest,full
set wildmenu
runtime macros/matchit.vim
set nocompatible

" Searching
set hlsearch
set ignorecase
set smartcase

" Turbux Configuration
let g:turbux_command_prefix = 'zeus'
let g:VimuxHeight = '40'
let g:VimuxOrientation = 'h'

" Ruby Configuration
syn match rubyBoolean "\<\%(true\|false\|&&\|||\|!\)\>[?!]\@!"

" Go Configuration
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" Markdown Configuration
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END
let g:vim_markdown_math=1 " Work with LaTeX math
let g:vim_markdown_frontmatter=1 " Recognize Jekyll Frontmatter

" Highlight trailing whitespace and spaces before tabs
highlight TrailingWhitespace ctermbg=darkred guibg=darkred
let w:m2=matchadd('TrailingWhitespace', '\s\+$\| \+\ze\t')
