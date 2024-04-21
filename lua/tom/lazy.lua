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
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'github/copilot.vim',
    'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/nvim-cmp',
	'L3MON4D3/LuaSnip',
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{ 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
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

				autotag = {
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


