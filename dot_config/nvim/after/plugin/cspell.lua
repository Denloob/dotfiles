return {
    get_config_path=function ()
        local home_path = vim.fn.expand("$HOME")
        local cspell_path = string.format("%s/.cspell/%s.json", home_path, vim.bo.filetype)

        return cspell_path
    end
}
