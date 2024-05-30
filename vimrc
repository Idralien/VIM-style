syntax on

"-- HEADER42
"-- TABS

set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
set smarttab
set expandtab

"-- CURSOR

set cursorline
set number
set scrolloff=8
set signcolumn=yes
set mouse=a

"-- WRITTEN STYLE

set ignorecase
set smartcase
set incsearch
set hlsearch
nnoremap <CR> :noh<CR><CR>:<backspace>

"-- VIM PLUGINS

"so ~/.vim/plugins.vim
"so ~/.vim/plugin-config.vim
"so ~/.vim/autoclose.vim

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'yggdroot/indentline'

call plug#end()

"PlugInstall
"PlugUpdate
"PlugStatus
"PlugClean
"PlugUpgrade

let g:coc_disable_startup_warning = 1

"-- PLUGIN COMMANDS & EXTRAS

"       Nerdtree
"(command) Explore or Vexplore

nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
set wildignore+=*.DS_Store,*.min.*
      " Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
      " Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"       Commentary
"(command) gcc or gc
"(command) gc5j

"      Surround
"(command) ysw + character
"(command) ysw( or ysw) || ysw{ or ysw} || ysw[ or ysw]
"(command) ys5w
"(command) S + character
"(command) cs + character(you want changed) + character(you want to change
"into)
"(command) ds + character(deletes character)

"       FZF & FZF.VIM
"(command) fzf

"       IndentLine

let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '|'

"       KITE CONFIG
" let g:kite_supported_languages = ['python', 'javascript', 'go']

let g:kite_supported_languages = []

"       ALE CONFIG

let g:ale_disable_lsp = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}

"       AIRLINE CONFIG

let g:airline_powerline_fonts=1

"       ULTISNIPS CONFIG

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsListSnippets="<c-l>"

"       TAGBAR CONFIG

nmap <F8> :TagbarToggle<CR>
      " Extend .jsx support
let g:tagbar_type_javascriptreact = {
 \ 'ctagstype': 'javascript',
 \ 'kinds': [
       \ 'A:array',
       \ 'P:property',
       \ 'T:tags',
       \ 'O:objects',
       \ 'g:generator functions',
       \ 'f:functions',
       \ 'c:classes',
       \ 'm:methods',
       \ 'V:variables',
       \ 'I:imports',
       \ 'E:exports',
       \ 's:styled components'
 \ ]}

"       THEMES

 " set termguicolors
 " let g:gruvbox_italic=1
 " colorscheme gruvbox
 " set background=dark
 " hi Normal guibg=NONE ctermbg=NONE
 " let g:terminal_ansi_colors = [
 "     \ '#282828', '#cc241d', '#98971a', '#d79921', '#458588', '#b16286', '#689d6a', '#a89984',
 "     \ '#928374', '#fb4934', '#b8bb26', '#fabd2f', '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
 " \]


"set termguicolors 
"set background=dark
"colorscheme onedark
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

"set termguicolors
"set background=dark
"colorscheme solarized
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

"set termguicolors
"set background=dark
"colorscheme goodwolf
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

"set termguicolors
"set background=dark
"colorscheme pencil
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

"set termguicolors
"set background=dark
"colorscheme space_vim_theme

"set termguicolors
"set background=dark
"colorscheme vim-monokai-tasty
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

"set background=dark
"colorscheme wildcharm
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction

set termguicolors
set background=dark
colorscheme synthwave84
" " Returns true if the color hex value is light
" function! IsHexColorLight(color) abort
"   let l:raw_color = trim(a:color, '#')
"   let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)
"   let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
"   let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)
"   let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000
"   return l:brightness > 155
" endfunction
