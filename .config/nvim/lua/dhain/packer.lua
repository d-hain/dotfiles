vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    -- Beautiful colors
    use "navarasu/onedark.nvim"
    use {
        "nvim-treesitter/nvim-treesitter",
        { run = ":TSUpdate" }
    }

    -- Better than netrw
    use "nvim-tree/nvim-web-devicons"
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons"
        }
    }
    use {
        "brenoprata10/nvim-highlight-colors",
        config = {
            require("nvim-highlight-colors").setup()
        }
    }

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }
    }

    -- Blazingly fast navigation
    use "theprimeagen/harpoon"
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.1",
        requires = { { "nvim-lua/plenary.nvim" } }
    }

    -- The vim GOD
    use "tpope/vim-fugitive"
    use "tpope/vim-commentary"
    use "tpope/vim-surround"

    -- Useful things
    use "mbbill/undotree"
    use "windwp/nvim-autopairs"
    use "f-person/git-blame.nvim"
    use "nvim-treesitter/nvim-treesitter-context"

    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },   -- Required
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        }
    }
    use "elkowar/yuck.vim"

    use "github/copilot.vim"

    -- Very important
    use "eandrju/cellular-automaton.nvim"
end)
