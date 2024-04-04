return {
		"zbirenbaum/copilot.lua",
		event = "VimEnter",
		config = function()
			vim.defer_fn(function()
				require('copilot').setup {
					suggestion = { auto_trigger = true }
				}
			end, 100)
		end,
	}
