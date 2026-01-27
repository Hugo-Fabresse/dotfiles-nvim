--
-- File name:
-- lualine.lua
--

local ok, lualine = pcall(require, 'lualine')
if not ok then 
  vim.notify("lualine not found", vim.log.levels.WARN)
  return
end

-- Couleurs Tokyo Night
local colors = {
  blue   = '#7aa2f7',
  cyan   = '#7dcfff',
  black  = '#1a1b26',
  white  = '#c0caf5',
  red    = '#f7768e',
  violet = '#bb9af7',
  grey   = '#3b4261',
  dark   = '#16161e',
}

local nihil_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet, gui = 'bold' },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.dark },
  },
  insert = { 
    a = { fg = colors.black, bg = colors.blue, gui = 'bold' } 
  },
  visual = { 
    a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } 
  },
  replace = { 
    a = { fg = colors.black, bg = colors.red, gui = 'bold' } 
  },
  inactive = {
    a = { fg = colors.grey, bg = colors.dark },
    b = { fg = colors.grey, bg = colors.dark },
    c = { fg = colors.grey, bg = colors.dark },
  },
}

lualine.setup({
  options = {
    theme = nihil_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },

  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },

    lualine_b = {
      'branch'
    },

    lualine_c = {
      '%=',
    },

    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        symbols = { error = '✖ ', warn = '⚠ ', info = "i" },
        colored = true,
      },
      {
        'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
      },
    },

    lualine_y = {},

    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },

  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },

  tabline = {},
  extensions = { 'nvim-tree', 'fugitive' },
})

-- EOF

