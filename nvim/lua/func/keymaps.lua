local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
--local builtin = require("telescope.builtin")

-- nvim tree

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- insert mode
keymap("i", "jk", "<ESC>", opts)


---- normal mode -----
--buffer line
keymap("n", "<S-l>", ":BufferNext<CR>", opts)
keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
keymap("n", "<Space>c", "<Cmd>BufferClose<CR>", opts)
--formating
keymap("n", "<space>lf", ":lua vim.lsp.buf.format()<CR>", opts)

-- nvim tree
keymap("n", "<Space>e", ":NvimTreeToggle<CR>", opts)

--navigate between things
keymap("n", "<C-h>", ":wincmd h<CR>", opts)
keymap("n", "<C-l>", ":wincmd l<CR>", opts)
keymap("n", "<C-j>", ":wincmd j<CR>", opts)
keymap("n", "<C-k>", ":wincmd k<CR>", opts)

keymap("n", "<S-j>", ":+10 <CR>", opts)
--keymap("n", "<S-k>", ":-10 <CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
-- custom mappings
--vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, optst('Up'))

--telescopte
keymap("n", "<Space>f", ":Telescope find_files<CR>", opts)
--keymap("n", "<Space>fg", ":Telescope live_grep<CR>", opts)
--keymap("n", "<Space>fb", ":Telescope buffers<CR>", opts)
