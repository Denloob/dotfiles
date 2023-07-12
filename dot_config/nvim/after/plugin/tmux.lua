local tmux = require("tmux")
tmux.setup {
    copy_sync = {
        -- disables copy sync.
        enable = false,
    },
    navigation = {
        -- cycles to opposite pane while navigating into the border
        cycle_navigation = true,
        enable_default_keybindings = false,
        -- prevents unzoom tmux when navigating beyond vim border
        persist_zoom = false,
    },
    resize = {
        enable_default_keybindings = false,
        -- sets resize steps for x axis
        resize_step_x = 1,
        -- sets resize steps for y axis
        resize_step_y = 1,
    }
}

vim.keymap.set('n', '<C-Left>', tmux.move_left)
vim.keymap.set('n', '<C-Right>', tmux.move_right)
vim.keymap.set('n', '<C-Up>', tmux.move_top)
vim.keymap.set('n', '<C-Down>', tmux.move_bottom)

vim.keymap.set('n', '<M-Left>', tmux.resize_left)
vim.keymap.set('n', '<M-Right>', tmux.resize_right)
vim.keymap.set('n', '<M-Up>', tmux.resize_top)
vim.keymap.set('n', '<M-Down>', tmux.resize_bottom)
