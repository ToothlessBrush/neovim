return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim', 'andrew-george/telescope-themes', },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                themes = {
                    persist = {
                        enabled = true,
                    },
                },
            },
            no_ignore = true,
        })
        telescope.load_extension('themes')
    end,
}
