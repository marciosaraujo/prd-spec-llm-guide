# AGENTS.md

Kit de **PRD-driven / Spec-driven development** com LLM. Os arquivos aqui são templates e guias reutilizáveis — não um produto.

Este arquivo é a fonte de regras para agentes (Cursor, Codex, Grok Build, etc.). O `CLAUDE.md` espelha as mesmas regras para o Claude Code.

## Arquivos
- `guide.md` — explicação conceitual do fluxo (leitura de fundo).
- `docs/process-task-list.md` — guia operacional: como rodar o loop com a LLM.
- `docs/idea-template.md`, `docs/prd-template.md`, `docs/tasks-template.md` — moldes vazios.
- Skills em `.claude/skills/` e `.gemini/skills/`: `/start`, `/next`, `/sync`.

## Fluxo
`idea.md` → `prd.md` → `tasks.md` → execução. **No PRD, no code**: não codar antes de ter um PRD minimamente consistente.
- `/start` — bootstrap do zero (idea → prd → tasks → execução).
- `/next` — próxima task pendente.
- `/sync` — recalibra `tasks.md` após mudanças no PRD.

## Regras ao trabalhar num projeto que usa este kit
- `prd.md` é a **fonte de verdade**. Código e tasks obedecem ao PRD, não o contrário.
- **Uma task por vez**, do começo ao fim. Antes de codar, peça/confirme qual a próxima task.
- Se algo contraria o PRD, **pare e avise** — não invente requisitos nem mude escopo.
- Templates são moldes: copie para `docs/*.md` e preencha; não edite os `*-template.md`.
- Prefira a solução mais simples consistente com a seção de Stack do PRD.
- **Mudanças cirúrgicas**: toque só nos arquivos que a task exige; não mexa fora do escopo nem refatore "de passagem".
- **Ao terminar a task, valide** (teste/lint/build focado) e diga o que ficou **sem verificar** — não afirme que passou se não rodou.
- Se o escopo do produto mudar, atualize `docs/prd.md` (incluindo **Histórico de Revisões**) e rode `/sync` antes de continuar a codar.
- Cada task em `docs/tasks.md` deve ter **link ao PRD/US** e **DoD** verificável; marque `[x]` só quando o DoD for cumprido (ou declare explicitamente o que falta).
