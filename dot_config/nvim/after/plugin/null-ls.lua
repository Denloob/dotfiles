local null_ls = require("null-ls")


local cspell_code_action = null_ls.builtins.code_actions.cspell.with({
     disabled_filetypes = { "NvimTree" },
})


null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.cspell,
        cspell_code_action,
        null_ls.builtins.diagnostics.credo,
    },
})
