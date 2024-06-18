local M = {}

M.config = function()

end

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:blinkwait10-blinkon400-blikoff300"
-- vim.opt.wrap = true
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.termguicolors = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 250
vim.opt.redrawtime = 1500
vim.opt.ttimeoutlen = 10
vim.opt.wrapscan = true
vim.o.secure = true
vim.o.sessionoptions = "buffers,curdir,folds,globals,help,tabpages,winpos,winsize"
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 4
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1
vim.opt.guifont = "FiraCode Nerd Font:h15"
vim.opt.cmdheight = 1
vim.g.dashboard_enable_session = 0
vim.g.dashboard_disable_statusline = 1
vim.opt.pumblend = 10
vim.opt.joinspaces = false
vim.opt.list = true

vim.opt.wildignore = {
    "*.aux,*.out,*.toc",
    "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
    -- media
    "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
    "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
    "*.eot,*.otf,*.ttf,*.woff",
    "*.doc,*.pdf",
    -- archives
    "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
    -- temp/system
    "*.*~,*~ ",
    "*.swp,.lock,.DS_Store,._*,tags.lock",
    -- version control
    ".git,.svn",
    --rust
    "Cargo.lock,Cargo.Bazel.lock",
}

vim.opt.fillchars = {
    fold = " ",
    eob = " ", -- suppress ~ at EndOfBuffer
    diff = "╱", -- alternatives = ⣿ ░ ─
    msgsep = "‾",
    foldopen = "▾",
    foldsep = "│",
    foldclose = "▸",
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}

-- NOTE: using neo-tree
-- lvim.builtin.nvimtree.active = false


return M
