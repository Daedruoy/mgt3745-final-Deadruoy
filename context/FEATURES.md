# Features and specification

Status: ACTIVE. Copy and revise your own HW2 FEATURES.md here.

## Context
As chapter president, I depend on chairs and general members to keep initiatives moving without me present at every touchpoint. Still, time-sensitive information currently spreads unevenly: some of it lives only in casual chat or verbal exchanges rather than an official channel, and the person responsible for accuracy and records, the secretary, has no reliable way to know whether something has actually been seen or acted on. The job to be done, drawn from JOB-01 and JOB-02, is twofold: a general member needs to catch time-sensitive updates before they’re buried under newer messages, without relying on an individual reminder; the secretary and my other chairs need a clear, evidence-based signal of what’s actually been completed, rather than deciding on instinct.
## Users
See PROFILE-01 (general chapter member, commuter, single daily check window) and PROFILE-02 (Chapter Secretary, dual-role constraint on info-gathering).
## Scope and non-goals
Included: centralized posting of time-sensitive chapter information to one persistent, official location; a defined trigger for reminders rather than instinct-based judgment; visibility into whether sent information has been seen or acted on by general members or chairs.

Non-goals: this does not replace the chapter’s existing group chats, does not automate dues payment or collection, does not pull from or manage the school-wide NPHC calendar automatically, does not track brother capacity or burnout, and does not eliminate the secretary’s role in compiling the newsletter; it reduces the manual chasing and guessing around that process.


### Kano hypotheses

| Feature ID | Feature | Kano hypothesis | Segment / evidence | Reasoning |
|---|---|---|---|---|
| F-01 | Official single source-of-truth resource for time-sensitive info | Must-be | Both segments / INT-01, INT-02 | INT-01 missed Convocation timing because it lived only in casual chat; INT-02's stepshow date error traced to the same pattern, info shared verbally rather than posted officially. |
| F-02 | Requirement that time-sensitive updates go through the official channel, not casual chat only | Must-be | General member / INT-01 | Directly named as the cause of a missed Convocation practice. |
| F-03 | Rule-based reminder trigger | Performance | Secretary / INT-02 | Secretary described his current method as an art rather than a science, with no defined trigger; more consistency here scales directly with reduced guesswork. |
| F-04 | Acknowledgment/seen tracking on sent info | Attractive | Secretary / INT-02 | He currently has no way to see who's acted on something until after the fact, but described this neutrally, not as an expected baseline. |
| F-05 | Digest or highlight view surfacing older, buried messages | Performance | General member / INT-01 | He reported only reading what's fresh each day and missing anything posted earlier during high-volume periods; more visibility into older items scales with fewer missed updates. |
| F-06 | Complete-details checklist ensuring time-sensitive releases go out together in the first message | Must-be | General member / INT-01 | Dues messaging went out without deadline or payment info in the first release, causing confusion. |
| F-07 | Task/status tracker for chair follow-through | Performance | Both segments / INT-02 | Secretary described repeatedly chasing the community service chair; a visible status view would reduce, but not eliminate, this manual follow-up. |

**Built: F-01/F-02 (HW3 and HW4) and F-07 (HW5). Selected next: F-06, hand-built for the final project (docs/DDR-003.md).**

## Behavior
When a chair has a time-sensitive update, they submit it to the central resource rather than only to casual chat. The system timestamps the entry and surfaces it in a highlighted, current-items view so it isn’t buried once newer messages arrive. If an item nears its deadline without a logged acknowledgment or action from the relevant brothers, the system flags it for a reminder rather than leaving that judgment to the secretary alone. Chairs update their own task status directly, so the secretary or president can check progress without messaging each one individually.
## Constraints
Must run as a live, continuously updated page backed by a database, not a static document distributed once and read passively (revised 2026-11-27: the HW1 text named Notion, and the build is a Cloudflare Worker, D1, and a static page, see docs/ADR-001.md). Must add near-zero extra reporting burden, consistent with the finding that shrinking brother capacity is part of the underlying problem. Must not disclose sensitive personal reasons behind a missed deadline or flag, only that something is outstanding. Must be usable primarily from a phone, since brothers reported checking chats during brief windows in their day, not at a desk.

