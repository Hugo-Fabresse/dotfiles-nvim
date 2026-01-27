--
-- File name:
-- lsp.lua
--

-- Mason
local ok_mason, mason = pcall(require, "mason")
if ok_mason then
  mason.setup()
end

local ok_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")
if ok_mason_lsp then
  mason_lsp.setup({
    ensure_installed = {
      "lua_ls",
      "pyright",
      "ts_ls",
      "rust_analyzer",
      "clangd",
    },
  })
end

-- Capabilities pour nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Configuration des serveurs avec la nouvelle API vim.lsp.config
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  },
  pyright = {},
  ts_ls = {},
  rust_analyzer = {},
  clangd = {},
}

-- Setup avec vim.lsp.config (nouvelle méthode)
for server, config in pairs(servers) do
  config.capabilities = capabilities
  
  -- Utiliser vim.lsp.config au lieu de lspconfig
  vim.lsp.config(server, config)
  vim.lsp.enable(server)
end

-- Keymaps LSP
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

-- EOF

