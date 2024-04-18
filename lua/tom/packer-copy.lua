-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  "folke/tokyonight.nvim",
	  lazy = false,
	  priority = 1000,
	  opts = {},
  }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use {'ThePrimeagen/harpoon'}
  use {'mbbill/undotree'}
  use {'tpope/vim-fugitive'}
  use {'github/copilot.vim'}
  use {
	  'CopilotC-Nvim/CopilotChat.nvim',
	  config = function()
		  local copilot_chat = require("CopilotChat")
		  copilot_chat.setup({
			  debug = true,
			  show_help = "yes",
			  prompts = {
				  Explain = "Explain how it works by English language.",
				  Review = "Review the following code and provide concise suggestions.",
				  Tests = "Briefly explain how the selected code works, then generate unit tests.",
				  Refactor = "Refactor the code to improve clarity and readability.",
			  },
			  proxy = "******",
			  build = function()
				  vim.notify(
				  "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
			  end,
			  event = "VeryLazy",
			  dependencies = {
				  { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
				  { "nvim-lua/plenary.nvim" }
			  }
		  })
	  end
  }
end)


