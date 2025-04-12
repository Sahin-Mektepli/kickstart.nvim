-- This will have my own additions to the configuration of neovim. I will have vanilla vim configs that otherwise would have been in a vimrc file here.
-- set hybrid numbers
vim.cmd 'set number relativenumber'

-- Runpy command that I like to set.
vim.api.nvim_create_user_command('Runpy', '!python3 %', {})
vim.api.nvim_create_user_command('RunC', function(opts)
  --I hate ternary operators
  local std_version = (opts.args == '' and '23') or opts.args --default'u 23, verilirse arguman aliyor
  local compile_cmd = string.format('!gcc-14 %% -std=c%s -o %%:t:r', std_version)
  local run_cmd = string.format '!./%%:t:r'
  vim.cmd(compile_cmd)
  if vim.v.shell_error == 0 then --compile calistiysa
    vim.cmd(run_cmd)
  end
end, {
  nargs = '?', --0 veya 1 arguman aliyor
  complete = function() --asagidaki versiyonlari otomatik oneriyor
    return { '89', '11', '17', '23' }
  end,
})
vim.keymap.set('n', '<leader>rc', ':RunC<CR>', { silent = true })
vim.keymap.set('n', '<leader>rp', ':Runpy<CR>', { silent = true })

-- I use this so often.
vim.keymap.set('n', '<leader>tv', ':vert split | terminal<CR>')
