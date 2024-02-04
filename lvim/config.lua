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

