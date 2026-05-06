# Session kickoff

You are running the AI agent team for this repository.

## Agent team location
All agent prompts are at:
https://raw.githubusercontent.com/sergeihanka/devteam/main/.claude/agents/

## Your first action
1. Fetch the Orchestrator prompt from the URL above
2. Fetch the full issue body from GitHub using the issue number provided
3. Run the Orchestrator against the issue
4. Proceed through the agent chain, fetching each agent prompt from the URL above as you go

## Checkpoint rules
- After Planner outputs the plan: STOP and wait for "proceed"
- After Analyzer flags a BLOCKER: STOP and wait for resolution
- After Reviewer returns CHANGES REQUIRED: STOP and wait for instruction
- Before opening a PR: STOP and confirm with the user

## How to fetch agent prompts
curl https://raw.githubusercontent.com/sergeihanka/devteam/main/.claude/agents/[agent-name].md

## Issue number
Provided by the user at session start.