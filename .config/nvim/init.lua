local vim = vim
local Plug = vim.fn['plug#']
 
vim.call('plug#begin')
 
Plug('catppuccin/nvim', { as = 'catppuccin' })
Plug('nvim-tree/nvim-web-devicons')
Plug('nvim-tree/nvim-tree.lua')
Plug('nvim-lualine/lualine.nvim')

vim.call('plug#end')

home=os.getenv("HOME")
package.path = home .. "/.config/nvim/?.lua;" .. package.path
 
require "common"
dofile (home .. "/.config/nvim/theme.lua")
require "vimtree"
require "lualine"
