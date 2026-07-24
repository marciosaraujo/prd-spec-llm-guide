---
description: Exibe o status atual do projeto, progresso por prioridade (Must/Should/Could), blockers ativos e próxima tarefa elegível. Use ao dizer "/status", "status do projeto" ou "progresso".
allowed-tools: Read
---

# /status — Dashboard de Progresso do Projeto

Lê `docs/prd.md` e `docs/tasks.md` e apresenta um resumo estruturado do estado do projeto sem alterar arquivos.

## Passos

1. **Verificação de Arquivos:** Cheque se `docs/prd.md` e `docs/tasks.md` existem. Se não existirem, informe o usuário e recomende rodar `/start`.
2. **Leitura:** 
   - Obtenha a versão atual do PRD no **Histórico de Revisões**.
   - Analise a lista completa de tarefas em `docs/tasks.md`.
3. **Cálculo de Progresso:**
   - Conte o número de tarefas concluídas `[x]` e pendentes `[ ]` separadas por prioridade:
     - Must-have (`[M]`)
     - Should-have (`[S]`)
     - Could-have (`[C]`)
   - Identifique a **Próxima Task Elegível** (a primeira tarefa pendente cujos `Blocker:` já estejam concluídos `[x]`).
   - Identifique tarefas atualmente bloqueadas por dependências em aberto.
4. **Apresentação:** Exiba um dashboard formatado em Markdown no seguinte padrão:

```markdown
### 📊 Status do Projeto

**PRD:** Versão X.Y | **Fonte de Verdade:** `docs/prd.md`

#### Progresso por Prioridade
- **Must-have [M]:** X / Y concluídas (Z%)
- **Should-have [S]:** X / Y concluídas (Z%)
- **Could-have [C]:** X / Y concluídas (Z%)
- **Total Geral:** X / Y (Z%)

#### 🎯 Próxima Task Elegível
- **[ID]** Título da Task (`[M]`)
  - **PRD:** Link da US/RF
  - **DoD:** Critério de aceite/teste

#### ⛔ Blockers Ativos (se houver)
- **[ID]** Título (Bloqueada por: [ID_BLOCKER])

---
> Para executar a próxima tarefa, digite `/next`.
```
