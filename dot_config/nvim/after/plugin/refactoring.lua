require('refactoring').setup {
    printf_statements = {
        cpp = {
            'std::cerr << "%s" << std::endl; /* DEBUG: */',
        }
    },
    print_var_statements = {
        cpp = {
            'std::cerr << "%s" << %s << std::endl; /* DEBUG: */',
        }
    },
}

vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Refactor: Extract" })
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Refactor: Extract to file" })

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Refactor: Extract variable" })

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Refactor: Inline variable" })

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Refactor: Inline function" })

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Refactor: Extract block" })
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Refactor: Extract block to file" })

-- Debug utilities:

vim.keymap.set("n", "<leader>rp", function() require('refactoring').debug.printf { below = true } end, { desc = "Refactor: Print statement below" })
vim.keymap.set("n", "<leader>rP", function() require('refactoring').debug.printf { below = false } end, { desc = "Refactor: Print statement above" })

vim.keymap.set({ "x", "n" }, "<leader>rv", function() require('refactoring').debug.print_var() end, { desc = "Refactor: Print variable" })

vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup() end, { desc = "Refactor: Cleanup" })
