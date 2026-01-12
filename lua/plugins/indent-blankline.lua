return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("ibl").setup({
            indent = {
                char = "│",
            },
            scope = {
                enabled = true,
                show_start = true,
                show_end = true,
                highlight = "IblScope",
            },
        })
    end
}
