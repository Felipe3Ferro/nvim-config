# nvim-config

Configuração pessoal do Neovim usando Lua, organizada em arquivos separados para facilitar a manutenção e escalabilidade. Construída do zero com foco em desenvolvimento Java com Spring Boot.

---

## Requisitos

- Neovim 0.11+
- Git
- Homebrew (Mac)

---

## Instalação Rápida

```bash
# Clone o repositório
git clone https://github.com/Felipe3Ferro/nvim-config ~/.config/nvim

# Instale as dependências externas
brew install ripgrep
brew install --cask font-jetbrains-mono-nerd-font
brew install anomalyco/tap/opencode
```

> Após instalar a fonte, configure o iTerm2: **Settings → Profiles → Text → Font → JetBrainsMono Nerd Font**

Abra o Neovim e os plugins serão instalados automaticamente pelo Lazy.

---

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
        ├── gitsigns.lua      # Indicadores do Git
        ├── mason.lua         # Gerenciador de servidores LSP
        ├── lsp.lua           # Configuração do servidor Java (jdtls)
        ├── cmp.lua           # Motor de autocomplete
        └── conform.lua       # Formatação automática ao salvar
```

---

## Dependências Externas

```bash
# Necessário para o live_grep do Telescope funcionar
brew install ripgrep

# Fonte com ícones (necessário para os ícones do Neo-tree e Lualine)
brew install --cask font-jetbrains-mono-nerd-font

# Assistente de IA no terminal
brew install anomalyco/tap/opencode

# Modelo de IA local especializado em código (requer Ollama instalado)
ollama pull qwen2.5-coder:14b
```

### Configuração do modelo Ollama com contexto maior

```bash
ollama run qwen2.5-coder:14b
/set parameter num_ctx 16384
/save qwen2.5-coder:14b-16k
/bye
```

### Configuração do opencode para usar Ollama local

Arquivo `~/.config/opencode/opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "ollama": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "Ollama (local)",
      "options": {
        "baseURL": "http://localhost:11434/v1"
      },
      "models": {
        "qwen2.5-coder:14b-16k": {
          "name": "Qwen2.5 Coder 14B"
        }
      }
    }
  }
}
```

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

### Opencode (IA)

| Atalho | O que faz |
|--------|-----------|
| `Espaço + ai` | Abre o opencode na lateral direita |

### Autocomplete (nvim-cmp)

| Atalho | O que faz |
|--------|-----------|
| `Ctrl + Space` | Abre o autocomplete manualmente |
| `Enter` | Confirma a sugestão selecionada |
| `Tab` | Navega para a próxima sugestão |
| `Shift + Tab` | Navega para a sugestão anterior |

### Atalhos dentro do Neo-tree

| Tecla | O que faz |
|-------|-----------|
| `a` | Cria um novo arquivo |
| `d` | Deleta o arquivo |
| `r` | Renomeia o arquivo |
| `q` | Fecha a árvore |
| `H` | Mostra/esconde arquivos ocultos |
| `R` | Recarrega a árvore |

### Atalhos úteis do Vim

| Atalho | O que faz |
|--------|-----------|
| `gg` | Vai para o início do arquivo |
| `G` | Vai para o final do arquivo |
| `gg"+yG` | Copia o arquivo inteiro para o clipboard do sistema |
| `jj` | Sai do modo insert (alternativa ao Esc) |
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

### Mason
Gerenciador de servidores LSP. Instala e gerencia o `jdtls` (servidor Java) automaticamente.

```
:Mason       # abre a interface
i            # instala o servidor selecionado
```

### nvim-lspconfig
Configura a comunicação entre o Neovim e o servidor Java (`jdtls`). Habilita funcionalidades de IDE como ir para definição, erros em tempo real e hover com documentação.

### nvim-cmp
Motor de autocomplete. Sugestões baseadas no LSP, no texto do buffer atual e em caminhos de arquivo.

### Conform
Formatação automática ao salvar. Usa o `google-java-format` para Java e faz fallback para o LSP quando necessário.

### Opencode
Assistente de IA no terminal integrado ao Neovim. Roda localmente via Ollama com o modelo `qwen2.5-coder:14b` — sem custo e sem internet.

Comandos úteis dentro do opencode:

| Comando | O que faz |
|---------|-----------|
| `/models` | Troca o modelo de IA |
| `/exit` | Fecha o opencode |

---

## Gerenciador de Plugins

Usa o **lazy.nvim** para gerenciar todos os plugins. Comandos úteis:

| Comando | O que faz |
|---------|-----------|
| `:Lazy` | Abre a interface do gerenciador |
| `:Lazy sync` | Instala/atualiza todos os plugins |
| `:Lazy clean` | Remove plugins não utilizados |
