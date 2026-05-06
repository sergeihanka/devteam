# devteam

An AI agent team for solo React / Node.js / TypeScript development.
Agents plan, analyze, build, review, test, and deploy — implementing only what was asked.

---

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

> **Core principle:** Implement only what was asked. No nice-to-haves. No future features. No scope creep.

---

## Setup

Do this once per machine.

### 1. Install Claude Code

**Mac**
```bash
brew install claude-code
```

**PC (Cmder / Git Bash)**
```bash
npm install -g @anthropic/claude-code
```

Verify:
```bash
claude --version
```

---

### 2. Add the devteam alias

Two variables at the top make this easy to update if anything changes.

```bash
DEVTEAM_URL="https://raw.githubusercontent.com/sergeihanka/devteam/main"
ISSUE_URL="https://github.com/farm-entry/ui/issues"

devteam() {
  local issue=$1
  claude --prompt "Fetch $DEVTEAM_URL/.claude/kickoff.md and follow those instructions exactly. The repo is farm-entry/ui. The issue number is #$issue. Fetch the issue from $ISSUE_URL/$issue. Begin."
}
```

**Mac — add to `~/.zshrc`**
```bash
open ~/.zshrc
# paste the block above at the bottom, save, then:
source ~/.zshrc
```

If `~/.zshrc` doesn't exist yet:
```bash
touch ~/.zshrc && open ~/.zshrc
```

**PC — add to Cmder startup script**
```bash
# Run this inside Cmder to open the config file:
notepad "%USERPROFILE%\AppData\Roaming\cmder\config\user_profile.cmd"
# paste the block above at the bottom, save, restart Cmder
```

> Make sure your Cmder tab is running Git Bash, not cmd.exe.
> Switch via the green + icon bottom right → select "Git Bash".

---

### 3. Add agent team config to each app repo

Create or update `CLAUDE.md` in the root of `farm-entry/ui`:

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
farm-entry/ui

## Issues
https://github.com/farm-entry/ui/issues/
```

---

## Running against an issue

```bash
cd path/to/farm-entry/ui
devteam 49
```

That's it. Claude Code fetches the kickoff instructions, pulls the issue from GitHub,
and runs the full agent chain. You step in at checkpoints only.

---

## What happens in a session

```
devteam 49
    └─► Orchestrator    determines agent chain
    └─► Planner         writes plan — STOP: you approve before continuing
    └─► UX Designer     designs screens (UI tasks only)
    └─► Analyzer        maps affected code
    └─► Developer       implements on feature branch
    └─► UX Designer     signs off on UI (UI tasks only)
    └─► Reviewer        checks scope and quality
    └─► QA Agent        writes tests
    └─► DevOps          opens PR — you review and merge
```

### Your four decision points

| When | What to do |
|---|---|
| Planner outputs the plan | Read it carefully, especially the out-of-scope section. Type "proceed" or correct it before anything is built. |
| Analyzer flags a BLOCKER | Resolve it before typing "proceed". |
| Reviewer returns CHANGES REQUIRED | Give specific instruction — Developer reruns automatically. |
| DevOps is ready to open PR | Confirm, then review on GitHub and merge when satisfied. |

---

## Updating agents

Agent prompts live in `.claude/agents/`. To edit them:

```bash
cd path/to/devteam
claude
```

- Read `AGENTS.md` before making any changes
- One agent per commit
- Commit format: `agent(<name>): <what changed>`

Changes pushed here are picked up by all app repos automatically on the next session.

---

## Stack

- React + TypeScript (frontend)
- Node.js + TypeScript (backend)
- MongoDB (database)
- Heroku (hosting)
- GitHub (version control)