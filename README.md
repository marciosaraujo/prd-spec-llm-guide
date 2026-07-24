# PRD-Spec LLM Guide

Template para iniciar projetos em **PRD-driven / Spec-driven development** com uma LLM (Claude, Cursor, Gemini, Grok, etc.).

Fluxo: **Ideia → PRD/Spec → Task List → Execução (humano + IA)**.

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
3. Prefere manual? Preencha nesta ordem:
   - `docs/idea.md` — a partir de `docs/idea-template.md`
   - `docs/prd.md` — a partir de `docs/prd-template.md` (fonte de verdade)
   - `docs/tasks.md` — a partir de `docs/tasks-template.md`

   e execute as tasks seguindo `docs/process-task-list.md`. **No PRD, no code.**

> As skills (`/start`, `/next`, `/sync`) ficam em `.claude/skills/` (Claude Code) e `.gemini/skills/` (Google Antigravity).  
> Regras para qualquer agente: `AGENTS.md` (e `CLAUDE.md` como espelho para Claude Code).  
> Em projetos recém-copiados, reinicie o assistente para carregar as skills.

## Destaques do Template

- **Histórico de Revisões**: O PRD exige changelog para a IA não se perder ao longo do tempo.
- **TDD via BDD (Gherkin)**: Critérios de aceitação em `Given/When/Then`; skills pedem teste antes do código quando houver US ligada.
- **DoD + link ao PRD**: Cada task no template tem **PRD:** (RF/US) e **DoD:** verificável; `[x]` só com DoD cumprido.
- **Dependências**: `(Blocker: 1.1)` impede execução fora de ordem (`/next` respeita).
- **`/sync`**: Quando o PRD muda, propõe patch em `tasks.md` com revisão humana antes de aplicar.

## Arquivos

| Arquivo | Papel |
|---|---|
| `guide.md` | Explicação conceitual do fluxo completo |
| `docs/process-task-list.md` | Guia operacional do loop com a LLM |
| `docs/*-template.md` | Moldes de idea, PRD e tasks |
| `.claude/skills/` & `.gemini/skills/` | Skills `/start`, `/next`, `/sync` |
| `AGENTS.md` | Regras de operação para agentes em geral |
| `CLAUDE.md` | Espelho das regras para Claude Code |
