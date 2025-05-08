return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",             -- Snippet engine
        "saadparwaiz1/cmp_luasnip",     -- Snippet completion source
        "hrsh7th/cmp-nvim-lsp",         -- LSP completions
        "hrsh7th/cmp-buffer",           -- Buffer word completion
        "hrsh7th/cmp-path",             -- File path completion
        "hrsh7th/cmp-cmdline",          -- Command-line completion
        "rafamadriz/friendly-snippets", -- Community snippet collection
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippets

        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
}
