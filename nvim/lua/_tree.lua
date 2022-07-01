require('nvim-tree').setup {
  hijack_cursor = true,
  view = {
    adaptive_size = true,
    hide_root_folder = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_markers = {
      enable = true,
      icons = {
        corner = '└ ',
        edge = '│ ',
        item = '│ ',
        none = '  ',
      }
    }
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      error = ' ',
      warning = ' ',
      hint = ' ',
      info = ' '
    }
  }
}

vim.api.nvim_set_keymap('', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
