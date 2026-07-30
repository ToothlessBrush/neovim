return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
            callback = function() pcall(vim.treesitter.start) end,
        })
        vim.treesitter.query.set("markdown", "injections", "")
        require("nvim-treesitter").setup({
            ensure_install = {
                "lua", "python",
                "typescript", "javascript",
                "c", "cpp",
                "java",
                "rust", "toml",
                "wgsl",
                "json", "yaml", "xml",
            }
        })
    end,
}
