## LaTeX Equation Formatting

- When an equation splits across pages, prefer fixing by choosing the appropriate equation environment (e.g., `multline` instead of `align` for single equations spanning multiple lines) rather than adding workaround packages like `needspace`.
- Avoid introducing new LaTeX package dependencies for formatting issues that can be solved with built-in environments.

## Always Ask What's Next

After EVERY completed action — code change, answer, verification, plan, or any other task — use the `ask_question` tool to prompt the user for next steps before ending your response. Never end a turn without asking.

**Guidelines:**
- Offer 2–4 **contextual, actionable** options relevant to what just happened
- Never include "Other" as an option (the user can always type a custom response)
- Keep the question to one line summarizing what happened + "What's next?"

**Suggested options by context:**

| After...              | Offer these                                                             |
|----------------------|-------------------------------------------------------------------------|
| Code change          | "Run tests" · "Deep audit" · "Commit changes" · "Continue to next task" |
| Verification pass    | "Continue to next task" · "Pre-landing review" · "Commit changes"       |
| Verification fail    | "Investigate root cause" · "Show failing tests" · "Back-propagate"      |
| Plan/doc generation  | "Approve and start development" · "Revise plan" · "Deep audit"          |
| Bug fix              | "Run tests" · "Verify fix" · "Commit changes"                          |
| Question answered    | "Continue working" · "Start new task" · "Run verification"              |
| Session start        | "Show task list" · "Run verification" · "Continue last task"            |
