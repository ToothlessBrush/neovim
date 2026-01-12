return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "rust",
                "toml",
                "wgsl",
                "c",
                "cpp",
                "typescript",
                "javascript",
                "lua",
                "json",
                "yaml",
                "python",
            },
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })
    end,
}
