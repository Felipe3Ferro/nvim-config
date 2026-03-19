return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- Terminal normal fixo na parte de baixo
      local terminal = Terminal:new({
        direction = "horizontal",
        size = 15,
        hidden = true,
        on_open = function(term)
          vim.cmd("wincmd J") -- força ir para baixo sempre
        end,
      })

      -- Opencode fixo na direita
      local opencode = Terminal:new({
        cmd = "opencode",
        direction = "vertical",
        size = 60,
        hidden = true,
        on_open = function(term)
          vim.cmd("wincmd L") -- força ir para direita sempre
        end,
      })

      -- Ctrl+T: abre/fecha o terminal de baixo
      vim.keymap.set("n", "<C-t>", function()
        terminal:toggle()
      end, {})

      -- Espaço+ai: abre/fecha o opencode na direita
      vim.keymap.set("n", "<leader>ai", function()
        opencode:toggle()
      end, {})

      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
      vim.keymap.set("t", "jj", "<C-\\><C-n>", {})
    end
  }
}
