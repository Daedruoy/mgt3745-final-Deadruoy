# DECISION-001: Keep the posting page as the chapter's official channel, change it, or take it down

## Committed before the evidence (2026-11-27)

Dating: written on 2026-11-27, before any deployment. The page has not been deployed and no real user has used it. The commit timestamp is the proof.

Default action: Deploy the page as built (F-01/F-02, F-06, and F-07), keep it live through December 14, and ask the three observed users to post time-sensitive updates through it alongside the group chat, which it does not replace (non-goals in context/FEATURES.md). This is cheap and reversible: taking the page down is one change, and the chat stays in place the whole time.

Owner and deadline: Prince Muteteke. The evidence is read and the decision resolved by December 9. If the launch slips past December 2, the 7-day window runs past December 9, and I move the deadline with a dated note in this file.

Evidence that would change it:
- Outcome: updates posted through the tool in the first 7 days after the first real post, counted by a query in evals/queries/. The production database is cleared before launch, so test rows do not count.
- Threshold: at least 3 updates posted. Also 0 missed or wrong time-sensitive updates reported by the three observed users from their first session through December 9, counted in docs/FEEDBACK.md. The baseline is 3 incidents named in the INT-01 and INT-02 interviews.
- Guardrail: the median time for the observed chair to post one complete update of each type (three posts) stays at 2 minutes or less. If it is higher, I stop and revise the form before adding anything.

What each result would mean, committed now so I cannot move it later:
- Threshold met and guardrail holds: ship. Keep the page live.
- Fewer than 3 updates but the guardrail holds: iterate. Ask each user why they did not post, and change what they name, before touching F-06.
- Guardrail fails: iterate on the form. Reduce the required fields for the type that took longest, and record the change as a new ADR.
- Two or more of the three users say they would use the group chat instead: stop. Take the page down and record why.

## Resolved beneath

Not yet resolved. The result (with n), the decision (ship, iterate, or stop), and the reversal trigger are written here after the observed sessions and before December 14.