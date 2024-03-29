require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = { left = ' ', right = ' ' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { { 'filename', path = 2 } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = { { 'buffers', mode = 2 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filesize' },
    lualine_z = { 'tabs' }
  }
}
