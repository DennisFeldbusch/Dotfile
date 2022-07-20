let mapleader = ","
call plug#begin('~/.vim/plugged')
Plug 'sudar/comments.vim'
Plug 'gko/vim-coloresque'
Plug 'dansomething/vim-eclim', { 'for': 'java' }
Plug 'github/copilot.vim'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'puremourning/vimspector'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'tpope/vim-fugitive'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'voldikss/vim-floaterm'
Plug 'yaegassy/coc-intelephense', {'do': 'yarn install --frozen-lockfile'}
call plug#end()
"-------------------------------------------"
let mapleader = "," " map leader to comma

set nocompatible
syntax on
set exrc
set wrap
set encoding=UTF-8
set  guicursor=
" Show linenumbers
set number
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=8
set ma
set nohlsearch

set relativenumber

colorscheme gruvbox

set autochdir

let g:dashboard_default_executive ='telescope'
let g:vimspector_enable_mappings = 'HUMAN'

map <Tab> <C-W>W:cd %:p:h<CR>:<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-c> :NvimTreeClose<CR>



" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Moving text remaps
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
xmap rn <Plug>(coc-rename)

" Remap for format selected region
xmap f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" move indent when enter is pressed
set autoindent
" show matching brackets
" set showmatch
" searching
set incsearch
" key binding to turn off search highlighting
nnoremap - +
nnoremap + -
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q 

:let &makeprg = "g++ -g -std=c++11 *.cpp -o out"
nnoremap <C-f> <Esc>ggVG<CR>

let NERDTreeIgnore = ['\.out$','\.aux','\.bbl','\.sty','\.blg','\.fls','\.log','\.synctex.gz','\.fdb_latexmk','\.toc','\.run.xml']

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

let g:vimwiki_key_mappings = { 'table_mappings': 0 }

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope git_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"./*.aux","./*.old"},
        sorting_strategy = "ascending",
        }
}
EOF

let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_posix_standard = 1

command Rest execute "CocCommand rest-client.request"

let g:floaterm_keymap_toggle = '<C-m>'
