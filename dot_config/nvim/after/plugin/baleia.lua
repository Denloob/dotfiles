local baleia = require("baleia").setup({ })

-- Command to colorize the current buffer
vim.api.nvim_create_user_command("AnsiColorize", function()
  baleia.once(vim.api.nvim_get_current_buf())
end, { bang = true })
