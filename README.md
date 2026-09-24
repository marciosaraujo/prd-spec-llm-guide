# PRD-Spec LLM Guide

Template para iniciar projetos em **PRD-driven / Spec-driven development** com uma LLM (Claude, Cursor, Gemini, Grok, etc.).

Fluxo: **Ideia → PRD/Spec → Task List → Execução (humano + IA)**.

## Conceitos-Chave

- 📋 **PRD como fonte de verdade:** Em vez de prompts soltos (*"crie uma tela de login"*), define-se primeiro um PRD. A IA não inventa requisitos nem muda o escopo: consulta a especificação antes de propor qualquer código.
- 📜 **Histórico de Revisões (changelog do PRD):** Registro de alterações obrigatório. Quando um requisito muda, o changelog é atualizado para que a IA não perca contexto nem aplique mudanças conflitantes.
- 🔗 **Grafo de dependências (`Blocker: X.Y`):** Bloqueadores explícitos entre tasks. A IA nunca tenta construir a tela de checkout antes da API de pagamento (`/next` respeita a ordem).
- 🧪 **TDD via BDD (Gherkin):** Critérios de aceitação em `Given/When/Then`. Havendo US ligada à task, a IA escreve e roda o teste *antes* do código de produção.
- 🎯 **DoD verificável + link ao PRD:** Cada task carrega **PRD:** (RF/US) e **DoD:** (comando ou comportamento). `[x]` só quando a validação roda com sucesso — e se você não souber como testar, a IA propõe o DoD e os testes de acordo com a Stack do PRD.
- ⚡ **Skills nativas:** `/start` (bootstrap), `/next` (próxima task), `/sync` (recalibra tasks após mudança no PRD, com revisão humana), `/status` (dashboard por prioridade). Sem prompts gigantes no chat.

> O **porquê** de cada etapa está em `guide.md`.

## Como usar

1. Copie este repositório para o seu projeto novo:
   ```bash
   cp -r prd-spec-llm-guide meu-app-novo
   ```
   (ou clique em **Use this template** no GitHub)
2. No agente com skills, rode **`/start`** — ele entrevista você para preencher a
   ideia, gera `prd.md` e `tasks.md` e executa as tasks uma por vez. Opcional:
   passe um pitch, ex. `/start app de finanças pessoais`.
   - **`/next`** — continua na próxima task pendente (com DoD e validação).
   - **`/sync`** — recalibra `tasks.md` depois que o PRD mudar (sem gerar código).
   - **`/status`** — exibe o dashboard de progresso por prioridade, blockers e próxima task elegível.
3. Prefere manual? Preencha nesta ordem:
   - `docs/idea.md` — a partir de `docs/idea-template.md`
   - `docs/prd.md` — a partir de `docs/prd-template.md` (fonte de verdade)
   - `docs/tasks.md` — a partir de `docs/tasks-template.md`

   e execute as tasks seguindo `docs/process-task-list.md`. **No PRD, no code.**

> As skills (`/start`, `/next`, `/sync`, `/status`) ficam em `.claude/skills/` (Claude Code) e `.gemini/skills/` (Google Antigravity).  
> Regras para qualquer agente: `AGENTS.md` (e `CLAUDE.md` como espelho para Claude Code).  
> Em projetos recém-copiados, reinicie o assistente para carregar as skills.

## Arquivos

| Arquivo | Papel |
|---|---|
| `guide.md` | Explicação conceitual do fluxo completo |
| `docs/process-task-list.md` | Guia operacional do loop com a LLM |
| `docs/*-template.md` | Moldes de idea, PRD e tasks |
| `.claude/skills/` & `.gemini/skills/` | Skills `/start`, `/next`, `/sync`, `/status` |
| `AGENTS.md` | Regras de operação para agentes em geral |
| `CLAUDE.md` | Espelho das regras para Claude Code |
