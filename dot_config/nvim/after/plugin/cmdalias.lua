--- Calculates all the possible capitalization permutations for a string
---@param str string
---@return string[] # All the possible capitalizations
local function permute_capitalizations(str)
    if str == '' then
        return { '' }
    end

    local current = str:sub(1, 1)
    local upper = current:upper()
    local lower = current:lower()

    local permutations = permute_capitalizations(str:sub(2))

    local arr = {}
    for i = 1, #permutations do
        table.insert(arr, upper .. permutations[i])
        table.insert(arr, lower .. permutations[i])
    end

    return arr
end

--- Creates an alias from each capitalization permutation, to the given command
---@param command string
local function alias_all_permutations(command)
    local permutations = permute_capitalizations(command)

    for _, permutation in pairs(permutations) do
        vim.cmd.Alias(permutation, command)
    end
end

local capitalization_aliased_commands = {
    'q', 'w', 'wq', 'qa'
}

for _, command in pairs(capitalization_aliased_commands) do
    alias_all_permutations(command)
end
