return{
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
