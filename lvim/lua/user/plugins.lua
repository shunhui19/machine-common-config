local M = {}

M.config = function()

end
lvim.plugins = {
    -- Tokyonight theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- Oceanic-next theme
    {
        "mhartington/oceanic-next",
        priority = 1000,
        lazy = lvim.colorscheme ~= "OceanicNext",
    },

    -- Hop
    {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function()
            require("hop").setup()
            vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
            vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
        end,
    },

    -- SymbolsOutline
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require('symbols-outline').setup()
        end
    },

    -- Fidget
    {
        "j-hui/fidget.nvim",
        version = "v1.0.0",
        config = function()
            require('fidget').setup()
        end
    },

    -- Neoscroll
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to run before the scrolling animation starts
                post_hook = nil,             -- Function to run after the scrolling animation ends
            })
        end
    },

    -- Crates
    {
        "saecki/crates.nvim",
        version = "v0.3.0",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("crates").setup()
        end,
    },

    --Bqf
    {
        "kevinhwang91/nvim-bqf",
        event = { "BufRead", "BufNew" },
        config = function()
            require("bqf").setup({
                auto_enable = true,
                preview = {
                    win_height = 12,
                    win_vheight = 12,
                    delay_syntax = 80,
                    border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
                },
                func_map = {
                    vsplit = "",
                    ptogglemode = "z,",
                    stoggleup = "",
                },
                filter = {
                    fzf = {
                        action_for = { ["ctrl-s"] = "split" },
                        extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
                    },
                },
            })
        end,
    },

    -- ctrlsf search strings and replace
    {

        'dyng/ctrlsf.vim',
    },

    -- Codeium completion...
    -- {
    --     'Exafunction/codeium.vim'
    -- },

    -- lsp_signature
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user.plugins_config.lsp_signature").config()
        end,
        event = { "BufRead", "BufNew" },
    },

    -- -- noice
    -- {
    --     "folke/noice.nvim",
    --     enabled = true,
    --     lazy = true,
    --     event = { "BufRead", "BufNewFile" },
    --     dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
    --     config = function()
    --         require("noice").setup({
    --             lsp = {
    --                 progress = {
    --                     enabled = false,
    --                 },
    --             },
    --             presets = {
    --                 bottom_search = false,
    --                 command_palette = true,
    --                 long_message_to_split = true,
    --                 inc_rename = false,
    --                 lsp_doc_border = true,
    --             },
    --             messages = {
    --                 enabled = true,
    --                 view = "notify",
    --                 view_error = "notify",
    --                 view_warn = "notify",
    --                 view_history = "messages",
    --                 view_search = "virtualtext",
    --             },
    --             health = {
    --                 checker = false,
    --             },
    --         })
    --     end,
    -- },

    -- Rust-tools
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("language.rust")
        end
    },

    -- Go-tools
    {
        "olexsmir/gopher.nvim",
        "leoluz/nvim-dap-go",
        config = function()
            require("language.go")
        end
    },

    -- Marks
    {
        "chentoast/marks.nvim",
        lazy = true,
        event = { "User FileOpened" },
        config = function()
            require("marks").setup({
                default_mappings = true,
                -- builtin_marks = { ".", "<", ">", "^" },
                cyclic = true,
                force_write_shada = false,
                refresh_interval = 250,
                sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
                excluded_filetypes = {
                    "qf",
                    "NvimTree",
                    "toggleterm",
                    "TelescopePrompt",
                    "alpha",
                    "netrw",
                },
                bookmark_0 = {
                    -- sign = "",
                    sign = "⚑",
                    virt_text = "hello world",
                    annotate = false,
                },
                mappings = {},
            })
        end,
    },
}

return M
