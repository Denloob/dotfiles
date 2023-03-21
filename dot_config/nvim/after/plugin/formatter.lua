-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        '-style="{BreakBeforeBraces: Allman, IndentWidth: 4}"',
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }

            end
        },
        python = {
            function ()
                return {
                    exe = "black",
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                }
            end
        },
        json = {
            function()
                return {
                    exe = "fixjson",
                    stdin = true,
                }
            end,
        }
    }
}
