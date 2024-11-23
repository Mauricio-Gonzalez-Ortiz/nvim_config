return {
  'ThePrimeagen/harpoon',
  version = '*',
  config = function()
    require('harpoon').setup()
    local addf = require 'harpoon.mark'
    local navf = require 'harpoon.ui'
    for i = 1, 9 do
      vim.keymap.set('n', '<leader>' .. i, function()
        addf.set_current_at(i)
      end)
      vim.keymap.set('n', '<M-' .. i .. '>', function()
        navf.nav_file(i)
      end)
    end
    vim.keymap.set('n', '<M-e>', navf.toggle_quick_menu)
    vim.keymap.set('n', '<M-p>', navf.nav_prev)
    vim.keymap.set('n', '<M-n>', navf.nav_next)
  end,
}
