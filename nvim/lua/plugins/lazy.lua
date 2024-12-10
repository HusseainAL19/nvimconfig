-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "nvim-tree/nvim-web-devicons" },
    { "folke/todo-comments.nvim",       opts = {} },
    { 'nvim-treesitter/nvim-treesitter' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'saadparwaiz1/cmp_luasnip' },
    { "williamboman/mason.nvim" },
    { "catppuccin/nvim",                name = "catppuccin", priority = 1000 },
    { "rebelot/kanagawa.nvim" },
    { "ellisonleao/gruvbox.nvim",       priority = 1000,     config = true,  opts = ... },
    "nvim-tree/nvim-web-devicons",
    --usefull
    "nvim-lua/plenary.nvim",
    "rafamadriz/friendly-snippets",
    --auto pars
    { 'windwp/nvim-autopairs',   event = "InsertEnter", opts = {} },
    -- comment
    { 'numToStr/Comment.nvim',   opts = {},             lazy = false, },
    -- buffer line
    { 'akinsho/bufferline.nvim', version = "*",         dependencies = 'nvim-tree/nvim-web-devicons' },
    --bar bar
    "romgrk/barbar.nvim",
    -- git signs
    "lewis6991/gitsigns.nvim",
    --indent lines
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- lua line
    "nvim-lualine/lualine.nvim",
    -- nvim tree
    "nvim-tree/nvim-tree.lua",
    --telescope
    { "nvim-telescope/telescope.nvim" },
    -- fromatting
    "jose-elias-alvarez/null-ls.nvim",
    -- transparents
    { "xiyaowong/transparent.nvim" },
    { 'akinsho/toggleterm.nvim',   version = "*", config = true },
    -- import your plugins
    -- { import = "plugins" },
    {"windwp/nvim-ts-autotag"}
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
