local lspconfig = require 'lspconfig'

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach_general = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    on_attach(client, bufnr)
    vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('x', '<C-f>', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local on_attach_external_formatting = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    on_attach(client, bufnr)
    vim.keymap.set('n', '<C-f>', "<cmd>Format<CR>", bufopts)
    vim.keymap.set('x', '<C-f>', "<cmd>'<,'>Format<CR>", bufopts)
end

local inlay_hints = require("inlay-hints")

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        on_attach_external_formatting(client, bufnr)
        inlay_hints.on_attach(client, bufnr)
    end,
    capabilities = capabilities,
    cmd = { "clangd", "--offset-encoding=utf-16", "--enable-config", "--clang-tidy" }
}

lspconfig.jsonls.setup {
    on_attach = on_attach_external_formatting,
    capabilities = capabilities,
}

lspconfig.pyright.setup {
    on_attach = on_attach_external_formatting,
    capabilities = capabilities,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                -- Get
                globals = { 'vim' },
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

lspconfig.bashls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
}

lspconfig.elixirls.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
    cmd = { "elixir-ls" }
}

lspconfig.tsserver.setup {
    on_attach = on_attach_external_formatting,
    capabilities = capabilities,
}

lspconfig.arduino_language_server.setup {
    on_attach = on_attach_general,
    capabilities = capabilities,
}

lspconfig.hls.setup {
    on_attach = on_attach_external_formatting,
    capabilities = capabilities,
}
