# PROJECT

Status: ACTIVE.

## 0. Final-project problem statement (written 2026-11-23)

Dating: sections 1 to 6 below are my HW1 work from September and stay as the record. This section was written on 2026-11-23, after the HW3 to HW5 builds, so it states what the interviews showed and what I then built. It is not a prediction made before the build.

**Reframe, in one sentence:** How does the chapter make every time-sensitive update live in one official place that a brother who checks once a day will actually see?

**How this differs from Framing A.** Framing A asked how I, as president, manage four initiatives without burning out brothers or losing oversight. My two interviews point somewhere else. Each incident in them traces to where information was posted, not to brothers being overcommitted: a Convocation practice time shared in a casual chat (INT-01), a dues message released without payment details or a deadline (INT-01), and a stepshow date shared verbally and then printed wrong in the newsletter (INT-02). The reframe moves the problem from my oversight to the place information lives and who can see it.

**Temporary-resolution stance.** This tool is a resolution for this semester, not a solution. It is good enough if chairs post through it and brothers stop missing updates. I will revisit it when the next president takes office or when the chapter's channels change.

**Success measures**

| Type | Measure | Baseline | Target | How measured |
|---|---|---|---|---|
| Outcome | Missed or wrong time-sensitive updates reported by the three observed users, from each user's first session through December 9 | 3 incidents named in the INT-01 and INT-02 interviews, which is a count and not a rate | 0 | Each user is asked at the end of the window and the count goes in docs/FEEDBACK.md |
| Leading indicator | Updates posted through the tool in the first 7 days after launch | 0, since the tool is not yet deployed | At least 3 | A query in evals/queries/ that counts production rows created since launch. The production database is cleared before launch so test rows do not count. |
| Guardrail | Median time for a chair to post a complete update, from opening the form to the confirmation | Not yet measured | 2 minutes or less. If it is higher, I stop and revise the form before adding anything. | A stopwatch during the chair's observed session. The chair posts one update of each type, so the median is of three posts, and the three times are listed beside it. |

The guardrail protects the rule that the tool adds near-zero extra burden. F-06 adds required fields, so it is the feature most likely to break it.

**What these measures can and cannot show.** Three users can show problem-solution fit and nothing stronger. The users are brothers I know, so their answers may run kind. The baseline is three incidents from two interviews, which is not a rate, so a result of 0 is encouraging and not proof. The page has no login, so anyone with the link can read and post. That limit is recorded in docs/ADR-001.md.

## 1. Candidate Problem

My fraternity, the Nu Mu chapter of Alpha Phi Alpha Fraternity, Inc., is expected to consistently meet high standards in fulfilling obligations both within the chapter and outside it, such as national/regional requirements, homecoming stepshows, the Scholarship pageant, and general school events. Still, brothers' capacity, time, and energy are finite and consistently shrinking as school ramps up and personal matters become involved.

## 2. Wickedness Test

No stopping rule: Every semester/year brings changes in membership and obligations. There is no official stopping point for the chapter and no ceiling for our events. The problem I aim to fix is to solidify the chapter culture so it outlives the current brothers and I.

Good/bad not true/false: There is no true/false way to lead an organization, as every organization comes with its own problems and members. There are various methods that can affect the direction of the chapter in different ways.

No test of a solution: There is no official successful test of a solution, as a semester where I, as president, can submit a full chapter report that hits all the markers might be assumed as "good"; however, if I have multiple burnt-out brothers who lose motivation to continue the next semester, then ultimately the problem continues.

No trial-and-error: This may be a watch, as technically my term is two full semesters, so I have the option to try two completely different strategies over my two semesters. However, it could be the same unresolved tension within the chapter that carries over.

Numerous explanations for the discrepancy: This holds, as there are countless possibilities of error; brothers can overcommit outside the chapter, chairs can fail their tasks, or national's expectations can become disconnected from the chapter size and resources.

**Verdict: This is a wicked problem**

## 3. Three Framings

**Framing A (the obvious one):** How do I manage four initiatives, homecoming stepshow, scholarship pageant, general events, and brotherhood, without burning out brothers or losing oversight as president?

**Framing B (stakeholder shift):** How much of my limited time, money, and energy do I owe an organization whose demands keep expanding and that I don't control?

**Framing C (goal shift):** How does the chapter sustain brotherhood and member well-being under external obligations, national and regional requirements, homecoming, and the scholarship pageant that the chapter has no authority to scale down?

## 4. Commit and Justify

**Chosen framing:** How do I manage four initiatives, homecoming stepshow, scholarship pageant, general events, and brotherhood, without burning out brothers or losing oversight as president?

**Why:** This framing is the most relevant to me and my involvement, and it breaks down my thinking as the president of the organization. Ultimately, as the leader of the fraternity, not only must I lead the chapter, but I also serve as the liaison between the regional and national organizations, so more of the responsibility naturally falls on me.

**What this framing makes invisible:** This framing treats the chapter brothers as a single group with roughly equal capacity, hiding how differently a senior with a lighter schedule and a sophomore first getting into their classes may have. It takes the four initiatives as fixed and never asks whether national/regional requirements, homecoming, and the pageant are the right scope for this chapter's current size, since a management frame only asks how to run them well, not whether they should run in this form.

## 5. Oath Check

**The tool I already assumed:** I've assumed a mix of Notion and Claude Code.

**What would have to be true for it to be justified:** A Claude Code and Notion system is justified only as a way to manage my specific bandwidth constraint, giving me real-time visibility into chair decisions and brother capacity, not as a fix for the wicked problem itself, since no tool changes the fact that external obligations are fixed while brother capacity isn't. For it to hold up, brothers would need to self-report honestly and consistently, which requires trust that I won't use the data against them; the system would have to add near-zero extra burden given that shrinking capacity is part of the problem; and it would need to preserve chair authority rather than let me override their judgment remotely without a full discussion. **Update 2026-11-23:** The Notion assumption did not survive. The tool I built is a Cloudflare Worker with a D1 database and a static page, chosen in the HW4 Gate and recorded in ADR-002 in context/ARCHITECTURE.md and in docs/ADR-001.md. The three conditions above still stand. The guardrail in section 0 measures the second one, the added burden.

## 6. Adequacy Sketch

A good enough system right now would be to implement a Notion board that allows my chairs and their committees to write down all their updates in real time and gives me daily reports on how the initiative is progressing relative to the planned timeline. Switching away from our current system of multiple group chats and lengthy chapter meetings would allow faster decision-making and remove many roadblocks and sources of burnout for our chapter. **Update 2026-11-23:** The Notion board in this sketch was replaced by a posting page. Its core is unchanged: chairs write an update once, in one official place. Its daily progress reports to the president are not built. Reminders, acknowledgment tracking, and the digest view (F-03, F-04, F-05) are deferred in context/FEATURES.md.