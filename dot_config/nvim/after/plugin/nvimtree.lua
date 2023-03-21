-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
    disable_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    sync_root_with_cwd = true,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
    },
})

local function open_nvim_tree(data)
    -- Opens the nvim-tree if the buffer is a directoy or if it's a [No Name]. --
    local directory = vim.fn.isdirectory(data.file) == 1
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not directory and not no_name then
        return
    end

    -- change to the directory
    if directory then
        vim.cmd.cd(data.file)
    end

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
