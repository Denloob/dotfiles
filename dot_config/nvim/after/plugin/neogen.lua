local neogen = require "neogen"

neogen.setup {
    snippet_engine = "luasnip"
}

vim.keymap.set("n", "<leader>bd", neogen.generate, {desc = "Generate neogen documentation"})
