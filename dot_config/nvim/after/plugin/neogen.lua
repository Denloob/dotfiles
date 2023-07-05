local neogen = require "neogen"

neogen.setup {
    snippet_engine = "luasnip",
    languages = {
        python = {
            template = {
                annotation_convention = "reST"
            }
        }
    },
    placeholders_hl = "None"
}

vim.keymap.set("n", "<leader>bd", neogen.generate, {desc = "Generate neogen documentation"})
