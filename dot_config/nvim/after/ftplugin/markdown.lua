require("nvim-surround").setup {
    surrounds = {
        ["b"] = {
            add = { "**", "**" },
            find = function() end,
            delete = function() end,
        },
    },
    aliases = {
        ["b"] = "b",
    },
}
