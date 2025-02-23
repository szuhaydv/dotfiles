return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            python = { "black" },
        },

    },
    config = function(_, opts)
        require("conform").setup(opts)

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end,
}
