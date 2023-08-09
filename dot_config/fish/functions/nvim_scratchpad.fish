function nvim_scratchpad --description "Opens neovim as a scratchpad without statusline."
  nvim "+:setlocal buftype=nofile | setlocal bufhidden=hide | setlocal noswapfile | setlocal laststatus=0 | lua require('lualine').hide()" $argv
end
