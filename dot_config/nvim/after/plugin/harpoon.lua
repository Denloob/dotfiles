local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>h", mark.add_file)
vim.keymap.set("n", "<leader>H", ui.toggle_quick_menu)

for i = 1, 5 do
    vim.keymap.set("n", "<M-" .. i .. ">", function() ui.nav_file(i) end)
end

require("harpoon").setup {
    mark_branch = true,
}
