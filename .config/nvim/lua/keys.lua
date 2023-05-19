-- set leader to , 
vim.g.mapleader = ","
--
-- change pane with tab
vim.api.nvim_set_keymap('n', '<TAB>', '<C-W><C-W>', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-f>', '<ESC>ggVG<CR>', {noremap = true, silent = true})

-- Telescope keybindings
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>ft', ':Telescope live_grep<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope git_files<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<leader>fc', ':Telescope commands<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})


-- line movement

vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-j>', "<esc>:m .+1<CR>==", {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-k>', "<esc>:m .-2<CR>==", {noremap = true, silent = true})

-- allow W command 'cause I can't type
vim.api.nvim_set_keymap('', 'W', 'w', {noremap = true, silent = true})

vim.cmd(":command! W w")
vim.cmd(":command! Q q")
vim.cmd(":command! WQ wq")
vim.cmd(":command! Wq wq")
