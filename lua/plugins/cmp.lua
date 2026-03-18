return {
  -- NVIM-CMP: motor de autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- autocomplete baseado no LSP
      "hrsh7th/cmp-buffer",   -- autocomplete baseado no texto do buffer
      "hrsh7th/cmp-path",     -- autocomplete de caminhos de arquivo
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          -- Ctrl+Space: abre o autocomplete manualmente
          ["<C-Space>"] = cmp.mapping.complete(),
          -- Enter: confirma a sugestão selecionada
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- Tab: navega para a próxima sugestão
          ["<Tab>"] = cmp.mapping.select_next_item(),
          -- Shift+Tab: navega para a sugestão anterior
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" }, -- sugestões do LSP
          { name = "buffer" },   -- sugestões do texto atual
          { name = "path" },     -- sugestões de caminhos
        }
      })
    end
  }
}
