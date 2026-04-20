return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function() pcall(vim.treesitter.start) end,
        })
        require("nvim-treesitter").setup({
            ensure_install = {
                "lua", "python",
                "typescript", "javascript",
                "c", "cpp",
                "rust", "toml",
                "wgsl",
                "json", "yaml", "xml",
            }
        })
    end,
}
