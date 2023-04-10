vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
vim.keymap.set("n", "<leader>n", "<cmd>noh<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>QQ", "<cmd>q!<CR>")
vim.keymap.set("n", "<leader>QA", "<cmd>qa!<CR>")
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>")
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>")
