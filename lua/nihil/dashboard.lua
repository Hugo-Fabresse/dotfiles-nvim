--
-- File name:
-- dashboard.lua
--

local ok, alpha = pcall(require, 'alpha')
if not ok then return end

local dashboard = require('alpha.themes.dashboard')

-- Logo ASCII personnalisé
local logo = [[
    ███╗   ██╗██╗██╗  ██╗██╗██╗     
    ████╗  ██║██║██║  ██║██║██║     
    ██╔██╗ ██║██║███████║██║██║     
    ██║╚██╗██║██║██╔══██║██║██║     
    ██║ ╚████║██║██║  ██║██║███████╗
    ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝╚══════╝
]]

dashboard.section.header.val = vim.split(logo, "\n")

-- Boutons du dashboard
dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("p", "  File browser", function()
        require("telescope").extensions.file_browser.file_browser({
            path = vim.loop.cwd(),
            cwd = vim.loop.cwd(),
            grouped = true,
            hidden = true,
        })
    end),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("g", "  LazyGit", ":LazyGit<CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer avec info
local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins or {})
    local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
    return datetime .. "   " .. total_plugins .. " plugins"
end

dashboard.section.footer.val = footer()

-- Styles
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"

for _, button in ipairs(dashboard.section.buttons.val) do
    button.opts.hl = "AlphaButtons"
    button.opts.hl_shortcut = "AlphaShortcut"
end

-- Configuration finale
dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.config)

-- Désactiver certaines options dans le dashboard
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        vim.opt_local.foldenable = false
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.cursorline = false
    end,
})

-- Ouvrir le dashboard au démarrage si aucun fichier
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(data)
        -- Si un fichier est spécifié, ne rien faire
        local is_file = data.file ~= "" and vim.fn.isdirectory(data.file) == 0
        if is_file then
            return
        end

        -- Si un dossier est spécifié
        local is_dir = data.file ~= "" and vim.fn.isdirectory(data.file) == 1
        if is_dir then
            vim.cmd.cd(data.file)
            -- Ouvrir NvimTree mais pas le dashboard
            vim.defer_fn(function()
                require("nvim-tree.api").tree.open()
            end, 10)
            return
        end

        -- Aucun argument : ouvrir le dashboard
        local buf = vim.api.nvim_get_current_buf()
        local buf_name = vim.api.nvim_buf_get_name(buf)
        
        -- Si buffer vide, ouvrir alpha
        if buf_name == "" then
            vim.defer_fn(function()
                require("alpha").start()
            end, 10)
        end
    end,
})

-- EOF

