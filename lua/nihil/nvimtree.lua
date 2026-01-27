--
-- File name:
-- nvimtree.lua
--

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then return end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,

    update_focused_file = {
        enable = true,
        update_root = true,
    },

    view = {
        width = 35,
        side = "left",
        float = { enable = false },
    },

    renderer = {
        highlight_git = true,
        indent_markers = { enable = true },
        icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
    },

    filters = { dotfiles = false },

    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = { enable = true },
        },
    },

    git = { enable = true, ignore = false },
})

------------------------------------------------------------
-- Toggle focus between buffer <-> tree
------------------------------------------------------------
local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", function()
    if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p")   -- return to previous window
    else
        api.tree.find_file({ open = true, focus = true })
    end
end, { silent = true, noremap = true })

-- EOF

