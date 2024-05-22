local which_key = require 'which-key'

local dap = require('dap')
local widgets = require('dap.ui.widgets')

local Hydra = require('hydra')
Hydra({
    name = 'Debug Step',
    mode = 'n',
    body = '<leader>ds',
    heads = {
        { 's', dap.continue,  { desc = "Start/Continue" } },
        { 'n', dap.step_over, { desc = "Step over" } },
        { 'i', dap.step_into, { desc = "Step into" } },
        { 'o', dap.step_out,  { desc = "Step out" } },
    },
    config = {
        color = "pink",
    },
})

vim.keymap.set("n", "<leader>dbt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dbc", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = "Set breakpoint condition" })
vim.keymap.set("n", "<leader>dbl", function() dap.set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') }) end,
    { desc = "Set log point message" })


-- vim.keymap.set( "n", "<leader>dhh", require('dap.ui.variables').hover )
-- vim.keymap.set( "v", "<leader>dhv", require('dap.ui.variables').visual_hover )

vim.keymap.set("n", "<leader>duh", widgets.hover, { desc = "UI: Hover" })
vim.keymap.set("n", "<leader>duf", function() widgets.centered_float(widgets.scopes) end, { desc = "UI: Float" })

vim.keymap.set("n", "<leader>dro", dap.repl.open, { desc = "Repl: Open" })
-- vim.keymap.set("n", "<leader>drl", dap.repl.run_last)


-- vim.keymap.set( "n", "<leader>dc", require('dap.ui.variables').scopes )

which_key.register({
    d = {
        name = "Debug",
        s = {
            name = "Step",
        },
        h = {
            name = "Hover",
        },
        u = {
            name = "UI",
        },
        r = {
            name = "Repl",
        },
        b = {
            name = "Breakpoints",
        },
    },
}, { prefix = "<leader>" })
