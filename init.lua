-- ============================================================
-- Nihil.nvim — Configuration
-- ============================================================

-- Plugins (packer)
require("nihil.plugins")

-- Core
require("nihil.options")
require("nihil.keymaps")
require("nihil.colorscheme")
require("nihil.minipairs")

-- UI
require("nihil.snacks")
require("nihil.lualine")
require("nihil.bufferline")
require("nihil.nvimtree")
require("nihil.telescope")
require("nihil.edgy")
require("nihil.noice")
require("nihil.image")
require("nihil.padding")

-- Dev
require("nihil.lazydev")
require("nihil.lsp")
require("nihil.treesitter")
require("nihil.luasnip")
require("nihil.completion")

-- Git
require("nihil.gitsigns")
require("nihil.git")

