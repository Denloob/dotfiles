local dapui = require('dapui')

local evalPrompt = function()
    vim.ui.input({ prompt = 'Enter an expression to eval: ' }, dapui.eval)
end

vim.keymap.set("n", "<leader>di", dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>de", evalPrompt, { desc = "Evaluate prompt" })

dapui.setup()
