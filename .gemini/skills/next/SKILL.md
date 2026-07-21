---
description: Executa a próxima tarefa disponível no docs/tasks.md baseando-se no PRD. Use ao dizer "/next", "próxima tarefa", "próxima task" ou "continuar execução".
allowed-tools: Read Write Edit AskUserQuestion run_command
---

# /next — Continuar execução de task

Este comando tem a função exclusiva de guiar a execução da próxima tarefa do projeto.

## Passos da Skill

1. **Identificação da Task:** Leia o arquivo `docs/tasks.md`. Localize a primeira task pendente (que não tenha a marcação `[x]`).
2. **Verificação de Dependências:** Verifique se a task escolhida tem alguma dependência ou bloqueio (ex: `(Depende de X)` ou `(Blocker: Y)`). Se tiver dependências que ainda não foram concluídas, sugira primeiro a task bloqueadora.
3. **Confirmação:** Informe o usuário qual é a próxima task identificada e peça permissão para prosseguir com o planejamento dela.
4. **Resumo e Planejamento:** Uma vez confirmado, leia o `docs/prd.md` e faça um resumo (máximo de 5 frases) relacionando a task ao PRD. Apresente um plano curto (3–5 bullets) de quais arquivos serão modificados.
5. **Execução:** Após o aval, implemente o mínimo viável para a task na stack acordada no PRD. Adote práticas TDD se a task especificar critérios BDD (escreva e rode o teste primeiro).
6. **Finalização:** Explique como testar as modificações e, em seguida, atualize o arquivo `docs/tasks.md`, marcando a tarefa como concluída `[x]`.
