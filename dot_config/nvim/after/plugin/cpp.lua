local util = require("nt-cpp-tools.util")

local function add_to_cpp(output, _)
    local file_name = vim.fn.expand('%:r')
    vim.api.nvim_command('vsplit ' .. file_name .. '.cpp')
    util.add_text_edit(output, 1, 0)
end

require 'nt-cpp-tools'.setup {
    preview = {
        quit = 'q',                           -- keymapping for quit preview
        accept = '<CR>',                      -- keymapping for accept preview
    },
    custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = add_to_cpp,
        },
        --[[
        <your impl function custom command name> = {
            output_handle = function (str, context)
                -- string contains the class implementation
                -- do whatever you want to do with it
            end
        }
        ]]
    },
}
