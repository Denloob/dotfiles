local null_ls = require("null-ls")


local cspell_code_action = null_ls.builtins.code_actions.cspell.with({
    config = {
        find_json = require 'cspell'.get_config_path
    },
    disabled_filetypes = { "NvimTree" },
})

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        cspell_code_action,
        null_ls.builtins.diagnostics.cspell.with {
            args = function(params)
                return {
                    "lint",
                    "--language-id",
                    params.ft,
                    "--show-suggestions",
                    "--config",
                    require 'cspell'.get_config_path(),
                    "stdin",
                }
            end
        },
        null_ls.builtins.diagnostics.credo,
    },
})
