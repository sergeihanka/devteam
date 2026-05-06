# Handoff template

Use this when passing work between agents in a conversation thread or Claude Code session.
Copy, fill in, and paste at the start of the next agent's turn.

---

## Handoff

**From:** [agent name]
**To:** [agent name]
**Task:** [one-line description of what was requested]
**Issue:** [GitHub issue number if applicable, e.g. #42]
**Branch:** [feature branch name if one exists]

### Context
[What the previous agent did — summary only, no full output needed]

### Output to act on
[Link to / paste of the previous agent's relevant output]

### What you need to do
[Specific instruction for the receiving agent]

### Constraints
- [Any scope limits, approved decisions, or constraints to carry forward]
- Reminder: implement only what was asked. No additions.

### Acceptance criteria (from Planner)
- [ ] [paste from plan]
- [ ] ...

---

## Common handoff scenarios

### Planner -> Analyzer
What you need to do: Read the files listed in the handoff note. Map entry points,
blockers, and risks relevant to the plan above.

### Analyzer -> Developer
What you need to do: Implement the tasks in the plan. Work on branch [branch name].
Do not implement anything outside the plan. Stop and flag if anything is unclear.

### Analyzer -> UX Designer (design mode)
What you need to do: Produce a design spec and Canva mockups for the screens listed
in the plan. The Analyzer output above shows the existing component and theme patterns
to match. Ask if anything is unclear before designing.

### Developer -> UX Designer (sign-off mode)
What you need to do: Review the implementation against your design spec.
Work through the sign-off checklist. Return APPROVED, APPROVED WITH NOTES,
CHANGES REQUIRED, or BLOCKED with specific line-level feedback.

### Developer -> Reviewer
What you need to do: Review the implementation against the plan and coding standards.
Check scope compliance first — flag anything not in the plan before checking quality.

### Reviewer -> QA
What you need to do: Write tests covering every acceptance criterion in the plan.
The Reviewer verdict above is [APPROVED / APPROVED WITH NOTES]. Proceed.

### QA -> DevOps
What you need to do: Create branch [branch name] if not already created, commit all
implementation and test files, and open a PR against dev using the PR body template
in your prompt. Stop before opening the PR and confirm with the user.