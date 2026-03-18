return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("jdtls", {})
      vim.lsp.enable("jdtls")
    end
  }
}
