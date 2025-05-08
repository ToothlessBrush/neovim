return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- Lazy load just before saving
    config = function()
        require("conform").setup({
            format_on_save = {
                lsp_fallback = true,
                timeout_ms = 500,
            },
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                c = { "clang_format" },
                cpp = { "clang_format" },
                -- add more filetypes as needed
            },
        })
    end,
}