HW3 implementation note: The product scope describes the full Notion dashboard. This week's build implements only F-01/F-02, a chair submits a time-sensitive update through a form, the system logs it with a timestamp and displays it in a current-items view, as three files index.html, styles.css and app.js. Reminder logic (F-03), acknowledgment tracking (F-04), the digest view (F-05), the complete-details checklist (F-06), and chair status tracking (F-07) are out of scope for this week's build.
Update 2026-11-25: F-07 was built after that note. The PATCH /entries/:id/status endpoint and four page functions are in worker/src/index.js and app.js (HW5 DDR-001, linked from docs/DDR-LOG.md), and its criteria are checked in context/EVALS.md. F-06 is being hand-built for the final project (docs/DDR-003.md). F-03, F-04, and F-05 remain deferred.

## Acceptance

Keep your dated Kano hypotheses and selected feature. Use IDs to connect evidence, jobs, and criteria. Clearly distinguish the one-feature HW3 implementation from the larger product scope.

- [F-01/F-02-1] WHEN a chair submits a time-sensitive update, THE SYSTEM SHALL log it to the central resource with a timestamp and surface it in the current-items view.

- [F-01/F-02-2] IF the POST /entries request body is missing a required field (chair name, chair position, initiative, update title, or event date) or the field is empty, THEN THE SYSTEM SHALL reject the submission with a 400 status naming the specific missing field.

- [F-01/F-02-3] WHEN a brother views the central resource, THE SYSTEM SHALL display items in the current view based on submission date, not event or deadline date, and WHERE an item was submitted more than two weeks ago, THE SYSTEM SHALL move it to a separate older-updates section rather than hiding it.

- [F-07-1] WHEN a chair marks their own update as completed, THE SYSTEM SHALL update its status and persist the change.

- [F-07-2] WHEN a brother views the central resource, THE SYSTEM SHALL display each update's status (pending or completed) alongside its other details.

- [F-07-3] IF a chair attempts to mark an update as completed that they did not submit, THEN THE SYSTEM SHALL reject the request with a 403 status.

- [F-07-4] IF the status value is not "pending" or "completed", THEN THE SYSTEM SHALL reject the request with a 400 status.

- [F-07-5] WHEN the status update request reaches the Worker, THE SYSTEM SHALL persist it through a PATCH /entries/:id/status endpoint that binds its parameters with bind(), consistent with STANDARDS.md. This is an implementation constraint, checked by reading the handler.

- [F-03, deferred] IF a logged item nears its deadline without a recorded acknowledgment, THEN THE SYSTEM SHALL flag it for a reminder. "Nears" needs a number before this is built.

- [F-04, deferred] WHERE acknowledgment tracking is enabled for an item, THE SYSTEM SHALL show who has and has not acknowledged it, without disclosing individual reasons for non-response.

### F-06: complete-details check (final project, hand-built, docs/DDR-003.md)

A complete update depends on its type. Each type needs the five fields every update already has (chair name, chair position, initiative, update title, event or deadline date) plus these:

| Update type | `updateType` value | Extra required fields (JSON names) |
|---|---|---|
| Practice or event | `event` | `startTime`, `location` |
| Dues | `dues` | `amount`, `paymentMethod` |
| Attire | `attire` | `attireDetails` |

The extra fields come from INT-01's incidents: a practice time shared with an hour's notice, a dues message sent without payment details or a deadline, and follow-up on photoshoot attire. The existing event or deadline date serves as the dues deadline.

- [F-06-1] WHEN a chair selects an update type, THE SYSTEM SHALL show the extra fields that type requires and mark them required.

- [F-06-2] IF a submission has no update type or lacks a field its type requires, or that field is empty after trimming whitespace, THEN THE SYSTEM SHALL reject it with a 400 status naming the missing field and SHALL store nothing.

- [F-06-3] IF the update type is not event, dues, or attire, THEN THE SYSTEM SHALL reject the submission with a 400 status naming the type field.

