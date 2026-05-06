# AI agent team

This directory contains the system prompts and handoff templates for a structured AI agent team
built for a solo React / Node.js / TypeScript developer.

## Agents

| Agent | File | Purpose |
|---|---|---|
| Orchestrator | `agents/orchestrator.md` | Entry point — routes tasks to the right agents |
| App Architect | `agents/architect.md` | Structural decisions, patterns, conventions |
| Planner | `agents/planner.md` | Task plans, scope, acceptance criteria |
| Analyzer | `agents/analyzer.md` | Reads existing code, maps dependencies |
| Developer | `agents/developer.md` | Implements exactly what was asked |
| Reviewer | `agents/reviewer.md` | Code quality and scope compliance |
| QA Agent | `agents/qa.md` | Tests and coverage |
| DevOps Agent | `agents/devops.md` | Deploys, env vars, GitHub, Heroku |

## How to use

### In Claude.ai Projects
1. Create a new Project
2. Paste `agents/orchestrator.md` as the project system prompt
3. Add all other agent `.md` files as Project knowledge files
4. Start every task by telling the Orchestrator what you need

### In Claude Code (CLI)
Claude Code reads `CLAUDE.md` automatically on session start.
You can then reference agents directly:

```
Read .claude/agents/planner.md and act as the Planner for this task: [your task]
```

Or for a full workflow:
```
Read .claude/agents/orchestrator.md. My task is: [your task]
```

### Handoff template
Use `.claude/handoff-template.md` when passing work between agents in a conversation.

## Workflow order

```
Orchestrator
    └─► Architect (if structural impact)
    └─► Planner
    └─► Analyzer
    └─► Developer
    └─► Reviewer
    └─► QA Agent
    └─► DevOps Agent (on deploy)
```

Bug fix shortcut: `Analyzer → Developer → Reviewer → QA`
