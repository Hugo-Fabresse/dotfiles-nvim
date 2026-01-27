--
-- File name:
-- noice.lua
--

local ok, noice = pcall(require, "noice")
if not ok then return end

noice.setup({
  lsp = {
    progress = { enabled = false },
    hover = { enabled = true },
    signature = { enabled = true },
  },

  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", icon = " " },
      search_up = { kind = "search", icon = " " },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
    },
  },

  views = {
    cmdline_popup = {
      position = {
        row = "8%",
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = {
          Normal = "NormalFloat",
          FloatBorder = "FloatBorder",
        },
      },
    },
  },

  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
})

-- Notify (branché à Noice)
local ok_notify, notify = pcall(require, "notify")
if ok_notify then
  notify.setup({
    timeout = 3000,
    render = "minimal",
    stages = "fade",
    fps = 30,
  })
  vim.notify = notify
end

-- EOF

