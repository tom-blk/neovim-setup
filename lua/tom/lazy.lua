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
    		},
  	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"c", "lua", "vim", "vimdoc", "query", "typescript", "tsx", "javascript", "css", "rust", "html", "json", "toml", "dockerfile", "bash", "sql", "scss"},
				
				auto_install = true,

				highlight = {
					enable = true,
				},


				indent = {
					enable = true,
				},
			})
		end,
	}
}
require('lazy').setup(plugins, opts)


