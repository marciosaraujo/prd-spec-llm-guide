# Guia PRD-Driven / Spec-Driven para Desenvolvimento com LLMs

Fluxo: **Ideia → Spec/PRD → Task List → Execução** (humano + IA).

Este guia descreve:

- Termos principais
- Por que cada etapa existe
- Como construir cada artefato (de forma genérica)
- Como usar tudo isso com uma LLM

> Os moldes prontos estão em `docs/idea-template.md`, `docs/prd-template.md` e
> `docs/tasks-template.md`. Este guia explica o **porquê**; os templates são o **o quê**.

---

## 0. Conceitos e objetivos

### O que é PRD-driven / Spec-driven

**PRD-driven development** é um workflow onde um Product Requirements Document (PRD) bem
estruturado é a fonte de verdade, e todo o desenvolvimento (humano + IA) segue esse documento.

**Spec-driven development** é a mesma ideia em termos mais amplos: você escreve uma spec antes
de escrever código com IA, e o código serve à spec, não o contrário.

### Objetivo deste guia

- Te dar um processo reutilizável para qualquer app (web, API, ferramenta interna, etc.) que use ou não LLM.
- Mostrar como separar planejamento de execução para que LLMs trabalhem de forma previsível e segura.

---

## 1. Discovery / Ideia

### 1.1 O que é

Primeira etapa, onde você define o problema, o objetivo e quem é o usuário, **sem falar de stack
ou detalhes técnicos**.

Saída típica: um documento curto, por exemplo `docs/idea.md`.

### 1.2 Por que é necessária

- Evita sair codando baseado em "vibe".
- Ajuda a verificar se o problema é real e vale o esforço.
- Dá base para um PRD focado e coerente.

### 1.3 Como construir

Copie `docs/idea-template.md` para `docs/idea.md` e preencha. O molde cobre problema, objetivo
principal, usuário-alvo, benefícios esperados e fora de escopo (v1).

### 1.4 Como usar uma LLM nesta etapa

Você pode pedir ajuda para refinar a ideia, mas com foco em clareza, não em implementação:

```text
Quero clareza de problema e objetivo antes de codar.

Aqui está minha ideia: @docs/idea.md

Refine:
- O texto do problema (mais claro e conciso)
- Os objetivos (max 3, mensuráveis)
- A lista de "fora de escopo" para o v1

Não fale de stack nem de tecnologias ainda.
```

---

## 2. Spec / PRD (fonte da verdade)

### 2.1 O que é

Um Product Requirements Document (PRD) ou spec é um documento que responde:

- O que estamos construindo?
- Para quem?
- Como saber se está "pronto"?
- Quais são os limites e restrições?

Ele descreve **comportamento**, não implementação específica.

### 2.2 Por que é necessário

LLMs funcionam melhor com contexto estável e bem definido. Sem PRD, prompts soltos levam a:

- features inventadas,
- desvio de objetivo,
- código inconsistente.

O PRD é o "contrato" entre você, time e IA.

### 2.3 Estrutura de PRD

Copie `docs/prd-template.md` para `docs/prd.md` e preencha. O molde tem 11 seções: visão geral,
personas, requisitos funcionais (MoSCoW), fluxos e casos de uso, requisitos não funcionais, stack
e restrições, modelo de dados, user stories com critérios Gherkin, diretrizes para LLM, métricas
de sucesso, riscos e questões em aberto.

Seções sem correspondente no seu projeto devem ser **removidas**, não preenchidas com placeholder.

### 2.4 Como gerar/editar o PRD com LLM

Você pode partir do `idea.md`:

```text
Quero trabalhar em PRD-driven.

Use @docs/idea.md como base e gere um PRD em @docs/prd.md
seguindo a estrutura de @docs/prd-template.md.

Regras:
- Não invente features fora do problema descrito.
- Use linguagem direta e concisa.
- Marque explicitamente o que é Must/Should/Won't.
```

Depois você lê o PRD, corrige o que estiver errado e adiciona detalhes de negócio/stack que a IA
não conhece.

O PRD só está "pronto o suficiente" quando:

- todas as user stories têm critérios de aceitação,
- os limites estão claros (fora de escopo),
- você sente que qualquer dev/IA entende o produto lendo apenas esse doc.

---

## 3. Task List (checklist de implementação)

### 3.1 O que é

Um arquivo (ex.: `docs/tasks.md`) com uma lista de tasks agrupadas, numeradas, derivadas do PRD.

- Não é código.
- Não se mistura com backlog de bugs/ideias soltas.
- Serve de roteiro para humanos e IA.

### 3.2 Por que é necessário

- Separar planejamento (PRD) de execução.
- Permitir planejamento de fases, "alimentar" agentes de IA com uma task por vez e acompanhar
  progresso de forma tangível.
- Evitar que a IA faça "tudo ao mesmo tempo" e quebre contexto.

### 3.3 Estrutura de task list

