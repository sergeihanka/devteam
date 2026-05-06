# Agent team — operational reference

This file is read by Claude Code during a session. It defines the file map,
workflow order, and rules for editing agent prompts.

## File map

```
README.md                        <- Human-facing repo overview
CLAUDE.md                        <- Project context, auto-read by Claude Code
AGENTS.md                        <- Rules for editing agent prompts
.claude/
  README.md                      <- This file — operational reference for Claude Code
  kickoff.md                     <- Fetched automatically by the devteam alias
  handoff-template.md            <- Inter-agent context passing
  agents/
    orchestrator.md              <- Entry point, routing logic
    architect.md                 <- Structural decisions
    planner.md                   <- Task planning, acceptance criteria
    analyzer.md                  <- Code reading and mapping
    ux-designer.md               <- User flows, MUI specs, Canva mockups, UI sign-off
    developer.md                 <- Implementation rules and coding standards
    reviewer.md                  <- Code review checklist and verdicts
    qa.md                        <- Test writing rules
    devops.md                    <- Heroku, GitHub, env vars, PR creation
```

## Workflow order

```
Orchestrator
    |-> Architect           if structural decisions needed
    |-> Planner             STOP after output — wait for user approval
    |-> UX Designer         if UI work — design before development
    |-> Analyzer            STOP if BLOCKER — wait for resolution
    |-> Developer           works on feature branch, never main
    |-> UX Designer         if UI work — sign-off after development
    |-> Reviewer            STOP if CHANGES REQUIRED — wait for instruction
    |-> QA Agent
    |-> DevOps              opens PR — STOP and confirm before creating
```

Bug fix:              Analyzer -> Developer -> Reviewer -> QA -> DevOps
Logic only (no UI):   skip UX Designer entirely
Read-only query:      Analyzer only
Deploy only:          DevOps only

## Checkpoint rules

These apply in every session — do not skip them:
- After Planner outputs the plan: STOP and wait for "proceed"
- After Analyzer flags a BLOCKER: STOP and wait for resolution
- After Reviewer returns CHANGES REQUIRED: STOP and wait for instruction
- Before opening a PR: STOP and confirm with the user

## Rules for editing agent prompts

Read AGENTS.md before making any changes to files in agents/.
One agent per commit. Commit format: agent(<name>): <what changed>
Do not reformat, reorder, or clean up sections that were not asked about.