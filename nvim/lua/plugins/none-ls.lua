return {
    "nvimtools/none-ls.nvim",  -- Ensure this is the correct plugin name; it might be "jose-elias-alvarez/null-ls.nvim"
    config = function()
        local null_ls = require("null-ls")

        -- Define a custom diagnostics command for PHP_CodeSniffer
        local phpcs_diagnostics = null_ls.builtins.diagnostics.phpcs.with({
            extra_args = { "--standard=Moodle", "--runtime-set", "ignore_errors_on_exit", "1", "--runtime-set", "ignore_warnings_on_exit", "1" },
        })

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                -- Add the PHP_CodeSniffer diagnostics source
        null_ls.builtins.diagnostics.phpcs,
        --phpcs_diagnostics
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}

