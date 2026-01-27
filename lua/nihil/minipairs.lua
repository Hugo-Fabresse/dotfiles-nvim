--
-- File name:
-- minipairs.lua
--

local ok, minipairs = pcall(require, "mini.pairs")
if not ok then
  return
end

minipairs.setup({
  modes = {
    insert = true,
    command = true,
    terminal = false,
  },

  -- Ne pas auto-pair si le caractère suivant est "logique"
  skip_next = [=[[%w%%%'%[%"%.%`%$]]=],

  -- Ne pas auto-pair dans les strings (Treesitter)
  skip_ts = { "string" },

  -- Évite les fermetures en trop
  skip_unbalanced = true,

  -- Meilleur comportement en markdown
  markdown = true,
})

-- EOF

