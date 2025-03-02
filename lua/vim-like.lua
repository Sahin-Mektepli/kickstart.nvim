-- This will have my own additions to the configuration of neovim. I will have vanilla vim configs that otherwise would have been in a vimrc file here.
-- set hybrid numbers
vim.cmd 'set number relativenumber'

-- Runpy command that I like to set.
vim.api.nvim_create_user_command('Runpy', '!python3 %', {})
