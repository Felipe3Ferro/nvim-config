local builtin = require("telescope.builtin")

-- Ctrl+P: busca arquivos pelo nome
vim.keymap.set("n", "<C-p>", builtin.find_files, {})

-- Espaço+fg: busca texto dentro dos arquivos
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- Espaço+e: abre a árvore e destaca o arquivo atual
vim.keymap.set("n", "<leader>e", "<Cmd>Neotree filesystem reveal left<CR>", {})

-- Ctrl+N: abre/fecha a árvore
vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>", {})

-- Abre o terminal em uma janela horizontal na parte de baixo
vim.keymap.set("n", "<leader>t", "<Cmd>botright 15split | terminal<CR>", {})

-- Sai do modo insert do terminal com Escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})

-- Navegação entre janelas com Ctrl + setas
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
