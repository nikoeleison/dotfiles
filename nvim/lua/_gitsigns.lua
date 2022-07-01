require('gitsigns').setup {
  current_line_blame = false,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'right_align',
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, opts)
      opts = vim.tbl_extend('force', { noremap = true, silent = true }, opts or {})
      vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    map('n', '[g', "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
    map('n', ']g', "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })

    map('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
    map('n', '<leader>gb', '<cmd>Gitsigns blame_line<CR>')
    map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>')
  end
}
