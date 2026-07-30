return {
    'nvim-telescope/telescope.nvim',
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
