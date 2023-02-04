require('plugins')
require('keys')
require('lsp')
require('treesitter')
require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"./*.aux","./*.old"},
        sorting_strategy = "ascending",
    }
}


-- set options
vim.o.syntax = true
vim.o.exrc = true
vim.o.wrap = true
vim.o.encoding = "UTF-8"
vim.o.guicursor = ""

-- show line numbers
vim.o.number = true

-- set tab options
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- set scroll options
vim.o.scrolloff = 8
vim.o.ma = true

-- set relative line numbers
vim.o.relativenumber = true

-- set colorscheme
vim.cmd("colorscheme gruvbox")

-- set autoindent
vim.o.autoindent = true

-- set incsearch
vim.o.incsearch = true

-- set nohlsearch
vim.o.hlsearch = false

-- nerdtree ignore files
vim.cmd([[
let NERDTreeIgnore = ['\.out$','\.aux','\.bbl','\.sty','\.blg','\.fls','\.log','\.synctex.gz','\.fdb_latexmk','\.toc','\.run.xml']

]])
