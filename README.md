# PRD-Spec LLM Guide

Template para iniciar projetos em **PRD-driven / Spec-driven development** com uma LLM (Claude, etc.).

Fluxo: **Ideia → PRD/Spec → Task List → Execução (humano + IA)**.

## Como usar

1. Copie este repositório para o seu projeto novo:
   ```bash
   cp -r prd-spec-llm-guide meu-app-novo
   ```
   (ou clique em **Use this template** no GitHub)
2. No Claude Code, rode **`/start`** — ele entrevista você para preencher a
   ideia, gera `prd.md` e `tasks.md` e executa as tasks uma por vez. Opcional:
   passe um pitch, ex. `/start app de finanças pessoais`.
3. Prefere manual? Preencha nesta ordem:
   - `docs/idea.md` — a partir de `docs/idea-template.md`
   - `docs/prd.md` — a partir de `docs/prd-template.md` (fonte de verdade)
   - `docs/tasks.md` — a partir de `docs/tasks-template.md`

   e execute as tasks seguindo `docs/process-task-list.md`. **No PRD, no code.**

> A skill `/start` fica em `.claude/skills/start/`. Numa cópia nova do template
> ela só aparece após reiniciar o Claude Code (o diretório precisa existir na
> abertura da sessão).

## Arquivos

| Arquivo | Papel |
|---|---|
| `guide.md` | Explicação conceitual do fluxo completo |
| `docs/process-task-list.md` | Guia operacional do loop com a LLM |
| `docs/*-template.md` | Moldes de idea, PRD e tasks |
| `.claude/skills/start/` | Skill `/start` que conduz o fluxo do início |
| `CLAUDE.md` | Regras de operação lidas pelo Claude Code |
