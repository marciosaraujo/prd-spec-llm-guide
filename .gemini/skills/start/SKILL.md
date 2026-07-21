---
description: Inicia um projeto PRD-driven do zero. Entrevista o usuário para preencher a ideia, gera prd.md e tasks.md e executa as tasks uma por vez. Use ao dizer "/start", "começar projeto", "iniciar projeto" ou "tocar o fluxo do início".
argument-hint: "[pitch curto da ideia (opcional)]"
allowed-tools: Read Write Edit AskUserQuestion
---

# /start — bootstrap PRD-driven

Conduz o fluxo `idea → prd → tasks → execução` deste kit. **No PRD, no code.**
Trabalhe em português, na linguagem direta dos templates. `guide.md` e
`docs/process-task-list.md` têm o detalhe conceitual se precisar.

Pitch inicial do usuário (pode estar vazio): $ARGUMENTS

Artefatos já existentes em `docs/`:
```!
ls -1 docs/idea.md docs/prd.md docs/tasks.md 2>/dev/null || echo "(nenhum ainda)"
```
Retome na **primeira fase incompleta** acima — não recomece o que já existe.
Confirme antes de sobrescrever qualquer arquivo.

## Fase 1 — Ideia (`docs/idea.md`)
Não peça pro usuário escrever sozinho: **entreviste** seção a seção de
`@docs/idea-template.md` (problema, objetivo, usuário-alvo, benefícios, fora de
escopo). Uma ou duas perguntas por vez, sem questionário gigante. Foque em
problema e objetivo — **sem stack nem detalhe técnico** ainda. Ao ter respostas
suficientes, escreva `docs/idea.md` preenchido e peça confirmação.

## Fase 2 — PRD (`docs/prd.md`)
Com a ideia aprovada, gere `docs/prd.md` na estrutura de `@docs/prd-template.md`.
Não invente features fora do problema; marque Must/Should/Could/Won't; explicite
fora de escopo. Pergunte stack e restrições técnicas aqui se ainda não souber.
Apresente e **espere revisão humana** — o PRD é a fonte de verdade.

## Fase 3 — Tasks (`docs/tasks.md`)
Com o PRD aprovado, gere `docs/tasks.md` na estrutura de `@docs/tasks-template.md`:
tasks numeradas, escopo pequeno (1–2h), cada uma ligada a parte específica do PRD
e com resultado verificável. Não gere código. Sinalize Must/Should. Peça revisão
de ordem e prioridade.

## Fase 4 — Execução (loop)
Uma task por vez, do começo ao fim:
1. Confirme com o usuário a próxima task.
2. Resuma em até 5 frases as partes do PRD que ela toca.
3. Plano curto (3–5 bullets: arquivos, componentes, ligação com o PRD).
4. Implemente o mínimo, na solução mais simples consistente com a Stack do PRD.
5. Diga como testar e marque a task como `[x]` em `docs/tasks.md`.

Se algo contrariar o PRD, **pare e avise** — não mude escopo nem invente
requisitos. Atualize `prd.md`/`tasks.md` quando requisitos mudarem.
