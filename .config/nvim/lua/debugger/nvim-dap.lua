return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb"
        }

    dap.configurations.rust = {
      {
        type = 'codelldb',
        request = 'launch',
        name = "Launch file",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        args = { "-d" },
      },
    }

    end,
    keys = {
        { "<leader>co", function() require("dap").continue() end },
        { "<leader>b", function() require("dap").toggle_breakpoint() end },
        { "<leader>do", function() require("dap").step_over() end },
        { "<leader>di", function() require("dap").step_into() end },
        { "<leader>dq", function() require("dap").step_out() end },
    },
}
