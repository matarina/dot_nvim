--------------------
----Lazy config-----
--------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "-- set leader key
vim.g.maplocalleader = '\\'
require('lazy').setup("plugins")


-------------------
--General settings
------------------
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.ignorecase = true 
vim.opt.mouse = "a"
vim.opt.completeopt = "menu,menuone,preview"
vim.opt.termguicolors = true 
vim.g.R_user_maps_only = 1 --only use my keymap in nvim-R
vim.g.jukit_shell_cmd = 'ipython3' --jukit terminal

--------------------
--Keys mapping------
--------------------
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.R",},
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>os', '<Plug>RStart', {})
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>or', '<Plug>RStart', {})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>f', '<Plug>RDSendLine', {})
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>f', '<Plug>RDSendSelection', { noremap = true, silent = true })
end})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py",},
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>os', ':call jukit#splits#output()<cr>', {})
    vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>f', ':call jukit#send#line()<cr>', {})
    vim.api.nvim_buf_set_keymap(0, 'v', '<Leader>f', ':<C-U>call jukit#send#selection()<cr>', {})
end})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>p', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':terminal<CR>', { noremap = true })



--------------------
--lspconfig---------
--------------------
require'lspconfig'.pyright.setup{}
require'lspconfig'.r_language_server.setup{}

--------------------
--Color theme------
--------------------
vim.cmd("colorscheme carbonfox")
