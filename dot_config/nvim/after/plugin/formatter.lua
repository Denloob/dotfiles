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
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = {
                        '-style="{' ..
                            'ReflowComments: false,' ..
                            'IndentWidth: 4,' ..
                            'ColumnLimit: 80,' ..
                            'IndentCaseLabels: true,' ..
                            'BreakBeforeBraces: Allman,' ..
                            'AllowShortFunctionsOnASingleLine: None,' ..
                            'AllowShortEnumsOnASingleLine: true,' ..
                            'AllowShortIfStatementsOnASingleLine: false,' ..
                            'AllowShortBlocksOnASingleLine: Empty,' ..
                        '}"',
                    },
                    stdin = true,
                }
            end
        },
        python = {
            function()
                return {
                    exe = "black",
                    args = {
                        "-", -- allowes reading from stdin
                    },
                    stdin = true,
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
        },
        sh = {
            function()
                return {
                    exe = "shfmt",
                    stdin = true,
                }
            end
        },
    }
}
