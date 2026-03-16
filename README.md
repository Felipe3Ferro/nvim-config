# Minha Configuração do Neovim

Configuração pessoal do Neovim usando Lua, organizada em arquivos separados para facilitar a manutenção.

## Estrutura de Arquivos

```
~/.config/nvim/
├── init.lua                  # Arquivo principal, carrega tudo
└── lua/
    ├── config/
    │   ├── options.lua       # Configurações do editor
    │   ├── keymaps.lua       # Atalhos de teclado
    │   └── lazy.lua          # Instalação do gerenciador de plugins
    └── plugins/
        ├── catppuccin.lua    # Tema de cores
        ├── telescope.lua     # Busca de arquivos e texto
        ├── treesitter.lua    # Syntax highlighting
        ├── neotree.lua       # Árvore de arquivos
        ├── lualine.lua       # Barra de status inferior
        └── gitsigns.lua      # Indicadores do Git
```

---

## Dependências Externas

Essas ferramentas precisam ser instaladas fora do Neovim, via Homebrew:

```bash
# Necessário para o live_grep do Telescope funcionar
brew install ripgrep

# Fonte com ícones (necessário para os ícones do Neo-tree e Lualine)
brew install --cask font-jetbrains-mono-nerd-font
```

> Após instalar a fonte, configure o iTerm2: **Settings → Profiles → Text → Font → JetBrainsMono Nerd Font**

---

## Atalhos de Teclado

A tecla líder (`<leader>`) é o **Espaço**.

### Navegação entre Janelas

| Atalho | O que faz |
|--------|-----------|
| `Ctrl + W + W` | Pula para a próxima janela (circula entre todas) |
| `Ctrl + H` | Move o foco para a janela da esquerda |
| `Ctrl + L` | Move o foco para a janela da direita |
| `Ctrl + J` | Move o foco para a janela de baixo (terminal) |
| `Ctrl + K` | Move o foco para a janela de cima (editor) |

### Telescope

| Atalho | O que faz |
|--------|-----------|
| `Ctrl + P` | Busca arquivos pelo nome no diretório atual |
| `Espaço + fg` | Busca texto dentro de todos os arquivos |

### Neo-tree

| Atalho | O que faz |
|--------|-----------|
| `Espaço + e` | Abre a árvore e destaca o arquivo atual |
| `Ctrl + N` | Abre/fecha a árvore de arquivos |

### Terminal

| Atalho | O que faz |
|--------|-----------|
| `Espaço + t` | Abre o terminal na parte de baixo |
| `Esc` | Sai do modo insert do terminal |

### Atalhos dentro do Neo-tree

| Tecla | O que faz |
|-------|-----------|
| `a` | Cria um novo arquivo |
| `d` | Deleta o arquivo |
| `r` | Renomeia o arquivo |
| `q` | Fecha a árvore |

### Atalhos úteis do Vim

| Atalho | O que faz |
|--------|-----------|
| `gg` | Vai para o início do arquivo |
| `G` | Vai para o final do arquivo |
| `gg"+yG` | Copia o arquivo inteiro para o clipboard do sistema |
| `:w` | Salva o arquivo |
| `:q` | Fecha a janela atual |
| `:wq` | Salva e fecha |
| `:q!` | Fecha sem salvar |
| `:qa` | Fecha todas as janelas de uma vez |
| `:resize 20` | Define a altura da janela para 20 linhas |

---

## Plugins

### Catppuccin
Tema de cores moderno aplicado no editor e na barra de status.

### Telescope
Busca fuzzy para encontrar arquivos pelo nome (`Ctrl+P`) ou pelo conteúdo (`Espaço+fg`). Requer o **ripgrep** instalado para o live grep funcionar.

### Treesitter
Faz o parsing do código para entregar syntax highlighting mais preciso, indentação inteligente e suporte a code folding. Parsers instalados automaticamente: `lua` e `javascript`.

### Neo-tree
Árvore de arquivos lateral. Abre na esquerda e permite navegar, criar, renomear e deletar arquivos sem sair do Neovim.

### Lualine
Barra de status na parte inferior do editor. Mostra:
- Modo atual (NORMAL, INSERT, VISUAL)
- Branch do Git
- Nome do arquivo
- Linha e coluna do cursor
- Percentual de posição no arquivo
- Tipo do arquivo

### Gitsigns
Mostra indicadores na lateral esquerda do editor com as mudanças do Git em relação ao último commit:
- Verde — linhas adicionadas
- Laranja — linhas modificadas
- Vermelho — linhas removidas

---

## Gerenciador de Plugins

Usa o **lazy.nvim** para gerenciar todos os plugins. Comandos úteis:

| Comando | O que faz |
|---------|-----------|
| `:Lazy` | Abre a interface do gerenciador |
| `:Lazy sync` | Instala/atualiza todos os plugins |
| `:Lazy clean` | Remove plugins não utilizados |
