# PRD-Spec LLM Guide

Template para iniciar projetos em **PRD-driven / Spec-driven development** com uma LLM (Claude, Cursor, Gemini, Grok, etc.).

Fluxo: **Ideia → PRD/Spec → Task List → Execução (humano + IA)**.

## Conceitos-Chave

- 📋 **PRD / Spec-driven Development:** Em vez de mandar prompts soltos (*"crie uma tela de login"*), definimos primeiro um PRD (Product Requirements Document) como **fonte de verdade**. A IA não inventa requisitos nem muda o escopo: ela consulta a especificação antes de propor qualquer código.
- 📜 **Histórico de Revisões (Changelog do PRD):** O PRD possui um registro de alterações obrigatório. Quando um requisito muda, o changelog é atualizado para que a IA não perca o contexto do projeto nem aplique mudanças conflitantes.
- 🔗 **Grafo de Dependências (`Blocker: X.Y`):** As tarefas possuem bloqueadores explícitos. A IA respeita a ordem de execução e nunca tenta construir uma funcionalidade (ex: tela de checkout) antes dos seus pré-requisitos (ex: API de pagamento ou modelos de dados) estarem concluídos.
- 🧪 **TDD via BDD (Gherkin):** Test-Driven Development aliado a Behavior-Driven Development. As regras de negócio são descritas em formato de cenários (`Dado que... Quando... Então...`). A IA cria e roda os testes baseados nesses cenários *antes* de implementar o código de produção.
- 🎯 **DoD (Definition of Done) & Proposição Ativa:** Uma tarefa só é marcada como concluída `[x]` quando o teste ou comando de validação roda com sucesso. Se o usuário não souber como testar, a própria IA propõe o DoD e os testes adequados para a stack.
- ⚡ **Skills Nativas (`/start`, `/next`, `/sync`, `/status`):** Atalhos prontos para os agentes (Claude Code e Antigravity) que guiam o ciclo de vida completo do projeto sem a necessidade de escrever prompts gigantes no chat.

## Como usar

1. Copie este repositório para o seu projeto novo:
   ```bash
   cp -r prd-spec-llm-guide meu-app-novo
   ```
   (ou clique em **Use this template** no GitHub)
2. No agente com skills, rode **`/start`** — ele entrevista você para preencher a
   ideia, gera `prd.md` e `tasks.md` e executa as tasks uma por vez. Opcional:
   passe um pitch, ex. `/start app de finanças pessoais`.
   - **`/next`** — continua na próxima task pendente (com DoD e validação).
   - **`/sync`** — recalibra `tasks.md` depois que o PRD mudar (sem gerar código).
   - **`/status`** — exibe o dashboard de progresso por prioridade, blockers e próxima task elegível.
3. Prefere manual? Preencha nesta ordem:
   - `docs/idea.md` — a partir de `docs/idea-template.md`
   - `docs/prd.md` — a partir de `docs/prd-template.md` (fonte de verdade)
   - `docs/tasks.md` — a partir de `docs/tasks-template.md`

   e execute as tasks seguindo `docs/process-task-list.md`. **No PRD, no code.**

> As skills (`/start`, `/next`, `/sync`, `/status`) ficam em `.claude/skills/` (Claude Code) e `.gemini/skills/` (Google Antigravity).  
> Regras para qualquer agente: `AGENTS.md` (e `CLAUDE.md` como espelho para Claude Code).  
> Em projetos recém-copiados, reinicie o assistente para carregar as skills.

## Destaques do Template

- **Histórico de Revisões**: O PRD exige changelog para a IA não se perder ao longo do tempo.
- **TDD via BDD (Gherkin)**: Critérios de aceitação em `Given/When/Then`; skills pedem teste antes do código quando houver US ligada.
- **Proposição Ativa de DoD & Testes**: Se você não souber como testar ou qual DoD definir, a IA propõe ativamente testes e comandos de validação concretos baseados na Stack do PRD.
- **DoD + link ao PRD**: Cada task no template tem **PRD:** (RF/US) e **DoD:** verificável; `[x]` só com DoD cumprido.
- **Dependências**: `(Blocker: 1.1)` impede execução fora de ordem (`/next` respeita).
- **`/status`**: Dashboard instantâneo no chat com percentual por prioridade (Must/Should/Could) e próximos passos.
- **`/sync`**: Quando o PRD muda, propõe patch em `tasks.md` com revisão humana antes de aplicar.

## Arquivos

| Arquivo | Papel |
|---|---|
| `guide.md` | Explicação conceitual do fluxo completo |
| `docs/process-task-list.md` | Guia operacional do loop com a LLM |
| `docs/*-template.md` | Moldes de idea, PRD e tasks |
| `.claude/skills/` & `.gemini/skills/` | Skills `/start`, `/next`, `/sync`, `/status` |
| `AGENTS.md` | Regras de operação para agentes em geral |
| `CLAUDE.md` | Espelho das regras para Claude Code |
