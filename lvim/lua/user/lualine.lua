local M = {}
M.config = function()

end

-- lualine "default", "lvim" or "none"
lvim.builtin.lualine.style = "lvim"
-- lvim.builtin.lualine.options.theme = "gruvbox"
-- local components = require("lvim.core.lualine.components")
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
        }
    end
end
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.sections.lualine_b = { 'branch', { 'diff', source = diff_source } }
lvim.builtin.lualine.sections.lualine_c = {
    {
        function()
            return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
    },
}

return M
