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
   - **Dica**: Use a skill **`/next`** para continuar o desenvolvimento de onde parou. Ela identifica a próxima task pendente e retoma a execução com base no PRD.
3. Prefere manual? Preencha nesta ordem:
   - `docs/idea.md` — a partir de `docs/idea-template.md`
   - `docs/prd.md` — a partir de `docs/prd-template.md` (fonte de verdade)
   - `docs/tasks.md` — a partir de `docs/tasks-template.md`

   e execute as tasks seguindo `docs/process-task-list.md`. **No PRD, no code.**

> As skills (`/start` e `/next`) ficam em `.claude/skills/`. Numa cópia nova do template
> elas só aparecem após reiniciar o Claude Code (o diretório precisa existir na
> abertura da sessão).

## Destaques do Template

- **Histórico de Revisões**: O template de PRD (`docs/prd-template.md`) exige documentar o log de alterações (Changelog) para evitar que a IA se perca ao longo do tempo.
- **TDD via BDD (Gherkin)**: O template exige Critérios de Aceitação no formato `Given/When/Then`, forçando a IA a criar e passar em testes antes de finalizar implementações reais.
- **Gestão de Dependências de Tarefas**: O arquivo de tarefas usa anotações como `(Blocker: 1.1)` que a skill `/next` entende para impedir que a IA execute tarefas fora de ordem.

## Arquivos

| Arquivo | Papel |
|---|---|
| `guide.md` | Explicação conceitual do fluxo completo |
| `docs/process-task-list.md` | Guia operacional do loop com a LLM |
| `docs/*-template.md` | Moldes de idea, PRD e tasks |
| `.claude/skills/` | Skills `/start` e `/next` que conduzem o fluxo via IA |
| `CLAUDE.md` | Regras de operação lidas pelo Claude Code |
