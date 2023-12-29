require 'nvim-treesitter.configs'.setup {
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = { query = "@function.outer", desc = "Select the outer part of the function" },
                ["if"] = { query = "@function.inner", desc = "Select the inner part of the function" },
                ["ap"] = { query = "@parameter.outer", desc = "Select the outer part of a parameter" },
                ["ip"] = { query = "@parameter.inner", desc = "Select the inner part of a parameter" },
                ["ac"] = { query = "@class.outer", desc = "Select outer part of a class or interface" },
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@function.inner'] = 'V', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = function(action)
                -- include surrounding whitespace only for parameter outer
                --  selection. This means that if we want to select the first
                --  param, the leading spacing after the comma will also be
                --  selected.
                return action.query_string == "@parameter.outer"
            end,
        },

        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
            },
            swap_previous = {
                ["<leader>A"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
            },
        },
    },
}
