return {
  -- TREESITTER: parsing de código
  -- Responsável por: syntax highlighting, indentação inteligente e code folding
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.config")
      config.setup({
        ensure_installed = { "lua", "javascript" },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }
}
