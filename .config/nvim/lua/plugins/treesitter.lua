return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        ensure_installed = { "c", "lua", "javascript", "typescript", "html", "svelte", "css", "python" },
        auto_install = true,
        highlight = {
            enable = true,
            disable = { "css", "html", "json" },
            additional_vim_regex_highlighting = false,
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)

        -- vim.api.nvim_create_autocmd('FileType', {
        --     pattern = 'svelte',
        --     callback = function()
        --         vim.treesitter.start()
        --     end,
        -- })
    end
}
