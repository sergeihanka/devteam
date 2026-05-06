# devteam

A structured AI agent team for solo React / Node.js / TypeScript development.

## What this is

A set of Claude system prompts organized as specialized agents that work together
to plan, analyze, build, review, test, and deploy software — while strictly implementing
only what was asked for.

## Agents

| Agent | Role |
|---|---|
| **Orchestrator** | Entry point. Routes tasks to the right agents in the right order. |
| **App Architect** | Makes structural and architectural decisions. |
| **Planner** | Writes bounded task plans with testable acceptance criteria. |
| **Analyzer** | Reads existing code and maps what needs to change. |
| **Developer** | Implements exactly what was planned — no more. |
| **Reviewer** | Checks code quality and scope compliance. |
| **QA Agent** | Writes tests against acceptance criteria. |
| **DevOps Agent** | Handles Heroku deployments, env vars, and GitHub ops. |

## Core principle

> Implement only what was asked. No nice-to-haves. No future features. No scope creep.

Every agent's ruleset enforces this.

## Usage

See `.claude/README.md` for setup instructions for Claude.ai Projects and Claude Code.

## Stack this was designed for

- React + TypeScript (frontend)
- Node.js + TypeScript (backend)
- MongoDB (database)
- Heroku (hosting)
- GitHub (version control)
