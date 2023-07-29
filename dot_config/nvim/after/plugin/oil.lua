local oil = require("oil")

oil.setup {
    delete_to_trash = true,
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = 'oil://*',
    callback = function()
        -- You can't be too careful :D
        if vim.bo.filetype ~= "oil" then
            return
        end

        vim.cmd({ cmd = "cd", args = { oil.get_current_dir() } })
    end
})

vim.keymap.set("n", "<leader>t", oil.open, { desc = "Open parent directory in oil" })
