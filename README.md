# devteam

A structured AI agent team for solo React / Node.js / TypeScript development.
Agents plan, analyze, build, review, test, and deploy — strictly implementing only what was asked.

## Agents

| Agent | Role |
|---|---|
| **Orchestrator** | Entry point. Routes tasks to the right agents in the right order. |
| **App Architect** | Makes structural and architectural decisions. |
| **Planner** | Writes bounded task plans with testable acceptance criteria. |
| **Analyzer** | Reads existing code and maps what needs to change. |
| **UX Designer** | Designs user flows, MUI component specs, and signs off on UI. |
| **Developer** | Implements exactly what was planned — no more. |
| **Reviewer** | Checks code quality and scope compliance. |
| **QA Agent** | Writes tests against acceptance criteria. |
| **DevOps Agent** | Handles Heroku deployments, env vars, and GitHub ops. |

## Core principle

> Implement only what was asked. No nice-to-haves. No future features. No scope creep.

## Setup

### 1. Install Claude Code
```bash
npm install -g @anthropic/claude-code
```

### 2. Add the devteam alias to ~/.bashrc
```bash
devteam() {
  local issue=$1
  local repo=$(basename $(pwd))
  claude --prompt "Fetch https://raw.githubusercontent.com/sergeihanka/devteam/main/.claude/kickoff.md and follow those instructions exactly. The repo is sergeihanka/$repo. The issue number is #$issue. Fetch the issue body from GitHub. Begin."
}
```

Reload:
```bash
source ~/.bashrc
```

### 3. Add agent team reference to each app repo's CLAUDE.md
```markdown
## Agent team
Kickoff: https://raw.githubusercontent.com/sergeihanka/devteam/main/.claude/kickoff.md
Agents: https://raw.githubusercontent.com/sergeihanka/devteam/main/.claude/agents/

## Workflow checkpoints
- After Planner outputs the plan: STOP and wait for "proceed"
- After Analyzer flags a BLOCKER: STOP and wait for resolution
- After Reviewer returns CHANGES REQUIRED: STOP and wait for instruction
- Before opening a PR: STOP and confirm with the user

## Repo
sergeihanka/your-repo-name
```

## Usage

Navigate to any app repo and run:
```bash
cd path/to/your-app
devteam 42
```

Claude Code fetches the kickoff instructions, pulls the issue from GitHub, and runs
the full agent chain. You step in at checkpoints only.

## Session flow

```
devteam 42
    └─► Orchestrator    determines agent chain
    └─► Planner         writes plan → STOP: you approve
    └─► UX Designer     designs screens (UI tasks only)
    └─► Analyzer        maps affected code
    └─► Developer       implements on feature branch
    └─► UX Designer     signs off on UI (UI tasks only)
    └─► Reviewer        checks scope and quality
    └─► QA Agent        writes tests
    └─► DevOps          opens PR → you review and merge
```

## Checkpoints

| Checkpoint | What to do |
|---|---|
| After Planner | Read the plan and out-of-scope section. Type "proceed" or correct it. |
| After Analyzer BLOCKER | Resolve before continuing. |
| After Reviewer CHANGES REQUIRED | Give specific instruction — Developer reruns. |
| Before PR opens | Confirm, then review on GitHub and merge. |

## Updating agents

```bash
cd path/to/devteam
claude
```

Read `AGENTS.md` before making any changes. Commit format: `agent(<name>): <what changed>`

Changes pushed here are picked up by all app repos on the next session — no sync needed.

## Stack

- React + TypeScript (frontend)
- Node.js + TypeScript (backend)
- MongoDB (database)
- Heroku (hosting)
- GitHub (version control)