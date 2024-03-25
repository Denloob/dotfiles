vim.api.nvim_create_user_command("Trim", "keepjumps keeppatterns silent! %s/\\s\\+$//g", {})