Copie `docs/tasks-template.md` para `docs/tasks.md`. O molde traz seções por área (setup,
arquitetura, backend, frontend, integrações, LLM, testes, observabilidade, deploy, documentação)
e o formato de cada task:

```markdown
- [ ] {id} `[{M|S|C}]` {título curto} (Blocker: {id})
  - **PRD:** {RF-Mx / US-00x / seção do prd.md}
  - **DoD:** {resultado verificável — comando de teste, comportamento ou artefato}
```

Remova as seções que o PRD não pede.

### 3.4 Como gerar tasks a partir do PRD com LLM

```text
Quero gerar um task list a partir do PRD.

Use @docs/prd.md e crie @docs/tasks.md seguindo @docs/tasks-template.md:

- Seções por área (remova as que o PRD não pede)
- Tasks numeradas (ex: 2.1, 2.2...)
- Cada task deve:
  - Ter escopo pequeno (1–2h ideal)
  - Ter os campos PRD: e DoD:
  - Ser implementável sem decidir requisitos novos

Não gere código. Apenas tasks.
```

Revisar tasks é obrigatório: remova duplicadas, ajuste a ordem de dependências e sinalize
Must-have vs Should-have.

---

## 4. Execução (humano + IA) – PRD → Tasks → Código

### 4.1 O que é

Etapa em que você e/ou agentes de IA implementam tasks, uma por vez, sempre:

- olhando o PRD,
- conferindo se a task está alinhada,
- garantindo que o resultado cumpre critérios de aceitação.

### 4.2 Por que esta ordem é importante

Spec/PRD vem antes de tasks, que vêm antes de código. Se você pula o PRD e gera tasks direto de
uma ideia, a IA inventa requisitos, muda escopo e produz tasks desalinhadas.

### 4.3 Loop de execução

```text
1. Escolha uma task em docs/tasks.md
2. Passe contexto (PRD + task) para a LLM
3. LLM propõe um plano curto (design)
4. LLM escreve código / configs / docs
5. Você revisa, testa, ajusta
6. Marca task como concluída (só com o DoD cumprido)
7. Repete para próxima task
```

### 4.4 Prompt genérico para executar uma task

```text
Quero usar PRD-driven development com você.

Contexto:
- PRD: @docs/prd.md
- Task list: @docs/tasks.md

Tarefa atual: <copiar a task específica, ex: "2.1 Implementar skeleton do servidor">

Passos:
1. Leia a task e identifique as seções relevantes do PRD. Resuma em 3 frases.
2. Proponha um plano em 3–5 bullets do que vai mudar (arquivos, funções, etc.).
3. Implemente o código necessário, limitando-se a:
   - listar explicitamente os arquivos que serão criados/modificados
   - explicar blocos importantes de código em 1–2 frases
4. Rode o que o DoD pede e diga o que não foi verificado.

Regras:
- Não modifique requisitos. Se a task exigir algo fora do PRD, pare e pergunte.
- Não altere arquivos fora dos listados sem pedir.
- Prefira soluções simples e alinhadas às restrições técnicas do PRD.
```

> Se você usa Claude Code ou Gemini/Antigravity, as skills `/start`, `/next`, `/sync` e `/status`
> já automatizam esse loop — veja `docs/process-task-list.md`.

### 4.5 Papel do humano na execução

Mesmo com IA:

- Você decide a ordem das tasks e o que entra no escopo de cada fase.
- Você revisa diffs, roda testes, mede impacto.
- Você atualiza PRD/tasks quando requisitos mudam (não deixa só na cabeça).

---

## 5. Atualizações e ciclo de feedback

### 5.1 Quando atualizar o PRD

- Quando um requisito muda (ex.: passa a exigir novo tipo de usuário).
- Quando uma suposição inicial se prova errada.
- Quando uma feature importante é adicionada ou removida do escopo.

Sempre que mudar o PRD: atualize `docs/prd.md` **e** o Histórico de Revisões (ex.: "PRD v1.1 –
adicionamos requisito X").

### 5.2 Quando atualizar o Task List

- Quando uma task se mostrar grande demais → dividir.
- Quando você adiciona nova feature → adicionar novas tasks.
- Quando reprioriza escopo → mudar ordem e labels (Must/Should).

### 5.3 Como recalibrar a LLM

Sempre que houver mudanças relevantes (ou use `/sync`):

```text
Atualizei o PRD em @docs/prd.md (nova versão).

Resuma em 5–7 bullets as principais mudanças em relação ao que você tinha antes
e explique como isso afeta o plano de tasks existente em @docs/tasks.md.

Sugira ajustes necessários no task list.
```

---

## 6. Resumo visual do fluxo

```text
Discovery / Ideia (docs/idea.md)
   ↓
Spec / PRD (docs/prd.md)
   ↓
Task List (docs/tasks.md)
   ↓
Execução (humano + IA)
   ↓
Feedback / Atualização (PRD + tasks)
```

- **PRD:** contexto e contrato.
- **Tasks:** plano de execução granular.
- **LLM:** executor/assistente guiado por PRD + tasks, não por prompts soltos.
