vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
    'echasnovski/mini.files',
    version = '*',
    dependencies = { 'echasnovski/mini.icons', version = '*' },
    lazy = false,
    opts = {
        options = {
            use_as_default_explorer = true,
        },
        windows = {
            preview = true,
            width_preview = 50,
            width_focus = 30,
        },
        content = {
            filter = function(entry)
                return entry.name ~= '.DS_Store' and entry.name ~= '.git'
            end,
            sort = function(entries)
                local all_paths = table.concat(
                vim.tbl_map(function(entry)
                        return entry.path
                    end, entries),
                    '\n'
                )
                local output_lines = {}
                local job_id = vim.fn.jobstart({ 'git', 'check-ignore', '--stdin' }, {
                    stdout_buffered = true,
                    on_stdout = function(_, data)
                        output_lines = data
                    end,
                })

                if job_id < 1 then
                    return entries
                end

                vim.fn.chansend(job_id, all_paths)
                vim.fn.chanclose(job_id, 'stdin')
                vim.fn.jobwait({ job_id })
                return require('mini.files').default_sort(vim.tbl_filter(function(entry)
                    return not vim.tbl_contains(output_lines, entry.path)
                end, entries))
            end,
        }
    },
    keys = {
        {
            "<leader>fm",
            function()
                require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
            end,
            desc = "Open mini.files (Directory of Current File)",
        },
        {
            "<leader>fM",
            function()
                require("mini.files").open(vim.uv.cwd(), true)
            end,
            desc = "Open mini.files (cwd)",
        },
    },
    config = function(_, opts)
        require("mini.icons").setup()
        require("mini.files").setup(opts)
    end,
}
