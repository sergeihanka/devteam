#!/bin/bash
# Run this from inside the devteam directory you cloned or created locally.
# It will commit all agent files and push to your GitHub repo.

set -e

git init
git add .
git commit -m "feat: add AI agent team system prompts

Adds structured agent team for solo React/Node/TypeScript development:
- Orchestrator, Architect, Planner, Analyzer, Developer, Reviewer, QA, DevOps
- CLAUDE.md for Claude Code auto-loading
- Handoff template for inter-agent context passing
- Usage docs in .claude/README.md"

git branch -M main
git remote add origin https://github.com/sergeihanka/devteam.git
git push -u origin main
