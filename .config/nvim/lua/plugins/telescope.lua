vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open float with diagnostics for current line' })

return {
    'nvim-telescope/telescope.nvim',
    opts = {
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {}
            }
        },
        extension_list = { "themes", "ui-select" },
        defaults = {
            theme = 'ivy',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                },
            },
            sorting_strategy = 'ascending',
            winblend = 15,
        },
        pickers = {
        }
    },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>',  desc = 'Telescope find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',   desc = 'Telescope live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',     desc = 'Telescope buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>',   desc = 'Telescope help tags' },
        { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Telescope diagnostics' },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        telescope.load_extension("ui-select")
    end,
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make -j8' },
        "nvim-telescope/telescope-ui-select.nvim",
    },
}
