-- ~/.config/nvim/init.lua

-- Basic Settings
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.g.mapleader = " "  -- This sets the leader key to space
vim.o.mouse = 'a' -- mouse mode

-- Plugin Management with lazy.nvim
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

  -- New Plugins
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {
      keys = 'etovxqpdygfblzhckisuran'
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    }
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- No need to add any options here, defaults work well
    },
    lazy = false,
  },
})

-- Treesitter Configuration
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "javascript", "html", "css" },
  highlight = {
    enable = true,
  },
}

-- LSP Configuration
local nvim_lsp = require('lspconfig')

nvim_lsp.ruff_lsp.setup{}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').ruff_lsp.setup{
    capabilities = capabilities
}

nvim_lsp.ruff_lsp.setup{
  cmd = {"..."}, -- Replace with the actual path from `which ruff-lsp`
}

-- Keymaps
vim.api.nvim_set_keymap('n', '<C-p>', ':lua require("telescope.builtin").find_files({ hidden = true, no_ignore = true })<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep({ vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--glob', '!.git' } })<cr>", { noremap = true, silent = true })


-- Setup for new plugins
require('hop').setup()
require('which-key').setup()

-- Example keybinding for hop.nvim
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>HopWord<cr>", {noremap = true, silent = true})
