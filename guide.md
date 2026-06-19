Abaixo está um guia completo, agnóstico de domínio, em markdown, cobrindo todo o plano PRD-driven / Spec-driven para trabalhar com LLMs (Claude, etc.), sem amarrar em uma aplicação específica.

Guia PRD-Driven / Spec-Driven para Desenvolvimento com LLMs
Fluxo: Ideia → Spec/PRD → Task List → Execução (humano + IA).

Este guia descreve:

Termos principais

Por que cada etapa existe

Como construir cada artefato (de forma genérica)

Como usar tudo isso com uma LLM

0. Conceitos e objetivos
O que é PRD-driven / Spec-driven
PRD-driven development é um workflow onde um Product Requirements Document (PRD) bem estruturado é a fonte de verdade, e todo o desenvolvimento (humano + IA) segue esse documento.

Spec-driven development é a mesma ideia em termos mais amplos: você escreve uma spec antes de escrever código com IA, e o código serve à spec, não o contrário.

Objetivo deste guia
Te dar um processo reutilizável para qualquer app (web, API, ferramenta interna, etc.) que use ou não LLM.

Mostrar como separar planejamento de execução para que LLMs trabalhem de forma previsível e segura.

1. Discovery / Ideia
1.1 O que é
Primeira etapa, onde você define o problema, o objetivo e quem é o usuário, sem falar de stack ou detalhes técnicos.

Saída típica: um documento curto, por exemplo docs/idea.md.

1.2 Por que é necessária
Evita sair codando baseado em “vibe”.

Ajuda a verificar se o problema é real e vale o esforço.

Dá base para um PRD focado e coerente.

1.3 Como construir (genérico)
Crie um arquivo docs/idea.md com seções:

text
# Idea: Nome da aplicação/feature

## Problema
Descreva o problema em 3–5 frases.

## Objetivo principal
Descreva o que você quer alcançar em 2–3 frases.

## Usuário-alvo
Quem são as pessoas que vão usar isso? (1–3 personas simples)

## Benefícios esperados
Liste 3–5 benefícios claros (tempo, custo, qualidade, experiência, etc.).

## Fora de escopo (v1)
Liste explicitamente o que NÃO será feito na primeira versão.
1.4 Como usar uma LLM nesta etapa
Você pode pedir ajuda para refinar a ideia, mas com foco em clareza, não em implementação:

text
Quero clareza de problema e objetivo antes de codar.

Aqui está minha ideia: @docs/idea.md

Refine:
- O texto do problema (mais claro e conciso)
- Os objetivos (max 3, mensuráveis)
- A lista de “fora de escopo” para o v1

Não fale de stack nem de tecnologias ainda.
2. Spec / PRD (fonte da verdade)
2.1 O que é
Um Product Requirements Document (PRD) ou spec é um documento que responde:

O que estamos construindo?

Para quem?

Como saber se está “pronto”?

Quais são os limites e restrições?

Ele descreve comportamento, não implementação específica.

2.2 Por que é necessário
LLMs funcionam melhor com contexto estável e bem definido.

Sem PRD, prompts soltos levam a:

features inventadas,

desvio de objetivo,

código inconsistente.

O PRD é o “contrato” entre você, time e IA.

2.3 Estrutura de PRD (agnóstica)
Crie docs/prd.md com estrutura como esta:

text
# Nome do Projeto – PRD

## 1. Visão geral
- Contexto
- Problema
- Objetivos de negócio
- Objetivos do usuário
- Fora de escopo (v1)

## 2. Personas e usuários
- Lista de personas
- Responsabilidades e necessidades principais

## 3. Requisitos funcionais (MoSCoW)
- Must-have
- Should-have
- Could-have
- Won’t-have (v1)

## 4. Fluxos principais e casos de uso
- Fluxos de usuário (passo a passo)
- Casos de uso principais
- Casos de borda (edge cases)

## 5. Requisitos não funcionais
- Performance
- Segurança
- Escalabilidade
- Confiabilidade
- Compliance
- Custos

## 6. Stack e restrições técnicas
- Tecnologias preferidas/obrigatórias
- Restrições (ex: no vendor lock, requisitos de região, etc.)
- Integrações externas (APIs, serviços)

## 7. Modelo de dados (alto nível)
- Entidades principais
- Relacionamentos
- Regras de integridade

## 8. User stories + critérios de aceitação
- User stories em formato claro
- Critérios de aceitação (ex: Given-When-Then)

## 9. Diretrizes LLM (se o app usar LLM)
- Papéis da LLM (assistente, agente, etc.)
- Formato de entrada/saída (ex: JSON, texto)
- Regras de segurança e limites
- Exemplos de input→output

## 10. Métricas de sucesso
- Métricas de usuário
- Métricas de negócio
- Métricas técnicas

## 11. Riscos e questões em aberto
- Riscos principais
- Perguntas a serem respondidas antes/depois
2.4 Como gerar/editar o PRD com LLM
Você pode partir da idea.md:

text
Quero trabalhar em PRD-driven.

Use @docs/idea.md como base e gere um PRD em @docs/prd.md
na estrutura abaixo:

(listar estrutura)

Regras:
- Não invente features fora do problema descrito.
- Use linguagem direta e concisa.
- Marque explicitamente o que é Must/Should/Won’t.
Depois você:

lê o PRD,

corrige o que estiver errado,

adiciona detalhes de negócio/stack que a IA não conhece.

O PRD só está “pronto o suficiente” quando:

todas as user stories têm critérios de aceitação,

os limites estão claros (fora de escopo),

você sente que qualquer dev/IA entende o produto lendo apenas esse doc.

3. Task List (checklist de implementação)
3.1 O que é
Um arquivo (ex.: docs/tasks.md) com uma lista de tasks agrupadas, numeradas, derivadas do PRD.

