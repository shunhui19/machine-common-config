local M = {}

M.config = function()

end

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Open recently projects
-- =======================
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }


-- Trouble
-- =======================
lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- Marks
-- =======================
lvim.builtin.which_key.mappings["m"] = {
    name = "+Marks",
    a = { "<cmd>MarksListAll<CR>", "Show All Marks" },
    b = { "<cmd>MarksListBuf<CR>", "Show Marks in Buffer" },
    g = { "<cmd>MarksListGlobal<CR>", "Show Marks Global" },
}


return M
