local M = {}

M.config = function()

end

lvim.builtin.treesitter.auto_install = true
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.matchup.enable = true

return M
