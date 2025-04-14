local null_ls = require("null-ls")
local cspellcfg = require("cspellcfg")
local cspell = require("cspell")

cspellcfg.setup()

local config = {
    find_json = cspellcfg.get_config_path
}

null_ls.setup({
    sources = {
        cspell.code_actions.with({
            config = config,
        }),
        cspell.diagnostics.with({
            config = config,
            diagnostics_postprocess = function(diagnostic)
              diagnostic.severity = vim.diagnostic.severity.HINT
            end,
        }),

        null_ls.builtins.diagnostics.credo,
    },
})
