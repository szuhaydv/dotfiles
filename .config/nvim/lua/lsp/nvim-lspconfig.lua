return {
    'neovim/nvim-lspconfig',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },

    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format()
            end,
        })

        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>")

        vim.keymap.set("n", "gD", vim.lsp.buf.declaration)

        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")

        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>")

        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>")

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })


        local servers = { "lua_ls", "pyright", "clangd", "svelte", "ts_ls", "html", "tailwindcss" }
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
            })
        end

        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ['rust-analyzer'] = {
                    diagnostics = {
                        enable = true,
                    },
                    cargo = {
                        allFeatures = true,
                    }
                }
            },
            cmd = { "rustup", "run", "stable", "rust-analyzer" }
        }
    end
}
