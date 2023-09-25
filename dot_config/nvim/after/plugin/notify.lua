local notify = require("notify")

notify.setup {
    minimum_width = 20,
    stages = "slide",
    render = "minimal",
    timeout = 1000,
}

vim.notify = notify
