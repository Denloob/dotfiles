vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = '*.h',
    callback = function()
        vim.bo.filetype = 'c'
    end
})

vim.opt.nu = true
vim.opt.relativenumber = true


vim.opt.listchars = { tab = ">-", trail = "." }
vim.opt.list = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.clipboard = "unnamedplus"

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- set `:!commandHere` to be executed in powershell instead of cmd if on windows
if vim.fn.has("win32") == 1 then
    vim.cmd([[
        set shell=powershell.exe
        set shellxquote=
        let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command '
        let &shellquote   = ''
        let &shellpipe    = '| Out-File -Encoding UTF8 %s'
        let &shellredir   = '| Out-File -Encoding UTF8 %s'
    ]])
elseif #vim.fs.find("fish", { path = "/usr/bin" }) > 0 then
    vim.o.shell = "/usr/bin/fish"
end

vim.g.loaded_python3_provider = 0
