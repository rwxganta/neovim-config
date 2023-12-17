-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Adjust split location
vim.opt.splitbelow = true
vim.opt.splitright = true

-- tab size
vim.opt.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- keep cursor in the middle while scrolling
vim.opt.scrolloff = 9999

vim.o.virtualedit = 'block'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- move UP-DOWN highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Indent while remaining in visual mode.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Trying to solve the :W problem .-.
vim.keymap.set('c', 'W', ':w<CR>', { noremap = true, silent = true })


-- LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins

local plugins = {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = false,
		priority = 1000
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate'
	},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
}

local opts = {}
require('lazy').setup(plugins, opts)


-- theme
require('catppuccin').setup()
vim.cmd.colorscheme 'catppuccin'

-- Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {"lua", "javascript"},
	highlight = { enable = true },
	indent = { enable = true },
})

-- telescope
local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})

require("nvim-treesitter.configs").setup({
  ensure_installed = {'lua', 'javascript', 'html', 'css'},
  highlight = { enable = true },
  indent = { enable = true },  
})

