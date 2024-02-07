-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- lvim
-- =======================
lvim.leader = ","
lvim.log.level = "error"
lvim.format_on_save = {
    enabled = true,
}
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.colorscheme = "OceanicNext"

-- lualine
-- =======================
lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.options.theme = "gruvbox"
-- local components = require("lvim.core.lualine.components")
-- local function diff_source()
--     local gitsigns = vim.b.gitsigns_status_dict
--     if gitsigns then
--         return {
--             added = gitsigns.added,
--             modified = gitsigns.changed,
--             removed = gitsigns.removed
--         }
--     end
-- end
lvim.builtin.lualine.sections.lualine_a = { 'mode', 'location' }
lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff' }
lvim.builtin.lualine.sections.lualine_c = {
    {
        function()
            return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
    },
}

-- neovim
-- =======================
require("user.neovim").config()

-- plugins
-- =======================
require("user.plugins").config()

-- keybindings
-- =======================
require("user.keybindings").config()

-- theme
-- =======================
require("user.theme").config()

-- lualine
-- =======================
require("user.lualine").config()
