local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
      'nvim-tree/nvim-tree.lua',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
  }
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'l3mon4d3/luasnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'm4xshen/autoclose.nvim'
  use 'lervag/vimtex'
  use 'hrsh7th/cmp-buffer'       -- Added from your Plug configuration
  use 'hrsh7th/cmp-vsnip'        -- Added for vsnip support
  use 'hrsh7th/vim-vsnip'        -- Added for vsnip snippets

  -- telescope and lsp related plugins
  use{
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    requires = {{'nvim-lua/plenary.nvim' }}
  }
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

    require'lspconfig'.clangd.setup{}
    require('lspconfig').arduino_language_server.setup {
        cmd = {
            "arduino-language-server",
            "-cli-config", "~/.arduino15/arduino-cli.yaml",
            "-fqbn", "arduino:avr:uno", -- Replace with your board's FQBN
        },
    }

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)

