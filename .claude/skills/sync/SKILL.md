---
description: Recalibra docs/tasks.md após mudanças no PRD. Use ao dizer "/sync", "sincronizar tasks", "atualizar tasks do PRD" ou "PRD mudou".
allowed-tools: Read Write Edit AskUserQuestion
---

# /sync — Recalibrar tasks a partir do PRD

Quando o PRD muda, as tasks precisam acompanhar. Esta skill **não gera código**: só alinha `docs/tasks.md` com `docs/prd.md`.

## Pré-condições
- Existem `docs/prd.md` e `docs/tasks.md`. Se faltar um deles, pare e diga o que criar primeiro (`/start` ou templates).
- Se o PRD mudou de escopo e o **Histórico de Revisões** não foi atualizado, avise e ofereça acrescentar uma linha de changelog antes de seguir.

## Passos

1. **Ler fontes:** Leia `docs/prd.md` (visão, MoSCoW, user stories, fora de escopo, stack) e `docs/tasks.md` completo.
2. **Diff mental (5–10 bullets):** Resuma o que no PRD parece novo, removido, re-priorizado ou sem task correspondente. Inclua tasks órfãs (sem RF/US no PRD atual).
3. **Proposta de patch (não aplique ainda):** Liste mudanças concretas:
   - **Adicionar** tasks novas (id sugerido, `[M]`/`[S]`/`[C]`, **PRD:**, **DoD:**, blockers).
   - **Editar** tasks existentes (título, prioridade, PRD/US, DoD, blockers) — preserve `[x]` se o trabalho feito ainda for válido.
   - **Remover ou cancelar** tasks que contradizem fora de escopo / Won’t-have (prefira `- [ ] ~~texto~~ (cancelada: motivo)` a apagar histórico se já havia progresso).
   - **Reordenar** se dependências mudaram.
4. **Revisão humana:** Apresente a proposta e **espere confirmação**. Não sobrescreva `docs/tasks.md` sem aval.
5. **Aplicar:** Com o ok, edite `docs/tasks.md` de forma cirúrgica. Mantenha o formato do `@docs/tasks-template.md` (checkbox, prioridade, Blocker, **PRD:**, **DoD:**).
6. **Fecho:** Resuma o que mudou e indique a próxima task pendente elegível (sem blocker aberto). Sugira `/next` para continuar.

## Regras
- PRD manda; tasks obedecem. Não invente features no patch.
- Não reabra em massa tasks `[x]` só porque o PRD ganhou texto cosmético — só se o requisito da task de fato mudou.
- Não execute implementação aqui; se o usuário quiser codar, aponte para `/next`.
- Remova seções de tasks sem correspondente no PRD (não force LLM/deploy/observabilidade “por template”).
