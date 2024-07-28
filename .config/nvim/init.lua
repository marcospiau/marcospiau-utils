-- ~/.config/nvim/init.lua

-- Basic Settings
-- Enable line numbers
vim.opt.number = true
-- Enable relative line numbers
-- vim.opt.relativenumber = true
-- Number of spaces to use for a tab
vim.opt.tabstop = 4
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
-- Convert tabs to spaces
vim.opt.expandtab = true
-- Use smart indentation
vim.opt.smartindent = true
-- Ignore case when searching
vim.opt.ignorecase = true
-- Override ignorecase if search term contains uppercase
vim.opt.smartcase = true

-- Plugin Management with lazy.nvim
-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath('data')..'/site/pack/lazy/start/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--single-branch',
    'https://github.com/folke/lazy.nvim.git', lazypath
  })
end
-- Initialize lazy.nvim plugin manager
require('lazy').setup({
  -- Essential Plugins
  'nvim-treesitter/nvim-treesitter', -- Syntax highlighting and code navigation
  
  -- Python-Specific Plugins
  'nvim-telescope/telescope.nvim', -- Fuzzy finder
  'neovim/nvim-lspconfig', -- LSP support for code completion, etc.
  'astral-sh/ruff-lsp', -- Python LSP for linting and formatting

  -- Autocompletion Plugins
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  'hrsh7th/cmp-nvim-lsp', -- LSP completion source for nvim-cmp
  'hrsh7th/cmp-buffer', -- Buffer completion source for nvim-cmp
  'hrsh7th/cmp-path', -- Path completion source for nvim-cmp

  -- GitHub Copilot
  'github/copilot.vim', -- GitHub Copilot integration
})

-- Treesitter Configuration
-- Configure Treesitter for syntax highlighting and code navigation
require'nvim-treesitter.configs'.setup {
  -- Ensure maintained parsers are installed
  ensure_installed = { "python", "lua", "javascript", "html", "css" },
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
}

-- LSP Configuration
-- Setup LSP using ruff-lsp for Python
local nvim_lsp = require('lspconfig')

-- Configure ruff-lsp for Python
nvim_lsp.ruff_lsp.setup{}

-- Set up nvim-cmp for completion with LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').ruff_lsp.setup{
    capabilities = capabilities
}

-- Configure ruff-lsp for Python with an explicit path
-- nvim_lsp.ruff_lsp.setup{
--   cmd = {""}, -- Replace with the actual path from `which ruff-lsp`
-- }

-- Keymaps (optional)
-- Map <Leader>b to format code with Black (removed, since ruff-lsp handles formatting)
-- vim.api.nvim_set_keymap('n', '<Leader>b', ':Black<CR>', { noremap = true, silent = true })
-- Map <C-p> to open Telescope fuzzy finder
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })

