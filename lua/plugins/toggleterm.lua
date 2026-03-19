return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shade_terminals = false,
      })

      local Terminal = require("toggleterm.terminal").Terminal

      -- Terminal normal fixo na parte de baixo com altura menor
      local terminal = Terminal:new({
        direction = "horizontal",
        size = 10,
        hidden = true,
        on_open = function()
          vim.cmd("wincmd J")
          vim.cmd("resize 10")
        end,
      })

      -- Opencode fixo na direita
      local opencode = Terminal:new({
        cmd = "opencode",
        direction = "vertical",
        size = 60,
        hidden = true,
        on_open = function()
          vim.cmd("wincmd L")
          vim.cmd("vertical resize 60")
        end,
      })

      vim.keymap.set("n", "<C-t>", function()
        terminal:toggle()
      end, {})

      vim.keymap.set("n", "<leader>ai", function()
        opencode:toggle()
      end, {})

      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
      vim.keymap.set("t", "jj", "<C-\\><C-n>", {})
    end
  }
}
