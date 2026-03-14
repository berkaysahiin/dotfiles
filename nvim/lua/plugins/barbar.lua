return
{
		"romgrk/barbar.nvim",
		lazy = false,
		dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
		init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
		config = function(_, opts)
			require("barbar").setup(opts)

			local map = vim.keymap.set
			local map_opts = { noremap = true, silent = true }

			map('n', '<C-n>', '<Cmd>BufferNext<CR>', map_opts)
			map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', map_opts)
			map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', map_opts)
			map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', map_opts)
			map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', map_opts)
			map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', map_opts)
			map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', map_opts)
			map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', map_opts)
			map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', map_opts)
			map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', map_opts)
			map('n', '<A-0>', '<Cmd>BufferLast<CR>', map_opts)
		end,
}
