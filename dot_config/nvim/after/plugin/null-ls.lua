local null_ls = require("null-ls")

local blacklist = {
    "NvimTree_1"
}

local function should_attach(bufnr)
  local buffer_name = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
  -- check if buffer_name is not in the blacklist
  for _, word in ipairs(blacklist) do
    if buffer_name == word then
      return false
    end
  end

  return true
end


null_ls.setup({
    should_attach = should_attach,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.diagnostics.cspell,
        null_ls.builtins.code_actions.cspell,
        null_ls.builtins.diagnostics.credo,
    },
})
