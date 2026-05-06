# Project context

## Stack
- Frontend: React, TypeScript
- Backend: Node.js, TypeScript
- Database: MongoDB
- Hosting: Heroku
- Version control: GitHub

## Agent team
This project uses a structured AI agent team. All agent system prompts live in `.claude/agents/`.

When starting any task, begin by pasting the **Orchestrator** prompt (`.claude/agents/orchestrator.md`)
into your Claude session. It will route to the correct agents in the correct order.

See `.claude/README.md` for full usage instructions.

## Core rules (enforced by all agents)
- Implement **only** what was asked. No extra features.
- No "nice to have" or "future improvement" additions.
- Abstract only when duplication is real and present — not anticipated.
- No TODOs referencing features that weren't requested.
- If scope is unclear, ask one clarifying question before proceeding.
