# Issue kickoff template

Use this at the start of every Claude Code session when working on a GitHub issue.
Fill in the bracketed sections. Delete the [instructions] lines before sending.

---

## Kickoff prompt

Read ~/path/to/devteam/.claude/agents/orchestrator.md and act as the Orchestrator.

## Issue
[Paste the full GitHub issue here — title, description, any comments that clarify intent.
Do not summarize. Paste the raw text. The agents work better with more context.]

## Repo
[github.com/your-org/your-repo]

## Additional context
[Optional. Anything the issue doesn't cover that the agents should know:
- Which part of the codebase is likely affected
- Related issues or PRs
- Constraints (e.g. "must not change the public API", "needs to work on mobile")
- Anything you already know about the approach]

## Branch
feat/[issue-number]-[short-slug]
e.g. feat/42-add-user-avatar

## Definition of done
A PR is open against main with:
- All acceptance criteria checked off
- Tests passing
- No unrequested changes

---

## Notes on filling this in

**The issue field:** paste everything — title, body, labels, relevant comments.
The Orchestrator and Planner use this to determine scope. A thin paste = a thin plan.

**Additional context:** front-load anything the issue author didn't write but you already know.
If you've already looked at the code and know which file needs changing, say so.
It skips unnecessary Analyzer work.

**If any agent asks clarifying questions:** answer them before it continues.
This is intentional — the agents are configured to ask rather than assume.
A short clarification round saves a wrong implementation later.

**Read the Planner's out-of-scope section** before approving the plan.
That's where missing requirements hide.

**One issue per session.** Finish, get the PR open, start fresh.

---

## Full agent sequence (for reference)

Orchestrator
  └─► [Architect]     — only if structural decisions needed
  └─► Planner         — writes plan + acceptance criteria
        └─► Analyzer  — maps affected code
              └─► Developer   — implements on feature branch
                    └─► Reviewer    — checks scope + quality
                          └─► QA    — writes tests
                                └─► DevOps  — opens PR

You review the PR. You merge. The agents never merge.