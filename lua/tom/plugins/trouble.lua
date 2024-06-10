return{
    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {},
        keys = {
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)"},
            { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Workspace Diagnostics (Trouble)"},
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Document Diagnostics (Trouble)"},
    	},
    },
}
