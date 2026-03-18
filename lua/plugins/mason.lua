return {
  -- MASON: gerenciador de servidores LSP
  -- Instala e gerencia o jdtls (servidor Java) e outros servidores
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  -- MASON-LSPCONFIG: ponte entre o mason e o lspconfig
  -- Facilita a configuração dos servidores instalados pelo mason
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Servidores que serão instalados automaticamente
        ensure_installed = { "jdtls" }
      })
    end
  }
}
