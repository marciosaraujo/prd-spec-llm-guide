# Process Task List – Guia de Execução com PRD + LLM

> Objetivo: descrever como usar **PRD + Task List** com uma LLM (Claude, etc.) para implementar um projeto de forma estruturada.

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

## 3. Criando o PRD com ajuda da LLM

### 3.1 Ponto de partida

1. Você escreve um rascunho de `docs/idea.md`.
2. Usa a LLM para refinar a ideia, se necessário.

### 3.2 Prompt base para gerar PRD

Use algo nesta linha:

```text
Quero usar PRD-driven development.

Aqui está minha ideia inicial: @docs/idea.md

Gere um PRD em @docs/prd.md com a seguinte estrutura:

- Visão geral (contexto, problema, objetivos de negócio e do usuário, fora de escopo)
- Personas e usuários
- Requisitos funcionais (MoSCoW)
- Fluxos principais e casos de borda
- Requisitos não funcionais (performance, segurança, escalabilidade, confiabilidade, compliance, custos)
- Stack e restrições técnicas (sem decidir tudo, mas listando preferências e limitações)
- Modelo de dados em alto nível
- User stories com critérios de aceitação
- Diretrizes para LLM (se aplicável)
- Métricas de sucesso
- Riscos e questões em aberto

Regras:
- Não inventar features fora do problema descrito.
- Usar linguagem direta e concisa.
- Explicitar o que é Must/Should/Won’t.
```

### 3.3 Revisão humana

- Ler o PRD com atenção.
- Corrigir partes desalinhadas com a realidade do projeto.
- Adicionar detalhes que a IA não conhece (contexto de negócio, constraints internas).

---

## 4. Gerando o Task List a partir do PRD

### 4.1 Arquivo de tasks

Crie `docs/tasks.md` (ou similar).

### 4.2 Prompt base para gerar tasks

```text
Quero gerar uma lista de tarefas a partir do PRD.

Use @docs/prd.md como fonte de verdade e crie @docs/tasks.md com:

- Seções por área (ex.: Setup, Backend/Core, Frontend/UI, Integrações externas, LLM, Testes/Qualidade, Observabilidade, Deploy, Documentação)
- Tasks numeradas (ex.: 0.1, 0.2, 1.1, 2.1, etc.)
- Cada task deve:
  - Ter escopo pequeno (idealmente executável em 1–2 horas)
  - Ter um resultado verificável (Definition of Done implícito)
  - Estar ligada a partes específicas do PRD (a IA pode citar IDs de requisitos ou user stories)

Não gere código. Apenas a lista de tasks.
```

### 4.3 Revisão e ajustes

- Ajuste a ordem e prioridades.
- Marque eventualmente:
  - `[M]` Must-have
  - `[S]` Should-have
  - `[C]` Could-have
- Divida tasks muito grandes em subtarefas menores.

---

## 5. Execução guiada por PRD + tasks (LLM + humano)

### 5.1 Princípios

- **Uma task por vez**: a LLM foca em uma tarefa, do começo ao fim.
- **Contexto explícito**: sempre fornecer `@docs/prd.md` e `@docs/tasks.md`.
- **Especificação manda**: se algo contraria o PRD, a LLM deve avisar.

### 5.2 Prompt genérico para executar uma task

```text
Você é um agente de desenvolvimento trabalhando em modo PRD-driven.

Contexto:
- PRD: @docs/prd.md
- Task list: @docs/tasks.md

Tarefa atual:
- Copie aqui a tarefa, ex.: "2.1 Implementar skeleton do backend (servidor base, estrutura de pastas, config inicial)."

Passos que você deve seguir:
1. Leia a task e identifique as partes relevantes do PRD. Faça um resumo em no máximo 5 frases.
2. Proponha um plano em 3–5 bullets descrevendo:
   - quais arquivos serão criados/modificados;
   - quais componentes principais serão implementados;
   - como isso se conecta aos requisitos/user stories do PRD.
3. Implemente o código/configuração necessário, seguindo o plano.
4. Liste:
   - Arquivos criados/modificados.
   - Como testar a mudança (comandos, endpoints, cenários).
5. Se em algum momento a task exigir algo que contraria o PRD, pare e pergunte antes de continuar.

Regras:
- Não modifique requisitos ou objetivos. Se sentir necessidade de alterar o PRD, sinalize.
- Não altere arquivos fora dos acordados implicitamente pela task sem explicar por quê.
- Prefira soluções simples e consistentes com as restrições técnicas da seção de Stack do PRD.
```

