-- Utilities for creating configurations
local util = require "formatter.util"

local clang_format_style_config =
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
    '}"'


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
                        clang_format_style_config,
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
                        "--line-length 80",
                        "-", -- allows reading from stdin
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
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout" },
                    stdin = true,
                }
            end
        }
    }
}
