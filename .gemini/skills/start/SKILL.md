---
description: Inicia um projeto PRD-driven do zero. Entrevista o usuário para preencher a ideia, gera prd.md e tasks.md e executa as tasks uma por vez. Use ao dizer "/start", "começar projeto", "iniciar projeto" ou "tocar o fluxo do início".
argument-hint: "[pitch curto da ideia (opcional)]"
allowed-tools: Read Write Edit AskUserQuestion Bash
---

# /start — bootstrap PRD-driven

Conduz o fluxo `idea → prd → tasks → execução` deste kit. **No PRD, no code.**
Trabalhe em português, na linguagem direta dos templates. `guide.md`,
`AGENTS.md` e `docs/process-task-list.md` têm o detalhe se precisar.

Pitch inicial do usuário (pode estar vazio): $ARGUMENTS

Artefatos já existentes em `docs/`:
```!
ls -1 docs/idea.md docs/prd.md docs/tasks.md 2>/dev/null || echo "(nenhum ainda)"
```
Retome na **primeira fase incompleta** acima — não recomece o que já existe.
Confirme antes de sobrescrever qualquer arquivo.

## Regras transversais (todas as fases)
- `docs/prd.md` é a fonte de verdade. Se algo contrariar o PRD, **pare e avise**.
- Não invente requisitos nem mude escopo sem confirmação humana.
- Templates (`*-template.md`) são moldes: preencha cópias em `docs/`, não edite os moldes.
- Mudanças cirúrgicas: só o que a fase/task exige.
- Se o escopo do produto mudar depois, atualize o **Histórico de Revisões** do PRD e use `/sync` antes de seguir codando.

## Fase 1 — Ideia (`docs/idea.md`)
Não peça pro usuário escrever sozinho: **entreviste** seção a seção de
`@docs/idea-template.md` (problema, objetivo, usuário-alvo, benefícios, fora de
escopo). Uma ou duas perguntas por vez, sem questionário gigante. Foque em
problema e objetivo — **sem stack nem detalhe técnico** ainda. Ao ter respostas
suficientes, escreva `docs/idea.md` preenchido e peça confirmação.

## Fase 2 — PRD (`docs/prd.md`)
Com a ideia aprovada, gere `docs/prd.md` na estrutura de `@docs/prd-template.md`.
Não invente features fora do problema; marque Must/Should/Could/Won't; explicite
fora de escopo. Preencha o **Histórico de Revisões** (versão 1.0). Pergunte stack
e restrições técnicas aqui se ainda não souber.
Apresente e **espere revisão humana** — o PRD é a fonte de verdade.

## Fase 3 — Tasks (`docs/tasks.md`)
Com o PRD aprovado, gere `docs/tasks.md` na estrutura de `@docs/tasks-template.md`:
- Tasks numeradas, escopo pequeno (1–2h), prioridade `[M]`/`[S]`/`[C]`.
- Cada task com **PRD:** (RFs/USs) e **DoD:** verificável.
- Dependências explícitas `(Blocker: X.Y)` quando necessário.
- Remova seções sem correspondente no PRD — não invente deploy/CI/LLM se o PRD não pedir.
- Não gere código. Peça revisão de ordem e prioridade.

## Fase 4 — Execução (loop)
Uma task por vez, do começo ao fim:
1. Confirme com o usuário a próxima task (respeite blockers).
2. Resuma em até 5 frases as partes do PRD que ela toca (use o campo **PRD:** da task).
3. Plano curto (3–5 bullets: arquivos, componentes, ligação com o PRD).
4. Se a task/US tiver critérios Gherkin, prefira TDD: teste primeiro, depois código.
5. Implemente o mínimo, na solução mais simples consistente com a Stack do PRD.
6. **Validação obrigatória:** rode o que o DoD pede (teste/lint/build focado). Liste o que **não** foi verificado — não afirme que passou se não rodou.
7. Marque `[x]` em `docs/tasks.md` **somente** se o DoD foi cumprido; senão deixe pendente e declare o gap.

Se algo contrariar o PRD, **pare e avise** — não mude escopo nem invente
requisitos. Atualize `prd.md` (com changelog) e rode `/sync` quando requisitos mudarem.
