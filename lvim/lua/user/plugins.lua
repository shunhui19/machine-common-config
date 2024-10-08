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
        lazy = true,
        cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
        config = function()
            require('symbols-outline').setup()
        end
    },

    -- goto_preview
    {
        "rmagatti/goto-preview",
        config = function()
            require('goto-preview').setup {
                width = 120,              -- Width of the floating window
                height = 25,              -- Height of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false,            -- Print debug information
                opacity = nil,            -- 0-100 opacity level of the floating window where 100 is fully transparent.
                post_open_hook = nil,     -- A function taking two arguments, a buffer and a window to be ran as a hook.
                -- You can use "default_mappings = true" setup option
                -- Or explicitly set keybindings
                vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>"),
                vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>"),
                vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>"),
            }
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
        lazy = true,
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

    -- Rainbow
    {
        "HiPhish/nvim-ts-rainbow2",
        -- Bracket pair rainbow colorize
        lazy = true,
        event = { "User FileOpened" },
    },

    -- Surround
    {
        "kylechui/nvim-surround",
        lazy = true,
        keys = { "cs", "ds", "ys" },
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    -- Persistence
    {
        "folke/persistence.nvim",
        -- Restore last session of current dir
        lazy = true,
        event = "BufReadPre", -- this will only start session saving when an actual file was opened
        config = function()
            require("persistence").setup({
                dir = vim.fn.expand(vim.fn.stdpath("config") .. "/session/"),
                options = { "buffers", "curdir", "tabpages", "winsize" },
                pre_save = nil,
            })
        end,
    },

    -- Windows
    {
        "anuvyklack/windows.nvim",
        lazy = true,
        cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
        dependencies = {
            "anuvyklack/middleclass",
        },
        config = function()
            require("windows").setup({
                autowidth = {
                    enable = false,
                },
                ignore = {
                    buftype = { "quickfix" },
                    filetype = {
                        "NvimTree",
                        "neo-tree",
                        "undotree",
                        "gundo",
                        "qf",
                        "toggleterm",
                        "TelescopePrompt",
                        "alpha",
                        "netrw",
                    },
                },
            })
        end,
    },

    -- Colorful-winsep
    {
        "nvim-zh/colorful-winsep.nvim",
        lazy = true,
        event = "WinNew",
        config = function()
            require("colorful-winsep").setup()
        end,
    },

    -- Orgmode
    {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
            -- Setup orgmode
            require('orgmode').setup({
                org_agenda_files = '~/orgfiles/**/*',
                org_default_notes_file = '~/orgfiles/refile.org',
            })

            -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
            -- add ~org~ to ignore_install
            -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
        end,
    },

    -- Markdown - preview
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
        config = function()
            vim.g.mkdp_auto_start = 1
        end,
    },

    {
        "zbirenbaum/copilot-cmp",
        event = "InsertEnter",
        dependencies = { "zbirenbaum/copilot.lua" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup()     -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
                require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
            end, 100)
        end,
    },
}

return M
