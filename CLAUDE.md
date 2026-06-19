# CLAUDE.md

Kit de **PRD-driven / Spec-driven development** com LLM. Os arquivos aqui são templates e guias reutilizáveis — não um produto.

## Arquivos
- `guide.md` — explicação conceitual do fluxo (leitura de fundo).
- `docs/process-task-list.md` — guia operacional: como rodar o loop com a LLM.
- `docs/idea-template.md`, `docs/prd-template.md`, `docs/tasks-template.md` — moldes vazios.

## Fluxo
`idea.md` → `prd.md` → `tasks.md` → execução. **No PRD, no code**: não codar antes de ter um PRD minimamente consistente.

## Regras ao trabalhar num projeto que usa este kit
- `prd.md` é a **fonte de verdade**. Código e tasks obedecem ao PRD, não o contrário.
- **Uma task por vez**, do começo ao fim. Antes de codar, peça/confirme qual a próxima task.
- Se algo contraria o PRD, **pare e avise** — não invente requisitos nem mude escopo.
- Templates são moldes: copie para `docs/*.md` e preencha; não edite os `*-template.md`.
- Prefira a solução mais simples consistente com a seção de Stack do PRD.
- **Mudanças cirúrgicas**: toque só nos arquivos que a task exige; não mexa fora do escopo nem refatore "de passagem".
- **Ao terminar a task, valide** (teste/lint/build focado) e diga o que ficou **sem verificar** — não afirme que passou se não rodou.
