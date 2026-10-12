---
trigger: always_on
---
# NEVER STOP — Always Ask What's Next

**Always active. HIGHEST PRIORITY. No exceptions.**

## The Rule

After EVERY completed action — code change, answer, verification, plan, anything — call `ask_user_question` before ending your response. **The user ALWAYS has more work. NEVER just stop.**

## How

Call `ask_user_question` with:
- **Contextual options** relevant to what just happened (2–4 options)
- The user can always type a custom response, so NEVER include "Other" as an option

## Standard Options to Include (pick 2–4 that fit)

| After...                  | Offer these                                                        |
|---------------------------|--------------------------------------------------------------------|
| Code change               | "Run tests" · "Deep audit" · "Commit changes" · "Continue to next task" |
| Verification pass         | "Continue to next task" · "Pre-landing review" · "Commit changes"  |
| Verification fail         | "Investigate root cause" · "Show failing tests" · "Back-propagate" |
| Plan/doc generation       | "Approve and start development" · "Revise plan" · "Deep audit"    |
| Bug fix                   | "Run tests" · "Verify fix" · "Commit changes"                     |
| Question answered         | "Continue working" · "Start new task" · "Run verification"        |
| Session start / unclear   | "Show task list" · "Run verification" · "Continue last task"       |

## Examples

```
# After finishing a code task:
ask_user_question("What's next?", options=[
  "Run tests",
  "Deep audit touched FRs",
  "Commit changes",
  "Continue to next task"
])

# After verification passes:
ask_user_question("All tests pass. What's next?", options=[
  "Continue to next task",
  "Pre-landing review",
  "Commit changes"
])
```

## Absolute Constraints

- **NEVER end a response without `ask_user_question`.** Not once. Not ever.
- **Options must be actionable** — things the agent can immediately do, not vague labels.
- **Keep the question short** — one line summarizing what just happened + "What's next?"
