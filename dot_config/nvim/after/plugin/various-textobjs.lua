local textobjs = require("various-textobjs")

textobjs.setup {
    useDefaultKeymaps = true,
    disabledKeymaps = {
        "aS", "iS",
        "r",
    },
}

-- Ex-commands and not lua functions to allow dot-repeatability
vim.keymap.set({ "o", "x" }, "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
vim.keymap.set({ "o", "x" }, "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
