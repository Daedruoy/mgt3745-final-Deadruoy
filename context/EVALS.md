# EVALS.md

Status: reorganized on 2026-11-27 (Audit 1, docs/AUDIT.md). The final-project sections come first. The HW5 sections that this file carried forward on 2026-11-12 follow, kept as the record of that work.

## Final project

### Success criteria

How each F-06 and F-07 row is checked. "Test" means a case in evals/worker.test.js. "Judgment" means a page behavior graded by two graders, me and the graduated brother named in docs/DDR-002.md, with their agreement counted. "Human" means read by hand. The F-06 test cases are written before the F-06 code (docs/DDR-003.md). The rows themselves are in context/FEATURES.md.

| Row | Checked by | Where |
|---|---|---|
| F-01/F-02-1: submit, log, and show with a timestamp | test | evals/worker.test.js, "POST then GET shows it" and "GET /entries is 200 + array" |
| F-01/F-02-2: a missing field gives a 400 naming it | test | evals/worker.test.js, "POST with only chairName is 400" |
| F-01/F-02-3: current and older sections | human | Checked on 2026-09-23, in the verification table in context/FEATURES.md. The screenshot was not carried into this repository. |
| F-07-1: a chair marks their own update completed | test | evals/worker.test.js, "PATCH then GET reflects it" |
| F-07-2: status shown beside each update | judgment | Graded with the F-06 page behavior |
| F-07-3: a different chair is rejected with a 403 | test | evals/worker.test.js, "mismatched chairName is 403" |
| F-07-4: an invalid status gives a 400 | test | evals/worker.test.js, "invalid status is 400" |
| F-07-5: the endpoint binds its parameters | human | worker/src/index.js, PATCH /entries/:id/status handler, read by hand |
| F-06-1: the form shows the extra fields for the chosen type | judgment | Graded on the deployed page |
| F-06-2: a missing type or field gives a 400 naming it, and nothing is stored | test | evals/worker.test.js, new, written before the F-06 code |
| F-06-3: an unknown type gives a 400 | test | evals/worker.test.js, new, written before the F-06 code |
| F-06-4: a date that is not a real YYYY-MM-DD date gives a 400 | test | evals/worker.test.js, new, written before the F-06 code |
| F-06-5: a rejected submission keeps what the chair typed and shows the message | judgment | Graded on the deployed page |
| F-06-6: a passing submission is stored and shown with its extra fields | test and judgment | The store is a new case in evals/worker.test.js. The display is graded on the page. |
| F-06-7: an entry stored before F-06 shows without extra fields and is not marked incomplete | test | A new case in evals/worker.test.js, with a legacy row inserted directly into the local database |

### Error log

Failures observed in this project, counted, sorted by count. These rows were added on 2026-11-27 from failures already found. New rows are added as they happen.

| Failure | Count | Source | Category |
|---|---|---|---|
| Claim written without a traceable source: the AI Studio "five URL paths" sentence in ADR-001, the Live Server date taken from a stale README, the Node 22 maintenance date taken from a third-party page | 3 | Claude drafts, caught when I checked them against my HW5 records and the official pages | verification |
| HW4 Gate totals wrong (76, 45, 39 where the weights give 79, 47, 40), then copied unverified into ADR-001 | 1 | My HW4 arithmetic, then a Claude draft. Caught by the Copilot audit and confirmed by recomputing. | specification |
| The DDR-004 process sentence contradicted its own history | 1 | Claude draft, caught by the Copilot audit | verification |
| schema.sql lacked the status column the Worker writes | 1 | Carried-forward HW4 and HW5 code, found by npm test on 2026-11-12 | schema drift |
| Copilot returned findings instead of the requested table, and assigned verdicts the prompt forbids | 1 | Copilot (docs/DDR-005.md) | tool |
| The Cloudflare login token expired during a database export (authentication error 10000) | 1 | Environment | tooling |

Most frequent category: claims without a traceable source. The response so far is that every number and date in a draft is traced to a command output, a file, or a page, and anything that cannot be traced comes out (the verification plan in docs/DDR-002.md).

### Evals

- **Code:** `npm test` runs node:test over evals/. The tests POST and PATCH entries, so they write rows. Run them against a local Worker with a local database. Never run them against the HW4 Worker, which the page still calls, or against the production database after launch. Terminal 1: `npx wrangler d1 execute mgt3745-final-entries --local --file=schema.sql --config worker/wrangler.toml`, then `npm run dev`. Terminal 2: `API=http://localhost:8787 npm test`. Result so far: 6 tests, 6 passing against the deployed final-project Worker on 2026-11-12 (commits e29aa2c and 6191eed).
- **Judgment:** a record in evals/judgment.md, written when the F-06 page behavior is graded. Two graders, me and the graduated brother named in docs/DDR-002.md, with agreement counted.
- **Decision metric:** the rerunnable query for the leading indicator in context/PROJECT.md (updates posted in the first seven days) goes in evals/queries/.

