local mason_dap = require("mason-nvim-dap")

require("mason").setup()
mason_dap.setup {
    automatic_setup = true,
    handlers = {
        python = function(config)
            config.adapters = {
                type = "executable",
                command = "/usr/bin/python3",
                args = {
                    "-m",
                    "debugpy.adapter",
                },
            }
            mason_dap.default_setup(config)
        end,
        codelldb = function(config)
            config.configurations = {
                {
                    name = 'LLDB: Launch',
                    type = 'codelldb',
                    request = 'launch',
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                    args = function()
                        return vim.split(vim.fn.input("Program arguments: "), " ")
                    end,
                },
            }
            mason_dap.default_setup(config)
        end,
    },
}
