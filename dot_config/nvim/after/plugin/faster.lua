require('faster').setup {
    behaviours = {
        fastmacro = {
            on = true,
            features_disabled = { "lsp", "treesitter" },
        }
    }
}
