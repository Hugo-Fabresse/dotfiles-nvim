--
-- file name:
-- lazydev.lua
--

local ok, lazydev = pcall(require, "lazydev")
if not ok then
  return
end

lazydev.setup({
  library = {
    -- Neovim libuv bindings
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },

    -- Lazy / LazyVim ecosystem
    { path = "LazyVim", words = { "LazyVim" } },
    { path = "lazy.nvim", words = { "LazyVim" } },

    -- Optional: snacks.nvim if you use it
    { path = "snacks.nvim", words = { "Snacks" } },
  },
})

-- EOF

