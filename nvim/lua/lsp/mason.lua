local servers = {
  "lua_ls",
  "clangd",
  --"tsserver",
  "ts_ls",
  "cssls",
  "pyright",
  "cmake",
  "gopls",
  "lemminx",
  "emmet_ls",
  "emmet_language_server"
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = require('cmp_nvim_lsp').on_attach

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end


require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local opts = {}
for _, server in pairs(servers) do
  opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
