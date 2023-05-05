if pcall(require, 'impatient') then
    require 'impatient'
end
package.path = package.path .. vim.fn.expand(";$XDG_CONFIG_HOME/nvim/after/plugin/?.lua")
require("plugins.set")
require("plugins.packer")
require("plugins.remap")
