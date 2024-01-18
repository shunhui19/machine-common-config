-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Neovim
-- =======================
lvim.leader = ","
lvim.log.level = "error"
lvim.format_on_save = {
    enabled = true,
}
lvim.reload_config_on_save = false
-- lvim.builtin.which_key.setup.plugins.presets.z = true

-- Neovim
-- =======================
require("user.neovim").config()

-- Builtin
-- =======================
require("user.builtin").config()

-- Additional plugins
-- =======================
require("user.plugins").config()

-- Additional keybindings
-- =======================
require("user.keybindings").config()

-- Theme
-- =======================
require("user.theme").config()

-- Lualine
-- =======================
require("user.lualine").config()


-- Rust config
-- =======================
require("user.language.rust").config()