- [F-06-4] IF the event or deadline date is not a real calendar date in YYYY-MM-DD form, THEN THE SYSTEM SHALL reject the submission with a 400 status naming the date field.

- [F-06-5] IF a submission is rejected, THEN THE SYSTEM SHALL keep everything the chair typed in the form and show the message that names the field.

- [F-06-6] WHEN a submission passes every check, THE SYSTEM SHALL store it with its type and extra fields and show those fields with the update in the current-items view.

- [F-06-7] WHERE an entry was stored before F-06 and has no type, THE SYSTEM SHALL display it without extra fields and SHALL NOT mark it incomplete.

## Verification

| Criterion | Steps and input | Expected result | Observed result | Status | Evidence / commit |
|---|---|---|---|---|---|
| F-01/F-02 (submit + log) | Filled all five fields (name, position, initiative, update text, event/deadline date) and submitted via the Post update button. | Entry appears in the current-items view with a timestamp. | Entry appeared correctly under Current updates with name, position, initiative, timestamp, and deadline all displayed. | PASS | See app screenshot |
| F-01/F-02 (two-week display) | Used `npx wrangler d1 execute` to directly edit one entry's `created_at` in D1 to 2026-09-01, more than two weeks before the other entries' actual submission dates (2026-09-23), then reloaded the page. | The backdated entry moves to a separate Older updates section; the four entries submitted on 9/23 remain in Current updates. | The backdated entry ("First crossing test") correctly appeared under Older updates, while all four 9/23 entries stayed under Current updates. | PASS | See docs/two week test.png |
| F-03 (reminder flag) | N/A this week | N/A | N/A | DEFERRED | Deferred per Scope, see ADR-001 |
| F-04 (acknowledgment tracking) | N/A this week | N/A | N/A | DEFERRED | Deferred per Scope, see ADR-001 |
| F-06 (complete-details check) | Not yet run. The evals are written before the code (docs/DDR-003.md). | See F-06-1 to F-06-7 in Acceptance. | Not yet run. | IN PROGRESS | docs/DDR-003.md |
| F-07 (chair status update) | Ran npm test against the final Worker. The tests PATCH an entry's status as its own chair and GET it back, PATCH as a different chair, and PATCH with a status that is not pending or completed. | 200 and the changed status on GET. 403 for a different chair. 400 for an invalid status. | The first run on 2026-11-12 failed the first check with a 500, because schema.sql lacked the status column. After commit e29aa2c added it, all 6 tests passed. | PASS | evals/worker.test.js, commits e29aa2c and 6191eed |
| Survive cleared cache| Posted an entry, then opened the page in an incognito/private browsing window, which starts with no local browser storage. | Entry remains visible in a fresh private window, since data now lives in D1 rather than localStorage. | Entry appeared correctly in the private window. Previously CANNOT TEST YET in HW3, since no server existed yet to test against. | PASS | See docs/HW4Example.gif |
| POST /entries validation (400 path) | Sent a POST request via curl with an incomplete body: `{"chairName":"Prince"}`, missing the other four required fields. | Server rejects the request with a 400 status and a message naming the specific missing field. | Received `400` response reading "chair position required." Confirms the validation rule that was added, traced to the new EARS statement in Acceptance. | PASS | Terminal output, curl test |
| Server unreachable | Not run | Page shows an error message instead of breaking silently if the network or server is down. | Would need to simulate a real network failure, like pointing the app at a fake URL. The code already catches this case and shows an error, but I haven't actually triggered and watched it happen. | CANNOT TEST YET | N/A |
| Server returns 500 | Not run | Page shows a readable error instead of crashing if the Worker breaks unexpectedly. | Would need to force the Worker to fail, like breaking the database connection on purpose. The code already catches this and returns a readable error, but I haven't actually triggered and watched it happen. | CANNOT TEST YET | N/A |
| Second client writes to the same table | Not run | Two chairs submitting updates at the same time don't overwrite or corrupt each other's entries. | Not tested with two people submitting at once. The database handles simultaneous new entries safely on its own, but there's no way to edit or delete entries yet, so there's nothing in place to handle conflicts if two people tried to edit the same one. | DEFERRED | Deferred per ADR-002 consequences |
