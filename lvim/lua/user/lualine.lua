local M = {}

M.config = function()

end

lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.options.theme = "gruvbox"
lvim.builtin.lualine.sections.lualine_a = { 'mode' }
lvim.builtin.lualine.sections.lualine_b = { 'branch' }
lvim.builtin.lualine.sections.lualine_c = {
    {
        function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        end,
    },
}

return M
