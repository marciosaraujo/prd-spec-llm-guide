# Task List – {Nome do Projeto}

> Derivado de `prd.md`. **Não é código**, não é backlog de bugs. É o roteiro de execução.
> Convenção: tasks numeradas por seção (`2.1`, `2.2`...), com prioridade `[M]`/`[S]`/`[C]` e checkbox.

---

## 0. Setup de projeto
- [ ] 0.1 `[M]` Criar repositório e estrutura básica de pastas
- [ ] 0.2 `[M]` Configurar ferramentas (lint, format, testes, CI/CD)

## 1. Planejamento de arquitetura
- [ ] 1.1 `[M]` Definir módulos principais
- [ ] 1.2 `[M]` Definir contratos entre módulos (APIs internas)

## 2. Backend / Core
- [ ] 2.1 `[M]` Implementar skeleton do servidor / serviço
- [ ] 2.2 `[M]` Implementar modelos de dados
- [ ] 2.3 `[M]` Implementar endpoints básicos / APIs internas

## 3. Frontend / UI (se houver)
- [ ] 3.1 `[S]` Criar projeto base
- [ ] 3.2 `[S]` Implementar layout principal
- [ ] 3.3 `[S]` Implementar tela(s) principais

## 4. Integrações externas
- [ ] 4.1 `[S]` Configurar integração com serviço X
- [ ] 4.2 `[C]` Configurar integração com serviço Y

## 5. LLM / IA (se houver)
- [ ] 5.1 `[M]` Configurar cliente LLM
- [ ] 5.2 `[M]` Definir prompts e formatos de entrada/saída
- [ ] 5.3 `[M]` Implementar fluxo de chamada LLM no backend

## 6. Testes e qualidade
- [ ] 6.1 `[M]` Testes unitários do núcleo
- [ ] 6.2 `[S]` Testes de integração
- [ ] 6.3 `[S]` Testes end-to-end / smoke tests

## 7. Observabilidade e operação
- [ ] 7.1 `[S]` Logging estruturado
- [ ] 7.2 `[C]` Métricas e dashboards
- [ ] 7.3 `[C]` Alertas básicos

## 8. Deploy
- [ ] 8.1 `[M]` Configurar ambiente de staging/dev
- [ ] 8.2 `[M]` Configurar ambiente de produção
- [ ] 8.3 `[S]` Documentar processo de deploy

## 9. Documentação
- [ ] 9.1 `[S]` Atualizar README
- [ ] 9.2 `[C]` Criar manual de uso / API docs
- [ ] 9.3 `[C]` Criar runbooks básicos

---

> Cada task deve: ter escopo pequeno (1–2h), resultado verificável, e estar ligada a um requisito/user story do `prd.md`.
> Remova as seções que não se aplicam ao seu projeto.
