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
--使用方式：
-- mx：neovim原本的mark方式进行标记，x为标记名。
-- m;：自动对当前行按字母顺序进行小写标记
-- dmx：x为标记名，删除某个标记名
-- mX：X为大写标记名，大写的标记可以跨文件跳转。
lvim.builtin.which_key.mappings["m"] = {
    name = "+Marks",
    a = { "<cmd>MarksListAll<CR>", "Show All Marks" },
    b = { "<cmd>MarksListBuf<CR>", "Show Marks in Buffer" },
    g = { "<cmd>MarksListGlobal<CR>", "Show Marks Global" },
}

-- Persistence
-- =======================
lvim.builtin.which_key.mappings["a"] = {
    name = "+Persistence",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Symbols-outline
-- =======================
--
-- 使用方式：快捷键打开侧栏

-- <leader>oo：打开symbols-outline侧边栏 在侧栏的快捷键：
-- <cr>：回车定位到符号位置，并焦点到目标窗口。
-- o：定位到符号位置，但焦点保留在symbols-outline窗口。
-- <C-space>：显示对应符号的hover窗口
-- K：打开当前符号的预览窗口。
-- r：重命名当前符号
-- a：代码action
-- h：当前光标处折叠
-- l：当前光标处展开
-- P：折叠所有
-- U：展开所有折叠
-- Q：重置折叠
lvim.builtin.which_key.mappings["o"] = {
    name = "Symbols-outline",
    o = { "<cmd>SymbolsOutline<CR>", "Open Symbols Outline" },
    c = { "<cmd>SymbolsOutlineClose<CR>", "Close Symbols Outline" },
}

-- Windows
-- =======================
lvim.builtin.which_key.mappings["z"] = {
    name = "Windows-Resize",
    m = { "<cmd>WindowsMaximize<CR>", "Window Maximize" },
    v = { "<cmd>WindowsMaximizeVertically<CR>", "Window Vertically Maximize" },
    h = { "<cmd>WindowsMaximizeHorizontally<CR>", "Window Horizontally Maximize" },
    e = { "<cmd>WindowsEqualize<CR>", "Window Equalize" },
}


return M
