local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable',
		lazypath
	})
end 
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'wbthomason/packer.nvim',
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'github/copilot.vim',
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' }},
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {}},
	{
    		"CopilotC-Nvim/CopilotChat.nvim",
    		branch = "canary",
    		dependencies = {
      			{ "github/copilot.vim" },
      			{ "nvim-lua/plenary.nvim" },
    		},
		opts = {
      		debug = true, -- Enable debugging
      -- See Configuration section for rest
    		},
    -- See Commands section for default commands if you want to lazy load on them
  	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "rust", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "css", "sql", "json", "typescript" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },  
			})
		end
	}
}

require('lazy').setup(plugins, opts)


