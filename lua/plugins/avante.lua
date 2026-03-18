return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "folke/snacks.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("avante").setup({
        provider = "gemini",
        providers = {
          gemini = {
            api_key = os.getenv("GEMINI_API_KEY"),
            model = "gemini-2.5-flash",
          }
        }
      })
    end
  }
}
