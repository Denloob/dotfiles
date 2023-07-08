local M = {}

--- Returns the keys of the table
---@generic T
---@param t table<T, any>
---@return T[]
local _get_table_keys = function(t)
    local keys = {}
    for key, _ in pairs(t) do
        table.insert(keys, key)
    end
    return keys
end

--- Returns the config path
---@return string
M.get_config_path = function()
    local home_path = vim.fn.expand("$HOME")
    local config_path = string.format("%s/.cspell/%s.json", home_path, vim.bo.filetype)

    return config_path
end

--- Creates the config file if it doesn't exist.
M.create_config = function()
    local config_path = M.get_config_path()

    if vim.fn.filereadable(config_path) == 0 then
        vim.fn.writefile({ "{}" }, config_path)
    end
end

--- Checks if the config exists
---@return boolean
M.config_exists = function()
    local config_path = M.get_config_path()

    return vim.fn.filereadable(config_path) == 1
end

local subcommands = {
    ["Exists"] = function()
        if M.config_exists() then
            print("Yes")
        else
            print("No")
        end
    end,
    ["Create"] = M.create_config
}

--- Set's up the CSpell command
M.setup = function()
    vim.api.nvim_create_user_command('CSpell', function(opts)
        local subcommand = opts.fargs[1]

        if subcommands[subcommand] then
            subcommands[subcommand]()
            return
        end

        vim.notify("Unknown subcommand: " .. subcommand, "error")
    end, {
        nargs = 1,
        complete = function()
            return _get_table_keys(subcommands)
        end
    })
end

return M
