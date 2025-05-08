return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                treesitter = true,
                telescope = true,
                native_lsp = {
                    enabled = true,
                },
            },
        })

        vim.cmd.colorscheme("catppuccin")
    end,
}
