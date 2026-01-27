--
-- File name:
-- snacks.lua
--

-- Mock complet de lazy.nvim pour Snacks
package.preload["lazy.stats"] = function()
  return {
    stats = function()
      return {
        count = 0,
        loaded = 0,
        startuptime = 0,
      }
    end,
  }
end

local ok, Snacks = pcall(require, "snacks")
if not ok then 
  vim.notify("snacks.nvim not found", vim.log.levels.WARN)
  return 
end

Snacks.setup({
  notifier = { enabled = true },
  input = { enabled = true },
  indent = { enabled = true },
  scroll = { enabled = true },
  words = { enabled = true },

  dashboard = {
    enabled = true,

    -- Désactive les stats de lazy.nvim
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 1 },
	  { 
        text = "────────────────────────────────────────────────────────────",
        padding = 1,
      },
      { section = "projects" },
    },

	preset = {
		        header = [[
███╗   ██╗ ██╗ ██╗  ██╗ ██╗ ██╗     
████╗  ██║ ██║ ██║  ██║ ██║ ██║     
██╔██╗ ██║ ██║ ███████║ ██║ ██║     
██║╚██╗██║ ██║ ██╔══██║ ██║ ██║     
██║ ╚████║ ██║ ██║  ██║ ██║ ███████╗
╚═╝  ╚═══╝ ╚═╝ ╚═╝  ╚═╝ ╚═╝ ╚══════╝
 ]],
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
        { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
  },
})

-- EOF

