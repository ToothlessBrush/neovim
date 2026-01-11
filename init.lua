require("config.lazy")
require("config.keymaps")

-- Leader key
vim.g.mapleader = ' '

vim.diagnostic.config({
    virtual_text = true, -- inline errors
    signs = true,        -- gutter icons
    underline = true,    -- underline issues
    update_in_insert = false,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
})

vim.lsp.inlay_hint.enable(true)

-- copy to system clipboard
vim.o.clipboard = "unnamedplus"
-- Enable syntax and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Highlight search, disable with :noh
vim.opt.hlsearch = true

-- Enable terminal colors
vim.opt.termguicolors = true

-- Wildmenu (completion in command-line mode)
vim.opt.wildmenu = true

vim.opt.list = true
vim.opt.listchars = {
    tab = '→ ',
    trail = '·',
    nbsp = '␣',
    extends = '⟩',
    precedes = '⟨',
    eol = '↵',
}


-- -- Colorscheme setup (if wallbash.vim exists)
-- local vim_dir = vim.fn.fnamemodify(vim.env.MYVIMRC or "", ":h")
-- local color_path = vim_dir .. "/colors/wallbash.vim"
--
-- if vim.fn.filereadable(color_path) == 1 then
--     vim.cmd('colorscheme wallbash')
-- end

------- THEME -------
require("current-theme")

-- Reuse normal background for float windows
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#888888", bg = "NONE" }) -- optional border tweak
