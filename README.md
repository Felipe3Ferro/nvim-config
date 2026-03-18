# Branch: feature/lsp-java

Adições feitas nessa branch para desenvolvimento Java com Spring Boot.

---

## Estrutura de Arquivos Adicionada

```
~/.config/nvim/lua/plugins/
├── mason.lua       # Gerenciador de servidores LSP
├── lsp.lua         # Configuração do servidor Java (jdtls)
├── cmp.lua         # Motor de autocomplete
└── conform.lua     # Formatação automática ao salvar
```

---

## Dependências Externas Adicionadas

```bash
# Assistente de IA no terminal
brew install anomalyco/tap/opencode

# Modelo de IA local especializado em código
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

## Novo Atalho de Teclado

| Atalho | O que faz |
|--------|-----------|
| `Espaço + ai` | Abre o opencode na lateral direita |

---

## Nova Opção Adicionada em options.lua

```lua
-- Recarrega o arquivo automaticamente quando ele muda no disco
-- Necessário para ver as mudanças feitas pelo opencode em tempo real
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "checktime"
})
```

---

## Plugins Adicionados

### Mason
Gerenciador de servidores LSP. Instala e gerencia o `jdtls` (servidor Java) automaticamente.

Para abrir a interface e instalar servidores manualmente:
```
:Mason
```

### nvim-lspconfig
Configura a comunicação entre o Neovim e o servidor Java (`jdtls`). Habilita funcionalidades de IDE como ir para definição, erros em tempo real e hover com documentação.

### nvim-cmp
Motor de autocomplete. Sugestões baseadas no LSP, no texto do buffer atual e em caminhos de arquivo.

| Atalho | O que faz |
|--------|-----------|
| `Ctrl + Space` | Abre o autocomplete manualmente |
| `Enter` | Confirma a sugestão selecionada |
| `Tab` | Navega para a próxima sugestão |
| `Shift + Tab` | Navega para a sugestão anterior |

### Conform
Formatação automática ao salvar. Usa o `google-java-format` para Java e faz fallback para o LSP quando necessário.

### Opencode
Assistente de IA no terminal integrado ao Neovim. Roda localmente via Ollama com o modelo `qwen2.5-coder:14b` — sem custo e sem internet.

Comandos úteis dentro do opencode:

| Comando | O que faz |
|---------|-----------|
| `/models` | Troca o modelo de IA |
| `/exit` | Fecha o opencode |
