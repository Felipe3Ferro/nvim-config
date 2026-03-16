return {
  -- GITSIGNS: indicadores de mudanças do git na lateral
  -- Mostra linhas adicionadas (verde), modificadas (laranja) e removidas (vermelho)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
}
