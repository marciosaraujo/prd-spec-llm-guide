# Nome do Projeto – PRD (Product Requirements Document)

> Este documento é a FONTE DE VERDADE do projeto. Código e tarefas devem obedecer ao PRD, não o contrário.

---

## Histórico de Revisões

*Mantenha um log de alterações para que tanto a equipe quanto a IA saibam o que mudou no decorrer do projeto.*

| Data       | Versão | Autor   | Descrição das Mudanças                 |
|------------|--------|---------|----------------------------------------|
| YYYY-MM-DD | 1.0    | Nome    | Criação inicial do PRD                 |

---

## 1. Visão geral

### 1.1 Contexto
Descreva o contexto geral (mercado, sistema maior, motivo da existência deste projeto).

### 1.2 Problema
Explique o problema que o projeto resolve em 3–5 frases.
- Que dor o usuário tem hoje?
- O que é difícil, caro ou lento sem esta solução?

### 1.3 Objetivos de negócio
Liste 3–5 objetivos de negócio claros e mensuráveis.
- Ex.: reduzir tempo X, aumentar conversões, diminuir custo, etc.

### 1.4 Objetivos do usuário
Liste 3–5 objetivos do usuário final.
- Ex.: “Conseguir fazer Y em menos de N minutos”, “Ter visibilidade sobre Z”.

### 1.5 Fora de escopo (v1)
Liste explicitamente o que NÃO será feito na primeira versão.
- Ex.: integrações, plataformas, features avançadas.

---

## 2. Personas e usuários

Liste as personas principais, com breve descrição.

Exemplo de formato:

- **{Nome da Persona}** – descrição curta (papel, contexto, nível de experiência).
  - Metas principais
  - Frustrações atuais
  - Como este produto ajuda

---

## 3. Requisitos funcionais (MoSCoW)

Use MoSCoW para priorizar (Must/Should/Could/Won’t) os requisitos.  
Foque em comportamento, não em detalhes de implementação.

### 3.1 Must-have (obrigatórios para v1)
- RF-M1: ...
- RF-M2: ...

### 3.2 Should-have (importantes, mas não críticos para v1)
- RF-S1: ...
- RF-S2: ...

### 3.3 Could-have (nice to have)
- RF-C1: ...

### 3.4 Won’t-have (explicitamente fora de v1)
- RF-W1: ...

---

## 4. Fluxos principais e casos de uso

Descreva os fluxos principais em passos simples, do ponto de vista do usuário.

### 4.1 Fluxo principal (happy path)
Exemplo de formato:

1. Usuário faz X
2. Sistema responde Y
3. Usuário faz Z
4. Resultado esperado: ...

### 4.2 Fluxos alternativos
- Ex.: fluxo quando usuário já está logado, quando vem de link especial, etc.

### 4.3 Casos de borda (edge cases)
Liste casos de borda e como o sistema deve reagir.
- Entrada inválida
- Faltam dados
- Erros de rede
- Erros de serviço externo

---

## 5. Requisitos não funcionais

Defina limites e expectativas para qualidade do sistema.

### 5.1 Performance
- Tempo máximo de resposta (ex.: 95% das requisições em ≤ X s)
- Throughput esperado (ex.: N requisições/dia)

### 5.2 Segurança
- Tipos de autenticação/autorização
- Requisitos de criptografia
- Políticas de acesso a dados

### 5.3 Escalabilidade
- Cenários de crescimento esperados
- Requisitos de horizontal/vertical scaling

### 5.4 Confiabilidade
- Uptime alvo (ex.: 99.9%)
- Estratégias de tolerância a falhas
- Política de retry/backoff

### 5.5 Compliance e privacidade
- Regulações relevantes (ex.: GDPR, LGPD)
- Políticas de retenção de dados
- Regras para dados sensíveis

### 5.6 Custos
- Orçamento alvo (ex.: custo mensal máximo)
- Restrições de uso de serviços pagos/LLM

---

## 6. Stack e restrições técnicas

Defina o que é preferido/obrigatório e o que é proibido.

### 6.1 Stack desejada
- Frontend: ...
- Backend: ...
- Banco de dados: ...
- Infraestrutura: ...
- Observabilidade: ...

### 6.2 Restrições técnicas
- Tecnologias proibidas (se houver)
- Limitações de plataforma (ex.: rodar apenas em cloud X, somente serverless, etc.)
- Requisitos de compatibilidade (versões mínimas, etc.)

### 6.3 Integrações externas
Liste integrações com outros sistemas:
- APIs externas
- Serviços de terceiros
- Protocolos/especificações que devem ser seguidos

---

## 7. Modelo de dados (alto nível)

Descreva as entidades principais e relações, em nível conceitual.

### 7.1 Entidades
- Entidade A: campos principais, significado
- Entidade B: ...
- Entidade C: ...

### 7.2 Relacionamentos
- A relaciona-se com B como 1:N, etc.
- Regras de integridade (ex.: deleção em cascata, restrições)

---

## 8. User stories e critérios de aceitação

Defina user stories claras com critérios de aceitação testáveis. **Use o formato BDD (Behavior-Driven Development) rigorosamente.**
> **Importante para a IA/Dev:** Qualquer implementação referente a estas histórias DEVE ser precedida pela escrita e execução dos testes baseados nestes critérios (TDD).

Formato exigido:

```markdown
### US-001: Título
- **Tipo**: (ex.: Must-have)
- **Descrição**: Como <persona>, quero <objetivo> para <benefício>.

**Critérios de aceitação (Gherkin):**
- **Cenário 1:** Breve descrição do cenário
  - **Given** [contexto inicial]
  - **When** [ação do usuário/sistema]
  - **Then** [resultado esperado]
```

Repita para todas as histórias relevantes.

---

## 9. Diretrizes para LLM (se o projeto usar LLM)

Se o projeto não tiver LLM, você pode remover esta seção.

### 9.1 Papel da LLM
Defina o papel principal da LLM:
- Assistente de texto?
- Agente que executa ferramentas?
- Gerador de plano/código?
- Apenas backend “inteligente”?

### 9.2 Formato de entrada e saída
Especifique:
- Como o sistema envia dados para a LLM (ex.: JSON, texto natural)
- Como espera receber resposta (texto livre, JSON estruturado, código, etc.)

### 9.3 Regras e limites
- Idioma de resposta (ex.: sempre PT-BR)
- O que a LLM pode ou não pode fazer (ex.: não tomar decisões críticas sem confirmação)
- Como lidar com baixa confiança / incerteza

### 9.4 Exemplos de prompts e respostas
Inclua alguns exemplos input→output:

```json
// Exemplo 1
{
  "input": "...",
  "output": {
    "explanation": "...",
    "action": "...",
    "confidence": 0.85
  }
}
```

---

## 10. Métricas de sucesso

Liste as métricas que indicam sucesso do projeto.

### 10.1 Métricas de usuário
- Ex.: NPS, CSAT, tempo para completar tarefa, etc.

### 10.2 Métricas de negócio
- Ex.: receita incremental, redução de custo, etc.

### 10.3 Métricas técnicas
- Ex.: latência, erro, uptime, acurácia da LLM (se aplicável)

---

## 11. Riscos, dependências e questões em aberto

### 11.1 Riscos
Liste riscos conhecidos e impacto:
- Risco 1: descrição, probabilidade, impacto
- Risco 2: ...

### 11.2 Dependências
- Dependências de outros times/projetos
- Dependências de serviços/parceiros externos

### 11.3 Questões em aberto
- Perguntas que ainda precisam de resposta
- Decisões de design pendentes