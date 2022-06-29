local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    layout_config = {
      prompt_position = 'bottom',
    },
    sorting_strategy = 'descending',
    layout_strategy = 'bottom_pane',
    prompt_prefix = '>> ',
    borderchars = {' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<esc>'] = actions.close,
      },
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      }
    }
  }
}

vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('n', '<C-g>', ':Telescope live_grep<CR>', { silent = true, noremap = true })
