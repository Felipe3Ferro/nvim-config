return {
  -- TELESCOPE: busca fuzzy de arquivos e texto
  -- Ctrl+P para buscar arquivos
  -- Espaço+fg para buscar texto dentro dos arquivos (requer ripgrep: brew install ripgrep)
  {
    "nvim-telescope/telescope.nvim", 
    dependencies = { "nvim-lua/plenary.nvim" }
  }
}