### RAT verdict and production verdict

Not yet resolved. The RAT verdict comes after the three observed sessions. The production verdict comes after the page is deployed and used, and the decision is resolved in docs/DECISION-001.md.

## Carried forward from HW5 (September 29 to 30, 2026)

Dating: sections 1 to 4 below are my HW5 work, kept as the record and unchanged. They predict and measure the delegation of F-07 to bolt.new, not the final build. Their paths refer to the HW5 layout. worker.js is now worker/src/index.js, and docs/JUDGMENT.md and docs/COMPARISON.md are in the HW5 repository (mgt3745-hw5), not in this one. The HW4 verification table that was carried here is kept in context/FEATURES.md, where it is current.

### 1. RAT statement
The riskiest assumption in delegating F-07 to bolt.new is that it will implement status updates by calling my existing Worker rather than inventing its own client-side storage for completion state. If it invents parallel storage instead of using D1, the feature will not actually solve the problem, since status would not persist or sync the way ADR-002 requires, and the delegation would cost more review and rework time than building it by hand.

### 2. Prediction Stake (before build, 2026-09-29 15:47)
- **Tight:** At least 3 of 4 EARS rows for F-07 will pass on bolt's first output.
  - Resolved 2026-09-29: 1 of 4 passed outright (Row 2, with a wording mismatch), 1 partial (Row 1), 2 failed (Rows 3 and 4). The Tight prediction was wrong; the actual rate was well below 3 of 4.
- **Loose:** bolt will follow STYLE.md's color and spacing tokens more accurately than AI Studio does on the same prompt.
  - Resolved 2026-09-30: False, narrowly. Both tools matched STYLE.md's core tokens closely. AI Studio introduced one new color (#e2d3a7) not in STYLE.md; bolt introduced several. Full comparison in docs/COMPARISON.md.
- **Open:** bolt will introduce a dependency I did not ask for.
  - Resolved 2026-09-29: true. package.json listed Supabase, React, lucide-react, and Tailwind, none imported by the actual app.js logic that mattered, but present in the delivered zip. Supabase's presence is a notable finding on its own, since it directly contradicts ADR-002's decision to use Cloudflare D1.

### 3. Success criteria
| EARS row (feature) | Checked by | Where |
|---|---|---|
| WHEN a chair marks their own update as completed, THE SYSTEM SHALL update its status and persist the change. | test | evals/worker.test.js, "EARS: WHEN a chair marks their own update as completed..." |
| WHEN a brother views the central resource, THE SYSTEM SHALL display each update's status (pending or completed) alongside its other details. | judgment | docs/JUDGMENT.md #10 |
| IF a chair attempts to mark an update as completed that they did not submit, THEN THE SYSTEM SHALL reject the request. | test | evals/worker.test.js, "EARS: IF a chair attempts to mark an update as completed that they did not submit..." |
| WHEN the status update request reaches the Worker, THE SYSTEM SHALL persist it via a new endpoint using bind(), consistent with STANDARDS.md. | human | worker.js, PATCH /entries/:id/status handler, read and verified by hand; also docs/JUDGMENT.md #3 |

### 4. Error-analysis log
| Failure (a few words) | Count | Source | Category |
|---|---|---|---|
| Tool made unauthorized writes to live production Worker | 2 | bolt, AI Studio | architecture |
| Tool introduced a color not in STYLE.md | 2 | bolt, AI Studio | STYLE |
| Tool wrote unrequested scope beyond the three named files | 1 | bolt | scope |
| Tool invented a workaround instead of surfacing a spec conflict | 1 | bolt | architecture |
| Status badge label did not match FEATURES.md wording ("Active" not "Pending") | 1 | bolt | Specification |
| Unused dependency present in delivered artifact | 1 | bolt | dependency |
| Ownership check missing entirely on first output | 1 | bolt | STANDARDS |
| Pre-existing evals test written against wrong schema | 1 | template starter file, caught before running | Specification |
| npm test module-type warning, missing "type": "module" | 1 | package.json | craft |
| Tool performed a web search despite Grounding toggle disabled | 1 | AI Studio | architecture |
| Contrast failure in pre-existing .update-meta styling (4.42:1) | 1 | carried forward from HW4, caught this week | STYLE |

Most frequent categories: unauthorized production writes and STYLE.md token deviations, each appearing across both tools. These are the two failure modes worth prioritizing in future delegation: constrain what a tool can reach (a sandboxed or non-production Worker for testing), and give explicit, closed-set color instructions rather than trusting a tool to infer "stay within these tokens."

### 5. Evals
- **Code:** `npm test` with `API=https://mgt3745-hw4.princemuteteke.workers.dev`; 6 tests, 6 passing. Screenshot in README.
- **Judgment:** docs/JUDGMENT.md, 10 questions, two graders, agreement 100%.