return {
    "OmniSharp/omnisharp-vim",
    ft = { "cs" },
    init = function()
        vim.g.OmniSharp_server_use_net6 = 1
    end,
}
