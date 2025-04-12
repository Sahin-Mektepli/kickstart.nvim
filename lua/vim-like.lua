-- This will have my own additions to the configuration of neovim. I will have vanilla vim configs that otherwise would have been in a vimrc file here.
-- set hybrid numbers
vim.cmd 'set number relativenumber'

-- Runpy command that I like to set.
vim.api.nvim_create_user_command('Runpy', '!python3 %', {})
-- vim.api.nvim_create_user_command('RunC', function ()
--   local filename = vim.fn.expand('%:t:r') --% is the complete path, :t trims just to the filename, :r rids the extension
--   local cmd = string.format('terminal gcc %% -o %s ')
-- end
vim.api.nvim_create_user_command('RunC', '!gcc % -o %:r && ./%:r', {})
--TODO: make this so that it takes the C version as its argument
vim.keymap.set('n', '<leader>rc', ':RunC<CR>', { silent = true })
vim.keymap.set('n', '<leader>rp', ':Runpy<CR>', { silent = true })

-- I use this so often.
vim.keymap.set('n', '<leader>tv', ':vert split | terminal<CR>')
