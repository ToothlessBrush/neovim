return {
    -- Aesthetic dark themes
    { "folke/tokyonight.nvim",           name = "tokyonight" },
    { "catppuccin/nvim",                 name = "catppuccin" },
    { "rebelot/kanagawa.nvim" },
    { "EdenEast/nightfox.nvim" },
    { "shaunsingh/nord.nvim" },
    { "rmehri01/onenord.nvim" },
    { "sainnhe/gruvbox-material" },
    { "sainnhe/everforest" },
    { "ellisonleao/gruvbox.nvim" },
    { "rose-pine/neovim",                name = "rose-pine" },

    -- Lighter or dual-mode themes
    { "projekt0n/github-nvim-theme" },
    { "nyoom-engineering/oxocarbon.nvim" },
    { "maxmx03/fluoromachine.nvim" },
    { "Yazeed1s/oh-lucy.nvim" },
    { "Shatur/neovim-ayu" },
    { "mcchrish/zenbones.nvim",          dependencies = { "rktjmp/lush.nvim" } },

    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup {
                transparent = true,
            }
            require("onedark").load()
        end
    },

    -- Special and experimental looks
    { "rockerBOO/boo-colorscheme-nvim" },
    { "marko-cerovac/material.nvim" },
    { "tanvirtin/monokai.nvim" },
    { "loctvl842/monokai-pro.nvim" },
    { "lunarvim/darkplus.nvim" },
    { 'Everblush/nvim',                name = 'everblush' },
}
