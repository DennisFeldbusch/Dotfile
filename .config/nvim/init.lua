require('plugins')
require('keys')
require('lsp')
require('treesitter')
require('file-browser')

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {"./*.aux","./*.old"},
        sorting_strategy = "ascending",
    },
}

require("mason-tool-installer").setup {
  auto_update = false,
  run_on_start = true,
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
vim.cmd([[colorscheme gruvbox]])
vim.cmd [[highlight! link CmpItemMenu GruvboxYellow]]
vim.cmd [[highlight! link CmpItemAbbrMatch Constant]]

vim.cmd([[
hi default link BqfPreviewFloat Normal
hi default link BqfPreviewBorder FloatBorder
hi default link BqfPreviewTitle Title
hi default link BqfPreviewThumb PmenuThumb
hi default link BqfPreviewSbar PmenuSbar
hi default link BqfPreviewCursor Cursor
hi default link BqfPreviewCursorLine CursorLine
hi default link BqfPreviewRange IncSearch
hi default link BqfPreviewBufLabel BqfPreviewRange
]])

-- set autoindent
vim.o.autoindent = true

-- set incsearch
vim.o.incsearch = true

-- set nohlsearch
vim.o.hlsearch = false

vim.g.backup = false
vim.g.writebackup = false

vim.g.loaded_python3_provider = 1

vim.opt.completeopt = "menu,menuone,noinsert,noselect"

vim.cmd([[
au VimEnter * syntax region Statement start='\\ref{' end='}' transparent contains=myStart,myEnd
au VimEnter * syntax match myStart '\\ref{\ze\w\+' contained conceal cchar=[
au VimEnter * syntax match myEnd '\(\\ref{\w\+\)\@<=\zs}' contained conceal cchar=]

au VimEnter * hi! link Conceal Statement
au VimEnter * set conceallevel=2
]])





