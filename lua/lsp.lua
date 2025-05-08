return {
    -- LSP Config
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Lua LSP (using lua_ls)
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            })

            -- Rust LSP
            lspconfig.rust_analyzer.setup({})

            -- Add other servers as needed
            lspconfig.pyright.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.clangd.setup({})
        end,
    },

    -- mason (optional: install LSPs automatically)
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    { "williamboman/mason-lspconfig.nvim" },
}
