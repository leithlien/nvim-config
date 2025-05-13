-- ~/nvim/lua/slydragonn/plugins/toggleterm.lua

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
        size = 10,
        open_mapping = [[<F7>]],
        shading_factor = 2,
        direction = "float",
        float_opts = {
            border = "curved",
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })
    -- Create terminals 1, 2, 3
    local Terminal = require("toggleterm.terminal").Terminal
    local term1 = Terminal:new({ count = 1, direction = "float" })
    local term2 = Terminal:new({ count = 2, direction = "float" })
    local term3 = Terminal:new({ count = 3, direction = "float" })

    -- Keymaps to toggle terminals
    vim.keymap.set('n', '<leader>1', function() term1:toggle() end, { desc = "Toggle Terminal 1" })
    vim.keymap.set('n', '<leader>2', function() term2:toggle() end, { desc = "Toggle Terminal 2" })
    vim.keymap.set('n', '<leader>3', function() term3:toggle() end, { desc = "Toggle Terminal 3" })
  end,
}
