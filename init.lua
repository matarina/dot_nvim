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
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"




--------------------
--Keys mapping------
--------------------
print("hello")
--nvim-python-repl plugins config--
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.py","*.R",},
  callback = function()
	vim.keymap.set("n", '<CR>', function() 
        require('nvim-python-repl').send_statement_definition() 
    end, {noremap = true})
	vim.keymap.set("v", '<CR>', function() 
        require('nvim-python-repl').send_visual_to_repl() 
    end, {noremap = true})
	vim.keymap.set("n", '<leader>fa', function() 
        require('nvim-python-repl').send_buffer_to_repl() 
    end, {noremap = true})
end})

--nvim tree config--
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap("n", "<CR>", ":lua api.node.open.edit('Open')<CR>", {noremap = true})

--nvim buffer/terminal_buffer config--
vim.api.nvim_set_keymap('n', '<leader>p', ':bprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':terminal<CR>', { noremap = true })

--noice config--
vim.keymap.set("n", "<leader>nh", function()
  require("noice").cmd("history")
end)
vim.keymap.set("n", "<leader>nd", function()
  require("noice").cmd("dismiss")
end)









--------------------
--lspconfig---------
--------------------
require'lspconfig'.pyright.setup{
  capabilities = capabilities,
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}
require'lspconfig'.r_language_server.setup{}

--------------------
--Color theme------
--------------------
vim.cmd("colorscheme carbonfox")


