return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.pairs").setup()
        require("mini.surround").setup()
        require("mini.comment").setup()
        require("mini.bufremove").setup()
    end,
}
