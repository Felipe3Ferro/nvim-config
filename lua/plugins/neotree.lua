return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = {
            visible = true,      -- mostra arquivos ocultos
            hide_dotfiles = false, -- não esconde arquivos que começam com .
            hide_gitignored = false, -- não esconde arquivos do .gitignore
          }
        }
      })
    end
  }
}
