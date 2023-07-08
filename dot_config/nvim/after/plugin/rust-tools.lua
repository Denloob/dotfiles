local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover actions" })
            vim.keymap.set("n", "<leader>cg", rt.code_action_group.code_action_group, { buffer = bufnr, desc="Code action group"  })
            vim.keymap.set('n', '<C-f>', "<cmd>Format<CR>")
            vim.keymap.set("n", "rn", vim.lsp.buf.rename, { noremap = true })
            -- TODO: use the lsp on_attach func
        end,
    },
})
