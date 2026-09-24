# Process Task List – Guia de Execução com PRD + LLM

> Objetivo: descrever como rodar o loop **PRD + Task List** no dia a dia.
> O **porquê** de cada etapa está em `guide.md`; os moldes estão em `docs/*-template.md`.

---

## 1. Arquivos envolvidos

Recomendação mínima:

- `docs/idea.md` – descrição inicial do problema/ideia
- `docs/prd.md` – Product Requirements Document (fonte de verdade)
- `docs/tasks.md` – lista de tarefas derivadas do PRD

---

## 2. Ordem do fluxo

Fluxo PRD-driven / Spec-driven:

1. Discovery / Ideia → `docs/idea.md`
2. PRD / Spec → `docs/prd.md`
3. Task List → `docs/tasks.md`
4. Execução (humano + IA) → código, configs, etc.

Regra: **No PRD, no code** – não começar a codar antes de ter um PRD minimamente consistente.

---

## 3. O loop com skills (modo padrão)

Em agentes com skills (Claude Code via `.claude/skills/`, Google Antigravity via `.gemini/skills/`):

| Skill | O que faz | Quando usar |
|---|---|---|
| `/start` | Entrevista você para a ideia, gera `prd.md` e `tasks.md`, entra no loop de execução | Projeto do zero. Aceita pitch: `/start app de finanças` |
| `/next` | Executa a próxima task pendente (respeita `Blocker:`, roda o DoD, marca `[x]`) | Dia a dia |
| `/sync` | Recalibra `tasks.md` depois que o PRD mudou (propõe patch, espera aval) | Sempre que o PRD mudar |
| `/status` | Dashboard: progresso por prioridade, blockers ativos, próxima task elegível | Retomar contexto |

As skills retomam na primeira fase incompleta — rodar `/start` num projeto que já tem `prd.md`
não recomeça do zero.

> Em projetos recém-copiados, reinicie o assistente para carregar as skills.

### Modo manual (sem skills)

Se o seu agente não carrega skills, os prompts base de cada etapa (gerar PRD, gerar tasks,
executar uma task, recalibrar após mudança) estão em `guide.md`, seções 2.4, 3.4, 4.4 e 5.3.
O fluxo é o mesmo; muda só quem escreve o prompt.

---

## 4. Princípios da execução

Valem nos dois modos:

- **Uma task por vez**: do começo ao fim, antes de pegar a próxima.
- **Contexto explícito**: sempre `docs/prd.md` + a task em questão.
- **Especificação manda**: se algo contraria o PRD, pare e avise — não invente requisitos.
- **Mudanças cirúrgicas**: só os arquivos que a task exige, sem refatorar "de passagem".
- **DoD antes do `[x]`**: marque concluída só depois de rodar a validação (ou declare o gap).
- **Proposição ativa de DoD**: se você não souber como testar, a IA propõe os comandos/testes
  com base na Stack do PRD.

---

## 5. Revisão humana (não é opcional)

### 5.1 Do PRD

- Ler com atenção; corrigir o que estiver desalinhado com a realidade do projeto.
- Adicionar o que a IA não tem como saber: contexto de negócio, constraints internas.
- O PRD está "pronto o suficiente" quando toda user story tem critério de aceitação e o fora de
  escopo está explícito.

### 5.2 Das tasks

- Ajustar ordem, prioridades (`[M]`/`[S]`/`[C]`) e dependências (`Blocker: X.Y`).
- Dividir tasks grandes demais (alvo: 1–2h cada).
- Remover seções sem correspondente no PRD — não force deploy/LLM/observabilidade "por template".

### 5.3 Do código

- Revisar diffs contra os critérios de aceitação do PRD, não contra a descrição da task.
- Conferir o que a IA declarou **não** ter verificado.

---

## 6. Atualizações durante o projeto

### 6.1 Quando atualizar o PRD

- Requisitos mudaram.
- Nova persona / caso de uso importante.
- Stack ou restrições técnicas mudaram.
- Uma suposição inicial se provou errada.

Sempre atualize junto o **Histórico de Revisões** — é ele que impede a IA de aplicar mudanças
conflitantes depois.

### 6.2 Quando atualizar o Task List

- Task concluída → `[x]` (só com o DoD cumprido).
- PRD mudou → `/sync` **antes** de continuar a codar.
- Nova necessidade derivada do PRD.
- Repriorização (trocar Must/Should/Could).

---

## 7. Boas práticas gerais

- **Documentar antes de codar**: atualizar o PRD antes de pedir mudanças grandes à LLM.
- **Tasks pequenas**: menos complexidade, menos erro, contexto menor.
- **Feedback constante**: revisar PRD e tasks no fim de cada fase.
- **Evitar prompts soltos**: sempre referenciar PRD/tasks nas conversas com a LLM.

---

## 8. Checklist rápido

Antes de começar a codar:

- [ ] Existe um `docs/idea.md` com problema/objetivos claros?
- [ ] Existe um `docs/prd.md` com requisitos e user stories?
- [ ] Existe um `docs/tasks.md` com tasks pequenas e priorizadas?
- [ ] A LLM foi instruída a seguir PRD + tasks, e não prompts soltos?

Durante o desenvolvimento:

- [ ] Cada task parte do PRD, não de "lembranças" da IA.
- [ ] As mudanças são revisadas contra critérios de aceitação do PRD.
- [ ] PRD e tasks são atualizados quando requisitos mudam.

Se tudo isso estiver em dia, você está realmente fazendo **PRD-driven / Spec-driven development**
com suporte de LLM, e não apenas "vibe coding".
