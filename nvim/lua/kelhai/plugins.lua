local plugins = {

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

--[[    {
        "catppuccin/nvim",
        name = "catppuccin",
        build = ":colorscheme catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            require("catppuccin").setup()

            vim.cmd.colorscheme "catppuccin"
        end,
    },--]]
    {
        "savq/melange-nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("melange")
            vim.opt.termguicolors = true
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",

    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            --            {"saadparwaiz1/cmp_luasnip"},
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    },

    {
        "windwp/nvim-autopairs",
        dependencies = { "nvim-cmp", },
        opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- setup cmp for autopairs
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        as = "lualine",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig",
        config = function()
            local navic = require("nvim-navic")

            require("lspconfig").clangd.setup {
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end
            }
        end
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            -- animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    "eandrju/cellular-automaton.nvim",
    {
        'echasnovski/mini.indentscope',
        version = '*',
        config = function()
            require("mini.indentscope").setup()
        end,
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        }
    },
    {
        "simrat39/rust-tools.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",

            -- Debugging
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    },
    "gpanders/nvim-parinfer",
    {
        "monkoose/nvlime",
        name = "nvlime",
        dependencies = {
            "monkoose/parsley",
        },
    },

    "lervag/vimtex",
    {
        "dense-analysis/ale",
    },
}

return plugins
