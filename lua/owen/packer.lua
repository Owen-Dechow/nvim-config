-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer self manager
    use "wbthomason/packer.nvim"

    -- Telescope fuzzy find
    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.6",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    -- Rose Pine color scheme
    use {
        "rose-pine/neovim",
        as = "rose-pine"
    }

    -- Emmet
    use {
        "mattn/emmet-vim"
    }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } }
    use { "nvim-treesitter/playground" }

    -- Undotree
    use { "mbbill/undotree" }

    -- Fugitive
    use { "tpope/vim-fugitive" }

    -- Markdown preview
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
    }

    -- Sonokai color scheme
    use {
        "sainnhe/sonokai",
        as = "sonokai"
    }

    -- Coc for VSCode settings
    use { "neoclide/coc.nvim", branch = "release" }

    -- Bottom pad when scrolling
    use { "Aasim-A/scrollEOF.nvim" }
end)
