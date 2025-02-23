return {
    "rebelot/kanagawa.nvim",
    -- dependencies = {
    --     "oxfist/night-owl.nvim",
    --     "folke/tokyonight.nvim",
    --     "bluz71/vim-nightfly-colors",
    --     'shaunsingh/moonlight.nvim',
    -- },
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("kanagawa")
        --     -- folding
        vim.api.nvim_set_hl(0, 'Folded', { fg = '#FBDD74' })
        vim.api.nvim_set_hl(0, 'ColorColumn', { bg = "DarkMagenta" })
        vim.api.nvim_set_hl(0, '@attribute.derive.rust', { fg = '#ff8800', italic = true })

        vim.cmd [[
            highlight CursorLineNr guifg=#ffc777 guibg=#2F3338
            highlight CursorLine guibg=#2F3338
            highlight LineNr guibg=none
            "guibg=#DC143C
            highlight Normal guibg=none
            highlight NonText guibg=none
            highlight Normal ctermbg=none
            highlight NonText ctermbg=none
            "highlight NormalFloat guibg=none
            highlight FloatBorder guibg=none
            highlight SignColumn guibg=none
            highlight Macro guifg=#bbbbbb gui=italic
            highlight PreProc guifg=#bbbbbb
            highlight RustDeriveTrait guifg=#bbbbbb
            highlight link @attribute.derive.rust Macro
        ]]
    end,

}
