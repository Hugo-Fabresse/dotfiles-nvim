-- 
-- File name:
-- luasnip.lua
--

vim.cmd [[packadd LuaSnip]]

local ok, luasnip = pcall(require, "luasnip")
if not ok then return end

-- Charger les snippets Lua (avec chemin absolu)
local snippet_path = vim.fn.stdpath("config") .. "/lua/snippets"
require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_path })

-- Configuration de LuaSnip
luasnip.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
})

-- Mappage Tab/S-Tab pour LuaSnip SANS conflit avec nvim-cmp
vim.keymap.set({"i", "s"}, "<Tab>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        -- Fallback : insère une vraie tabulation
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, { silent = true })

vim.keymap.set({"i", "s"}, "<S-Tab>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", false)
    end
end, { silent = true })

-- EOF