### 5.3 Loop de trabalho sugerido

1. Escolher task em `docs/tasks.md`.
2. Rodar o prompt acima com essa task.
3. Analisar a proposta de plano da LLM.
4. Deixar a LLM implementar ou escrever você mesmo, com apoio dela.
5. Revisar código, rodar testes, ajustar.
6. Marcar task como concluída (ex.: `- [x] 2.1 ...`).
7. Repetir para próxima task.

---

## 6. Uso com diferentes ferramentas (IDE, CLI, etc.)

### 6.1 IDEs com agentes (Claude Code, Cursor, Windsurf, etc.)

- Mantém os arquivos PRD e tasks dentro do repo.
- Instruir o agente uma vez no início:

```text
Para este projeto:
- Trate @docs/prd.md como fonte de verdade.
- Use @docs/tasks.md para planejar e executar tasks.
- Sempre peça para escolher a próxima task antes de escrever código.
```

- Depois, seguir o loop: escolher task → plano → código → revisão.

### 6.2 Fluxo CLI (tools como Ralph, Taskmaster, etc.)

- Alguns CLIs já seguem esse padrão:
  - `create-prd` → gera PRD
  - `generate-tasks` → gera tasks do PRD
  - `run-tasks` → executa tasks com IA [web:101][web:120]
- Este `process-task-list.md` pode servir como documentação para humanos e para agentes.

---

## 7. Atualizações (PRD e tasks) durante o projeto

### 7.1 Quando atualizar o PRD

- Requisitos mudaram.
- Nova persona / caso de uso importante.
- Stack ou restrições técnicas mudaram.

### 7.2 Como avisar a LLM sobre mudanças

```text
Atualizei o PRD em @docs/prd.md.

1. Leia as mudanças e faça um resumo.
2. Identifique quais seções de @docs/tasks.md precisam ser ajustadas.
3. Proponha um patch para o task list (podendo adicionar/remover/editar tasks).
```

### 7.3 Quando atualizar o Task List

- Quando tasks forem concluídas.
- Quando “descobrir” nova necessidade derivada do PRD.
- Quando repriorizar features (trocar Must/Should/Could).

---

## 8. Boas práticas gerais

- **Documentar antes de codar**: sempre atualizar PRD antes de pedir mudanças grandes à LLM.
- **Tasks pequenas**: manter tasks pequenas para reduzir complexidade e erros.
- **Feedback constante**: revisar PRD e tasks no fim de cada fase/sprint.
- **Evitar prompts soltos**: sempre referenciar PRD/tasks nas conversas com a LLM.

---

## 9. Checklist rápido

Antes de começar a codar:

- [ ] Existe um `docs/idea.md` com problema/objetivos claros?
- [ ] Existe um `docs/prd.md` com requisitos e user stories?
- [ ] Existe um `docs/tasks.md` com tasks pequenas e priorizadas?
- [ ] A LLM foi instruída a seguir PRD + tasks, e não prompts soltos?

Durante o desenvolvimento:

- [ ] Cada task parte do PRD, não de “lembranças” da IA.
- [ ] As mudanças são revisadas contra critérios de aceitação do PRD.
- [ ] PRD e tasks são atualizados quando requisitos mudam.

Se tudo isso estiver em dia, você está realmente fazendo **PRD-driven / Spec-driven development** com suporte de LLM, e não apenas “vibe coding”.