return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  }, 
  {

    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
 
    }
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities
      })
      lspconfig.black.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.phpactor.setup({
  cmd = { "phpactor", "language-server" },
  filetypes = { "php", "blade" },
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
  init_options = {
    ["language_server_worse_reflection.inlay_hints.enable"] = true,
    ["language_server_worse_reflection.inlay_hints.params"] = true,
    -- ["language_server_worse_reflection.inlay_hints.types"] = true,
    ["language_server_configuration.auto_config"] = false,
    ["code_transform.import_globals"] = true,
    ["language_server_phpstan.enabled"] = true,
    ["language_server_phpstan.level"] = 7,
    ["language_server_phpstan.bin"] = "phpstan",
  },
})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
