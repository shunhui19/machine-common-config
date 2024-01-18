local M = {}

M.config = function()

end
lvim.plugins = {
    -- Catppuccin theme
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },

    -- Tokyonight theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- Trouble
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
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
        config = function()
            require('fidget').setup()
        end
    },
    -- Rust-tools
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("language.rust")
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
            require("crates").setup {
                null_ls = {
                    enabled = true,
                    name = "crates.nvim",
                },
                popup = {
                    border = "rounded",
                },
            }
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

    -- indent-blankline
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     event = "BufRead",
    --     config = function()
    --         require("indent_blankline").setup({
    --             -- for example, context is off by default, use this to turn it on
    --             filetype_exclude = { "help", "terminal", "dashboard", "lspinfo" },
    --             buftype_exclude = { "terminal", "dashboard", "nofile", "quickfix" },
    --             show_trailing_blankline_indent = false,
    --             show_first_indent_level = false,
    --             show_current_context = true,
    --             show_current_context_start = true,
    --             show_end_of_line = true,
    --         })
    --     end,
    -- },

    -- todo-comments
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup({
                keywords = {
                    OK = { icon = "✔ ", color = "ok" },
                    ISH = { icon = "☛ ", color = "ish" },
                    BAD = { icon = "✘ ", color = "bad" },
                    TEST = { icon = "⚖ ", color = "test" },
                    FIXJC = { icon = "⚖ ", color = "fixjc" },
                    FIXJCO = { icon = "⚖ ", color = "fixjc" }
                },
                colors = {
                    ok = { "#10B981" },
                    ish = { "#e0e031" },
                    bad = { "#f06981" },
                    test = { "#f02244" },
                    fixjc = { "#ff0000" },
                },
            })
        end,
    },

    "olexsmir/gopher.nvim",
    "leoluz/nvim-dap-go",

    -- ctrlsf search strings and replace
    {

        'dyng/ctrlsf.vim',
    },
    -- Neo-tree
    -- {
    --     "nvim-neo-tree/neo-tree.nvim",
    --     branch = "v2.x",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --         "nvim-tree/nvim-web-devicons",
    --         "MunifTanjim/nui.nvim",
    --     },
    --     config = function()
    --         require("neo-tree").setup({
    --             close_if_last_window = true,
    --             window = {
    --                 width = 30,
    --             },
    --             buffers = {
    --                 follow_current_file = true,
    --             },
    --             filesystem = {
    --                 follow_current_file = true,
    --                 filtered_items = {
    --                     hide_dotfiles = false,
    --                     hide_gitignored = false,
    --                     hide_by_name = {
    --                         "node_modules"
    --                     },
    --                     never_show = {
    --                         ".DS_Store",
    --                         "thumbs.db"
    --                     },
    --                 },
    --             },
    --         })
    --     end
    -- },

    -- Markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    -- Codeium completion...
    {
        'Exafunction/codeium.vim'
    },

    -- lsp_signature
    {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("user.plugins_config.lsp_signature").config()
        end,
        event = { "BufRead", "BufNew" },
    },

    -- twilight
    {
        "folke/twilight.nvim",
        lazy = true,
        config = function()
            require("user.plugins_config.twilight").config()
        end,
    },

    -- nvim-treesitter-context
    {
        "romgrk/nvim-treesitter-context",
        lazy = true,
        event = { "User FileOpened" },
        config = function()
            require("treesitter-context").setup({
                enable = true,
                throttle = true,
                max_lines = 0,
                patterns = {
                    default = {
                        "class",
                        "function",
                        "method",
                    },
                },
            })
        end,
    },

    ---- gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,
            })
        end,
    },

    -- noice
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
}

return M
