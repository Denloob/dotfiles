require("hardtime").setup {
    disable_mouse = false,
    disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "query", "fugitive", "undotree", "",
        "vhex", "dapui_scopes", "tetris", "harpoon" },
    disabled_keys = {
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
        ["dd"] = { 'n' },
    },
}
