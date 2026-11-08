#!/usr/bin/env bash
# Checa os invariantes do kit: espelho das skills, CLAUDE.md ≡ AGENTS.md, refs a docs/*.md.
cd "$(dirname "$0")/.." || exit 1
fail=0

# 1. Skills espelhadas
diff -r .claude/skills .agents/skills >/dev/null || { echo "FAIL: .claude/skills e .agents/skills divergem"; fail=1; }

# 2. CLAUDE.md ≡ AGENTS.md (ignora título e a linha 5, que é a única que difere)
# ponytail: acoplado às linhas 1 e 5; se o cabeçalho mudar, ajustar o sed
diff <(sed '1d;5d' CLAUDE.md) <(sed '1d;5d' AGENTS.md) >/dev/null || { echo "FAIL: CLAUDE.md e AGENTS.md divergem"; fail=1; }

# 3. Todo docs/<nome>.md citado existe (idea/prd/tasks.md são gerados no projeto que usa o kit)
for f in $(grep -rhoE 'docs/[a-z-]+\.md' --include='*.md' . | sort -u); do
  case $f in docs/idea.md|docs/prd.md|docs/tasks.md) continue ;; esac
  [ -f "$f" ] || { echo "FAIL: referência quebrada: $f"; fail=1; }
done

[ $fail -eq 0 ] && echo "OK"
exit $fail
