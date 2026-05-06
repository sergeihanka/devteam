# AGENTS.md

Instructions for Claude Code on how to read, edit, and maintain the AI agent team
in this repository.

---

## What this repo is

A structured set of AI agent system prompts for a solo React / Node.js / TypeScript
developer. Each file in `.claude/agents/` is a standalone system prompt for a
specialized agent. Changes here directly affect how those agents behave.

---

## File map

```
CLAUDE.md                        ← Project context (stack, core rules)
AGENTS.md                        ← This file
README.md                        ← Repo overview
.claude/
  README.md                      ← Usage instructions
  handoff-template.md            ← Inter-agent handoff format
  agents/
    orchestrator.md              ← Entry point, routing logic
    architect.md                 ← Structural decisions
    planner.md                   ← Task planning, acceptance criteria
    analyzer.md                  ← Code reading and mapping
    developer.md                 ← Implementation rules and standards
    reviewer.md                  ← Code review checklist and verdicts
    qa.md                        ← Test writing rules
    devops.md                    ← Heroku, GitHub, env var handling
```

---

## Rules for editing agent prompts

### 1. Surgical edits only
When asked to update an agent, change only what was asked.
Do not reformat the whole file, reorder sections, or "clean up" unrelated content.
Prompt drift from unintended edits is hard to detect and degrades agent behavior.

### 2. Preserve section structure
Every agent file has a consistent structure:
- `# Agent name` — heading
- `## Role` — one paragraph, what the agent is
- `## Your job` or `## Stack` — context
- `## Rules — non-negotiable` — the behavioral constraints (most sensitive section)
- `## Output format` — how the agent structures its response

Do not rename, merge, or remove sections unless explicitly instructed.

### 3. Rules are the most sensitive section
The `## Rules` section controls agent behavior most directly.
When adding a rule:
- Add it as a new numbered item
- State it as a clear imperative ("Do X" / "Never do Y")
- Do not renumber existing rules — append new ones at the end

When removing a rule:
- Confirm with the user before deleting
- Note the removal in the commit message

### 4. One agent per commit
If changes span multiple agents, commit each agent file separately.
This keeps the git history readable and makes rollbacks precise.

### 5. Commit message format
```
agent(<name>): <what changed>

Examples:
agent(developer): add rule requiring typed MongoDB filter objects
agent(reviewer): expand React checklist with key stability check
agent(orchestrator): add routing rule for documentation requests
agent(planner): clarify acceptance criteria must be pass/fail
```

### 6. Never change core rules in CLAUDE.md without instruction
The five core rules in `CLAUDE.md` apply to all agents. Changing them has
system-wide effect. Only edit that section if explicitly asked.

---

## PR workflow

Every task that produces code ends with **DevOps opening a PR**.
The user reviews and merges. **Agents never merge.**

---

## How to handle common requests

### "Add a rule to [agent]"
1. Read `.claude/agents/<agent>.md`
2. Locate the `## Rules` section
3. Append the new rule as the next numbered item
4. Commit: `agent(<name>): add rule — <one line summary>`

### "Remove a rule from [agent]"
1. Read the file
2. Show the user the exact rule you are about to remove
3. Wait for confirmation
4. Remove it, renumber if needed
5. Commit: `agent(<name>): remove rule — <one line summary>`

### "Update the output format for [agent]"
1. Read the file
2. Edit only the `## Output format` section
3. Commit: `agent(<name>): update output format`

### "Add a new agent"
1. Ask the user for: role name, purpose, rules, output format
2. Use the existing agent files as structural templates
3. Create `.claude/agents/<name>.md`
4. Add the new agent to the table in `.claude/README.md`
5. Add a routing rule to `orchestrator.md` if applicable
6. Commit all changed files separately (new agent first, then orchestrator, then README)

### "Rename or remove an agent"
1. Confirm with the user — this affects routing in `orchestrator.md`
2. Update `orchestrator.md` routing table
3. Update `.claude/README.md` agent table
4. Rename or delete the file
5. Commit with a clear message explaining the change

### "Roll back [agent] to a previous version"
```bash
git log --oneline .claude/agents/<agent>.md   # find the commit
git checkout <commit-hash> -- .claude/agents/<agent>.md
git commit -m "agent(<name>): revert to <commit-hash>"
```

---

## What Claude Code should NOT do

- Do not rewrite an agent prompt from scratch unless explicitly asked
- Do not add sections that don't exist in the template structure
- Do not change multiple agents in a single commit
- Do not edit `CLAUDE.md` core rules without explicit instruction
- Do not "improve" wording speculatively — prompt changes have behavioral consequences
