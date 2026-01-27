--
-- File name:
-- edgy.lua
--

local ok, edgy = pcall(require, 'edgy')
if not ok then return end

edgy.setup({
    bottom={{ft="noice", size={height=0.4}, filter=function(_,win) return vim.api.nvim_win_get_config(win).relative=="" end}},
    left={{title="Files", ft="NvimTree", size={width=35}, pinned=true, open=function() require("nvim-tree.api").tree.open() end}},
    options={left={size=35}, bottom={size=10}, right={size=30}, top={size=10}},
    animate={enabled=false},
    wo={winbar=true, winfixwidth=true, winhighlight="WinBar:EdgyTitle", signcolumn="no"}
})

-- EOF