Não é código.

Não se mistura com backlog de bugs/idéias soltas.

Serve de roteiro para humanos e IA.

3.2 Por que é necessário
Separar planejamento (PRD) de execução.

Permitir:

planejamento de sprints/fases,

“alimentar” agentes de IA com uma task por vez,

acompanhar progresso de forma tangível.

Evitar que a IA faça “tudo ao mesmo tempo” e quebre contexto.

3.3 Estrutura de task list (agnóstica)
text
# Task List – Nome do Projeto

## 0. Setup de projeto

0.1 Criar repositório, estrutura básica de pastas  
0.2 Configurar ferramentas (lint, format, testes, CI/CD)  

## 1. Planejamento de arquitetura

1.1 Definir módulos principais  
1.2 Definir contratos entre módulos (APIs internas)  

## 2. Backend / Core

2.1 Implementar skeleton do servidor / serviço  
2.2 Implementar modelos de dados  
2.3 Implementar endpoints básicos / APIs internas  

## 3. Frontend / UI (se houver)

3.1 Criar projeto base  
3.2 Implementar layout principal  
3.3 Implementar tela(s) principais  

## 4. Integrações externas

4.1 Configurar integração com serviço X  
4.2 Configurar integração com serviço Y  

## 5. LLM / IA (se houver)

5.1 Configurar cliente LLM  
5.2 Definir prompts e formatos de entrada/saída  
5.3 Implementar fluxo de chamada LLM no backend  

## 6. Testes e qualidade

6.1 Testes unitários núcleo  
6.2 Testes de integração  
6.3 Testes end-to-end / smoke tests  

## 7. Observabilidade e operação

7.1 Logging estruturado  
7.2 Métricas e dashboards  
7.3 Alertas básicos  

## 8. Deploy

8.1 Configurar ambiente de staging/dev  
8.2 Configurar ambiente de produção  
8.3 Documentar processo de deploy  

## 9. Documentação

9.1 Atualizar README  
9.2 Criar manual de uso / API docs  
9.3 Criar runbooks básicos
3.4 Como gerar tasks a partir do PRD com LLM
text
Quero gerar um task list a partir do PRD.

Use @docs/prd.md e crie @docs/tasks.md com:

- Seções por área (setup, backend, frontend, integrações, LLM, testes, deploy)
- Tasks numeradas (ex: 2.1, 2.2...)
- Cada task deve:
  - Ter escopo pequeno (1–2h ideal)
  - Estar ligada a partes específicas do PRD
  - Ser implementável sem decidir requisitos novos

Não gere código. Apenas tasks.
Revisar tasks é obrigatório:

Remova duplicadas.

Ajuste ordem de dependências.

Sinalize Must-have vs Should-have.

4. Execução (humano + IA) – PRD → Tasks → Código
4.1 O que é
Etapa em que você e/ou agentes de IA implementam tasks, uma por vez, sempre:

olhando o PRD,

conferindo se a task está alinhada,

garantindo que o resultado cumpre critérios de aceitação.

4.2 Por que esta ordem é importante
Spec/PRD vem antes de tasks, que vêm antes de código.

Se você pula o PRD e gera tasks direto de uma ideia, a IA:

inventa requisitos,

muda escopo,

produz tasks desalinhadas.

4.3 Loop de execução (genérico)
Padrão de loop:

text
1. Escolha uma task em docs/tasks.md
2. Passe contexto (PRD + task) para a LLM
3. LLM propõe um plano curto (design)
4. LLM escreve código / configs / docs
5. Você revisa, testa, ajusta
6. Marca task como concluída
7. Repete para próxima task
4.4 Prompt genérico para executar uma task
text
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
4. Sugira como testar (comandos, endpoints, casos).

Regras:
- Não modifique requisitos. Se a task exigir algo fora do PRD, pare e pergunte.
- Não altere arquivos fora dos listados sem pedir.
- Prefira soluções simples e alinhadas às restrições técnicas do PRD.
4.5 Papel do humano na execução
Mesmo com IA:

Você decide ordem das tasks e o que entra no escopo de cada sprint.

Você revisa diffs, roda testes, mede impacto.

Você atualiza PRD/tasks quando requisitos mudam (não deixa só na cabeça).

5. Atualizações e ciclo de feedback
5.1 Quando atualizar o PRD
Quando um requisito muda (ex.: passa a exigir novo tipo de usuário).

Quando uma suposição inicial se prova errada.

Quando uma feature importante é adicionada ou removida do escopo.

Sempre que mudar PRD:

Atualize o arquivo docs/prd.md.

Opcional: registre o change log (ex: “PRD v1.1 – adicionamos requisito X”).

5.2 Quando atualizar o Task List
Quando uma task se mostrar grande demais → dividir.

Quando você adiciona nova feature → adicionar novas tasks.

Quando reprioriza escopo → mudar ordem e labels (Must/Should).

5.3 Como recalibrar a LLM
Sempre que houver mudanças relevantes:

text
Atualizei o PRD em @docs/prd.md (nova versão).

Resuma em 5–7 bullets as principais mudanças em relação ao que você tinha antes
e explique como isso afeta o plano de tasks existente em @docs/tasks.md.

Sugira ajustes necessários no task list.
6. Resumo visual do fluxo
text
Discovery / Ideia
   ↓
Spec / PRD (docs/prd.md)
   ↓
Task List (docs/tasks.md)
   ↓
Execução (humano + IA)
   ↓
Feedback / Atualização (PRD + tasks)
PRD: contexto e contrato.

Tasks: plano de execução granular.

LLM: executor/assistente guiado por PRD + tasks, não por prompts soltos.

