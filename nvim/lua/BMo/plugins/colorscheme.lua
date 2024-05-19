return {
  {
    'sainnhe/sonokai',
    priority = 1001,
    config = function()
      vim.g.sonokai_transparent_background = '2'
      vim.g.sonokai_enable_italic = '2'
      vim.g.sonokai_style = 'andromeda'
      vim.cmd.colorscheme 'sonokai'
    end,
  },
}
