local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

vim.opt.rtp:prepend(lazypath)
vim.api.nvim_set_option("clipboard", "unnamed")
require("vim-options")
vim.opt.clipboard = 'unnamedplus'
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
})
