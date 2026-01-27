-- 
-- File name:
-- bufferline.lua
--

local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

-- Suppression de buffer propre (équivalent Snacks.bufdelete)
local function bufdelete(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_delete(bufnr, { force = false })
end

bufferline.setup({
  options = {
    mode = "buffers",
    separator_style = "slant",
    show_close_icon = false,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,

    close_command = bufdelete,
    right_mouse_command = bufdelete,

    diagnostics_indicator = function(_, _, diag)
      local ret = ""
      if diag.error then ret = ret .. "E" .. diag.error .. " " end
      if diag.warning then ret = ret .. "W" .. diag.warning end
      return vim.trim(ret)
    end,

    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = true,
      },
    },
  },
})

-- Navigation bufferline (VISUELLE, pas bnext)
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })

-- Déplacement
vim.keymap.set('n','<Tab>', ':bnext<CR>', {silent=true,noremap=true})
vim.keymap.set('n','<S-Tab>', ':bprevious<CR>', {silent=true,noremap=true})

-- Gestion avancée
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { silent = true })
vim.keymap.set("n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", { silent = true })
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", { silent = true })
vim.keymap.set('n','<Leader>x', function()
	local cur = vim.api.nvim_get_current_buf()
	if #vim.fn.getbufinfo({buflisted=1})>1
	then vim.cmd('bnext') end vim.cmd('bdelete '..cur) end, {silent=true,noremap=true})
vim.keymap.set("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { silent = true })

-- EOF

