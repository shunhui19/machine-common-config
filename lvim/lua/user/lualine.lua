local M = {}
M.config = function()

end

-- lualine "default", "lvim" or "none"
lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.options.theme = "gruvbox"
-- local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.sections.lualine_b = { 'branch', 'diff' }
lvim.builtin.lualine.sections.lualine_c = {
    {
        function()
            return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
    },
}

return M
