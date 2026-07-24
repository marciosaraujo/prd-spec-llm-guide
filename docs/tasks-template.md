# Task List – {Nome do Projeto}

> Derivado de `prd.md`. **Não é código**, não é backlog de bugs. É o roteiro de execução.
> Convenção: tasks numeradas por seção (`2.1`, `2.2`...), prioridade `[M]`/`[S]`/`[C]`, checkbox,
> dependências `(Blocker: 1.1)`, e em cada task os campos **PRD:** e **DoD:**.
> Remova seções que não se aplicam ao PRD. Após mudar o PRD, use `/sync`.

---

## Formato de cada task

```markdown
- [ ] {id} `[{M|S|C}]` {título curto} (Blocker: {id})  <!-- Blocker opcional -->
  - **PRD:** {RF-Mx / US-00x / seção do prd.md}
  - **DoD:** {resultado verificável — comando, comportamento ou artefato}
```

Marque `[x]` **somente** quando o DoD estiver cumprido (ou declare o gap e deixe pendente).

---

## 0. Setup de projeto
- [ ] 0.1 `[M]` Criar repositório e estrutura básica de pastas
  - **PRD:** §6 Stack / visão geral
  - **DoD:** Estrutura de pastas existe e README mínimo descreve como rodar
- [ ] 0.2 `[M]` Configurar ferramentas (lint, format, testes, CI/CD)
  - **PRD:** §6 Stack e restrições técnicas
  - **DoD:** Comando de lint/teste documentado roda com sucesso no repo vazio/skeleton

## 1. Planejamento de arquitetura
- [ ] 1.1 `[M]` Definir módulos principais
  - **PRD:** §6–7 Stack e modelo de dados
  - **DoD:** Documento ou seção no repo lista módulos e responsabilidades
- [ ] 1.2 `[M]` Definir contratos entre módulos (APIs internas) (Blocker: 1.1)
  - **PRD:** §4 Fluxos / §7 Modelo de dados
  - **DoD:** Contratos (rotas, eventos ou interfaces) descritos e revisados

## 2. Backend / Core
- [ ] 2.1 `[M]` Implementar skeleton do servidor / serviço
  - **PRD:** RF-M… / §6 Stack
  - **DoD:** Serviço sobe localmente; healthcheck ou equivalente responde
- [ ] 2.2 `[M]` Implementar modelos de dados (Blocker: 2.1)
  - **PRD:** §7 Modelo de dados
  - **DoD:** Modelos criados e migration/schema aplicável sem erro
- [ ] 2.3 `[M]` Implementar endpoints básicos / APIs internas (Blocker: 2.2)
  - **PRD:** RF-M… / US-00x
  - **DoD:** Endpoints do happy path respondem conforme critérios Gherkin da US

## 3. Frontend / UI (se houver)
- [ ] 3.1 `[S]` Criar projeto base
  - **PRD:** §6 Stack (frontend)
  - **DoD:** App sobe em dev e renderiza página placeholder
- [ ] 3.2 `[S]` Implementar layout principal (Blocker: 3.1)
  - **PRD:** §4 Fluxos principais
  - **DoD:** Layout navegável conforme fluxo principal do PRD
- [ ] 3.3 `[S]` Implementar tela(s) principais (Blocker: 3.2)
  - **PRD:** US-00x
  - **DoD:** Critérios Gherkin da(s) US cobertos na UI (manual ou teste)

## 4. Integrações externas
- [ ] 4.1 `[S]` Configurar integração com serviço X
  - **PRD:** §6.3 Integrações / RF-…
  - **DoD:** Chamada de integração documentada e smoke test passa (ou mock acordado)
- [ ] 4.2 `[C]` Configurar integração com serviço Y
  - **PRD:** §6.3 Integrações / RF-…
  - **DoD:** Idem para o serviço Y

## 5. LLM / IA (se houver)
- [ ] 5.1 `[M]` Configurar cliente LLM
  - **PRD:** §9 Diretrizes LLM / §6 Stack
  - **DoD:** Cliente autentica e completa um request de smoke
- [ ] 5.2 `[M]` Definir prompts e formatos de entrada/saída (Blocker: 5.1)
  - **PRD:** §9.2–9.4
  - **DoD:** Exemplos input→output do PRD reproduzidos ou validados por schema
- [ ] 5.3 `[M]` Implementar fluxo de chamada LLM no backend (Blocker: 5.2)
  - **PRD:** US-00x / §9
  - **DoD:** Fluxo end-to-end da US passa nos critérios de aceitação

## 6. Testes e qualidade
- [ ] 6.1 `[M]` Testes unitários do núcleo
  - **PRD:** §8 User stories (critérios Gherkin)
  - **DoD:** Suite unitária do núcleo verde na CI ou local
- [ ] 6.2 `[S]` Testes de integração
  - **PRD:** §4 Fluxos / §5 NFRs
  - **DoD:** Testes de integração dos fluxos Must passam
- [ ] 6.3 `[S]` Testes end-to-end / smoke tests
  - **PRD:** §4.1 Happy path
  - **DoD:** Smoke do happy path documentado e executável

## 7. Observabilidade e operação
- [ ] 7.1 `[S]` Logging estruturado
  - **PRD:** §5 Requisitos não funcionais
  - **DoD:** Logs estruturados nas bordas principais (request/erro)
- [ ] 7.2 `[C]` Métricas e dashboards
  - **PRD:** §10 Métricas / §5
  - **DoD:** Métrica mínima exposta ou dashboard stub documentado
- [ ] 7.3 `[C]` Alertas básicos
  - **PRD:** §5.4 Confiabilidade
  - **DoD:** Alerta de erro crítico configurado ou runbook de alerta escrito

## 8. Deploy
- [ ] 8.1 `[M]` Configurar ambiente de staging/dev
  - **PRD:** §6 Stack / §5
  - **DoD:** Deploy dev/staging reproduzível documentado
- [ ] 8.2 `[M]` Configurar ambiente de produção (Blocker: 8.1)
  - **PRD:** §5–6
  - **DoD:** Pipeline ou passos de produção documentados e testados em dry-run
- [ ] 8.3 `[S]` Documentar processo de deploy
  - **PRD:** operação
  - **DoD:** README/runbook com passos de deploy e rollback

## 9. Documentação
- [ ] 9.1 `[S]` Atualizar README
  - **PRD:** visão geral
  - **DoD:** README explica setup, run e link para `docs/prd.md`
- [ ] 9.2 `[C]` Criar manual de uso / API docs
  - **PRD:** §4 / APIs
  - **DoD:** Doc de uso ou OpenAPI/equivalente cobre endpoints Must
- [ ] 9.3 `[C]` Criar runbooks básicos
  - **PRD:** §5 / operação
  - **DoD:** Runbook de incidente mínimo (quem chama, o que checar)

---

> Cada task: escopo 1–2h, **PRD:** obrigatório, **DoD:** obrigatório e verificável.
> Priorize Must `[M]` antes de Should/Could. Use `/next` para executar e `/sync` após mudanças no PRD.
