vim.opt.termguicolors = true
require("bufferline").setup({
  options = {
    indicator_icon = "▎",
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
  },
})
