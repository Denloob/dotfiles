vim.g.codeium_disable_bindings = 1
vim.g.codeium_manual = true

vim.keymap.set('i', '<TAB>', function() return vim.fn['codeium#Accept']() end, { expr = true })
vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<C-j>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
vim.keymap.set('i', '<C-e>', function() return vim.fn['codeium#Clear']() end, { expr = true })
vim.keymap.set('i', '<C-Bslash>', function() return vim.fn['codeium#Complete']() end, { expr = true })
