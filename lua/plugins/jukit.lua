return {
  "luk400/vim-jukit",
  enabled = function()
    return vim.fn.expand('%:e') == 'py'
  end
}
