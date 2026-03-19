local builtin = require("telescope.builtin")

-- ============================================================
-- MODOS
-- ============================================================
vim.keymap.set("i", "jj", "<Esc>", {})
vim.keymap.set("t", "jj", "<C-\\><C-n>", {})
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

-- ============================================================
-- RECARREGAMENTO AUTOMÁTICO DE ARQUIVOS
-- ============================================================
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime"
})

-- ============================================================
-- NAVEGAÇÃO ENTRE JANELAS
-- ============================================================
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

-- ============================================================
-- MOVER LINHAS
-- ============================================================
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- ============================================================
-- TELESCOPE
-- ============================================================
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- ============================================================
-- NEO-TREE
-- ============================================================
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree filesystem reveal left<CR>", {})
vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>", {})

-- ============================================================
-- TERMINAL (gerenciado pelo toggleterm)
-- ============================================================
-- Ctrl+T: abre/fecha o terminal de baixo
-- Espaço+ai: abre/fecha o opencode na direita
-- (esses atalhos estão definidos no plugins/toggleterm.lua)

-- ============================================================
-- LAYOUT INICIAL
-- ============================================================
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree filesystem reveal left")
    vim.cmd("wincmd l")
  end
})
