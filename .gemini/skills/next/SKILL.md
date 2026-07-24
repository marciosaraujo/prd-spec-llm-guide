---
description: Executa a próxima tarefa disponível no docs/tasks.md baseando-se no PRD. Use ao dizer "/next", "próxima tarefa", "próxima task" ou "continuar execução".
allowed-tools: Read Write Edit AskUserQuestion Bash
---

# /next — Continuar execução de task

Guia a execução da **próxima** tarefa do projeto. Uma task por vez. **No PRD, no code.**

## Regras
- `docs/prd.md` é a fonte de verdade. Se a task exigir algo fora do PRD, **pare e avise** — não invente requisitos nem mude escopo.
- Mudanças cirúrgicas: só arquivos necessários à task; sem refatoração "de passagem".
- Prefira a solução mais simples alinhada à Stack do PRD.
- Não marque `[x]` sem cumprir o **DoD** (ou sem declarar explicitamente o que falta).
- Se o PRD mudou desde a última execução e as tasks parecem desatualizadas, sugira `/sync` antes de codar.

## Passos

1. **Identificação:** Leia `docs/tasks.md`. Localize a primeira task pendente (sem `[x]`).
2. **Dependências:** Se houver `(Blocker: X.Y)` ou `(Depende de X)` e o bloqueador não estiver `[x]`, proponha o bloqueador primeiro.
3. **Confirmação:** Informe a task escolhida (id, prioridade, PRD/US, DoD) e peça permissão para planejar.
4. **Resumo e plano:** Com o aval, leia `docs/prd.md`. Resuma em ≤5 frases a ligação task ↔ PRD. Plano em 3–5 bullets (arquivos, componentes, critérios Gherkin relevantes).
5. **Execução:** Implemente o mínimo viável na stack do PRD.
   - Se houver critérios BDD/Gherkin na US ligada, faça TDD: escreva/rode o teste primeiro.
6. **Validação (obrigatória):**
   - Execute o que o **DoD** pede (comandos de teste/lint/build, smoke manual se aplicável).
   - Liste: o que rodou e passou; o que **não** foi verificado.
   - Não afirme "passou" sem ter rodado.
7. **Finalização:**
   - Se DoD cumprido → marque `[x]` em `docs/tasks.md` e diga como o usuário pode revalidar.
   - Se DoD incompleto → **não** marque `[x]`; deixe claro o gap e o próximo passo.
