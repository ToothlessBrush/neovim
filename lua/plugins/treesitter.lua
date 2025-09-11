return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "rust", "toml", "wgsl" })

        opts.highlight = opts.highlight or {}
        opts.highlight.enable = true

        -- Optional: manually link highlight groups (in case your theme misses them)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "wgsl",
            callback = function()
                vim.cmd [[
                    highlight default link @type Type
                    highlight default link @function Function
                    highlight default link @variable Identifier
                    highlight default link @keyword Keyword
                    highlight default link @number Number
                ]]
            end,
        })

        -- Associate .wgsl files with the correct filetype
        vim.filetype.add({ extension = { wgsl = "wgsl" } })
    end,
}
