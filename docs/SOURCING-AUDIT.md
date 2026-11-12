# Sourcing Audit

## Audit 1, November 2026

### Prediction Stake (commit before any evidence)

I predict that at least 90 percent of the rows in my inventory will land in the Adopt or Trial rings. The stack is mainstream, free, and replaceable with a git clone or a CLI swap, which is what the Switching cost column in TOOLS.md already says. Resolution: Tight, a percentage of rows. The prediction fails if more than 10 percent of the rows land in Assess or Hold.

### Weights (commit in their own commit, before scoring)

| Criterion | Weight | Why this weight for this project |
|-----------|--------|----------------------------------|
| Stability | 25 | Chair submissions are time-sensitive, so a dependency that breaks or changes behavior between releases costs the chapter trust it cannot easily rebuild. |
| Pricing predictability | 25 | Everything runs on a free tier, and a free tier that shrinks or ends stops the tool outright. This semester's GitHub Models withdrawal shows that it happens. |
| Institutional fit | 15 | The course and its graders run on Cloudflare and GitHub through December 14, so fit matters now. The weight is lower because the tool outlives the course. |
| Exit cost | 35 | The chapter keeps using the tool after I leave, and whoever maintains it will not have my hours, so how quickly a service can be replaced decides whether the tool survives. |

Total: 100

### Inventory

| Dependency | Kind (package, dev package, platform, model, builder, CDN script) | Where it is recorded | Ships to users? |
|------------|------|------|------|
| wrangler | Installed 4.160.1 (released 2026-11-11 14:45 UTC). Latest is 4.161.0, released 2026-11-12 13:40 UTC. | Cloudflare, one publishing account listed: wrangler-publisher, workers-devprod@cloudflare.com | MIT OR Apache-2.0 | Free CLI | 13 releases between 2026-10-22 and 2026-11-12, about one every two days. Requires Node 22.12.0 or newer. 9 direct dependencies, two of them pre-release versions: unenv 2.0.0-rc.24 and miniflare 5.20261110.2-beta. npm audit reports 0 vulnerabilities, no deprecation notice, 38 packages installed. package.json says ^4 and no lockfile is committed. | 2026-11-11 and 2026-11-12 |
| Dev container image javascript-node:22 (Node.js 22 on Debian 13) | Tag :22 follows the Node 22 line, not a pinned digest. The container reports Debian GNU/Linux 13 (trixie). | Microsoft dev containers images, Node.js release team | Terms not read | Free | Node 22 moved from Active LTS to Maintenance LTS in October 2026 and reaches end of life on April 30, 2027. That date comes from a third-party summary, so read nodejs.org/en/about/previous-releases to confirm it. wrangler's Node floor is 22.12.0, so the image and the CLI move together. | 2026-11-12 |
| HW4 Worker deployment (mgt3745-hw4.princemuteteke.workers.dev) | Not versioned. A GET to /entries returned HTTP 200 on 2026-11-12. | Me, on my own Cloudflare account | Cloudflare terms of service | Same Free plan limits as any Worker on the account | app.js line 4 sends every request to this URL. The final repo's own Worker has no database yet, since worker/wrangler.toml still has the placeholder database_id. The page depends on code and data that live outside this repository. | 2026-11-12 |
| xdg-utils and unzip | xdg-utils 1.2.1-2 and unzip 6.0-29+deb13u1, Debian 13 (trixie) | Debian Project | Debian main archive, which holds only free software. Copyright files not read. | Free | unzip 6.0-29+deb13u1 is also listed in trixie-security. | 2026-11-12 |

Installed npm packages: 38, which is 1 direct dependency (wrangler) and 37 transitive, with 0 vulnerabilities reported by `npm install` on 2026-11-11. There are no CDN scripts. The only script tag loads app.js, my own file. My DDR log has no entries, so there are no builders to list.

### Evidence

| Dependency | Latest version and date | Maintainers or vendor | License or terms | Limits or price | Other notes | Checked on |
|------------|------|------|------|------|------|------|
| wrangler | Installed 4.160.1, released 2026-11-11 14:45 UTC. Latest is 4.161.0, released 2026-11-12 13:40 UTC. | Cloudflare, one publishing account listed: wrangler-publisher, workers-devprod@cloudflare.com | MIT OR Apache-2.0 | Free CLI | 13 releases between 2026-10-22 and 2026-11-12, about one every two days. Requires Node 22.12.0 or newer. 9 direct dependencies, two of them pre-release versions: unenv 2.0.0-rc.24 and miniflare 5.20261110.2-beta. npm audit reports 0 vulnerabilities, no deprecation notice, 38 packages installed. When audited, package.json said ^4 and no lockfile was committed. | 2026-11-11 and 2026-11-12 |
| Cloudflare Workers (Free plan) | Hosted service, not versioned | Cloudflare | Cloudflare terms of service | 100,000 requests per day and 10 ms of CPU time per invocation on Free, plus a burst limit of 1,000 requests per minute. The paid plan is a $5.00 monthly subscription. | Source: developers.cloudflare.com/workers/platform/pricing and /workers/platform/limits | 2026-11-11 |
| Cloudflare D1 (Free plan) | Hosted service, not versioned | Cloudflare | Cloudflare terms of service | 5 GB total storage, 5 million rows read per day, and 100,000 rows written per day. 500 MB per database on Free. | Cloudflare says the Free plan will always include D1 for prototyping, and at the daily read or write limit queries stop working. Time Travel restores a database to any minute in the last 7 days on Free, from a 2023 changelog entry I did not re-verify. Sources: cloudflare.com/plans and developers.cloudflare.com/d1/platform/pricing | 2026-11-11 |
| HW4 Worker deployment (mgt3745-hw4.princemuteteke.workers.dev) | Not versioned. A GET to /entries returned HTTP 200 on 2026-11-12. | Me, on my own Cloudflare account | Cloudflare terms of service | Same Free plan limits as any Worker on the account | app.js line 4 sends every request to this URL. The final repo's own Worker had no database when I audited, since worker/wrangler.toml still held the placeholder database_id. The page depends on code and data that live outside this repository. | 2026-11-12 |
| GitHub (Free personal account) | Hosted service, not versioned | GitHub, owned by Microsoft | GitHub terms of service | Unlimited public and private repositories with unlimited collaborators. | Source: docs.github.com/en/get-started/learning-about-github/githubs-plans | 2026-11-11 |
| GitHub Codespaces | Hosted service, not versioned | GitHub | GitHub terms of service | Free personal accounts get 15 GB-month of storage and 120 hours of compute. | With no payment method set, use is blocked once either quota runs out, until the next monthly cycle. I reached the storage limit on 2026-10-26. Source: docs.github.com/en/billing/concepts/product-billing/github-codespaces | 2026-11-11 |
| GitHub Copilot | Hosted service, not versioned | GitHub, owned by Microsoft | GitHub terms and Copilot terms | Copilot Free allows 2,000 completions a month. Verified students get Copilot Student, which has unlimited completions and an allowance of AI credits at no cost. | GitHub's own plan pages describe the free chat allowance two ways: up to 50 premium requests per month on one and an allowance of AI credits on another, so the pricing model is mid-change. A secondary site says GitHub reevaluates student eligibility every month. Source: docs.github.com/en/copilot/concepts/billing/individual-plans | 2026-11-11 |
| Dev container image javascript-node:22 (Node.js 22 on Debian 13) | Tag :22 follows the Node 22 line, not a pinned digest. The container reports Debian GNU/Linux 13 (trixie) and Node v22.23.4. The Node downloads page lists v26.13.1 as the latest LTS and v27.0.0-alpha.0.1.0 as the latest alpha. | Microsoft dev containers images, Node.js release team | Terms not read | Free | The Node release schedule (github.com/nodejs/Release, schedule.json) lists v22 as starting 2024-04-24, entering LTS on 2024-10-29, entering maintenance on 2025-10-21, and ending on 2027-04-30. Node 22 has been in maintenance for a year, with about five and a half months of support left. wrangler requires Node 22.12.0 or newer. | 2026-11-12 |
| Live Server (ritwickdey.LiveServer) | 5.7.10, last updated 2026-02-27 (Marketplace) | Ritwick Dey, individual maintainer | MIT, per the repository mirror | Free | Published 2017-06-27, and the page shows an update about eight and a half months before this audit. The changelog in its GitHub README stops at 5.6.1 in April 2019, so the README lags the Marketplace, and I first used it by mistake. A mirror lists the repository's last push as 2024-08-07, which I did not re-verify. One individual maintainer. | 2026-11-12 |
| Markdown Preview Mermaid Support (bierner.markdown-mermaid) | 1.32.1, last updated 2026-05-20 (Marketplace) | Matt Bierner, repository mjbvz/vscode-markdown-mermaid | MIT, per a package.json snapshot of the repository | Free | Published 2017-08-10. Used only to preview Mermaid diagrams in Markdown. | 2026-11-12 |
| xdg-utils and unzip | xdg-utils 1.2.1-2 and unzip 6.0-29+deb13u1, Debian 13 (trixie) | Debian Project | Debian main archive, which holds only free software. Copyright files not read. | Free | unzip 6.0-29+deb13u1 is also listed in trixie-security. | 2026-11-12 |Support (bierner.markdown-mermaid) | 1.32.1, last updated 2026-05-20 (Marketplace) | Matt Bierner, repository mjbvz/vscode-markdown-mermaid | MIT, from the package.json I read earlier | Free | Published 2017-08-10. Used only to preview Mermaid diagrams in Markdown. | 2026-11-12 |

### Scores and Rings

Weighted = (25 x Stability + 25 x Pricing + 15 x Institutional fit + 35 x Exit cost) / 100, on a 1 to 5 scale where 5 is best. For exit cost, 5 means under 2 hours to swap, 4 means 2 to 6 hours, 3 means 6 to 16, 2 means 16 to 40, and 1 means more than 40.

| Dependency | Stability | Pricing | Institutional fit | Exit cost | Weighted | Ring | Reason in one line |
|------------|---|---|---|---|---|---|---|
| wrangler | 3 | 5 | 5 | 4 | 4.15 | Trial | The total is high, but an unpinned ^4 range with no lockfile and 13 releases in three weeks keeps it out of Adopt until I pin it. |
| Cloudflare Workers | 4 | 4 | 5 | 3 | 3.80 | Adopt | The course platform, free for the chapter's volume, with a ten-hour port as the exit. |
| Cloudflare D1 | 4 | 4 | 5 | 4 | 4.15 | Adopt | Free limits far exceed the chapter's use and `wrangler d1 export` gives a portable file. |
| HW4 Worker deployment | 2 | 4 | 2 | 5 | 3.55 | Hold | The page depends on a deployment outside this repository that nobody maintains after I leave, so the plan is removal. |
| GitHub | 4 | 4 | 5 | 5 | 4.50 | Adopt | Git means any host can replace it, and the course grades the repository there. |
| GitHub Codespaces | 3 | 3 | 5 | 5 | 4.00 | Trial | I ran out of included storage on 2026-10-26, and a local clone is the working fallback. |
| Dev container image javascript-node:22 | 3 | 5 | 4 | 5 | 4.35 | Trial | Node 22 is in Maintenance LTS and ends April 30, 2027, so the tag needs a planned move. |
| GitHub Copilot | 3 | 2 | 4 | 5 | 3.60 | Trial | GitHub's own plan pages describe the free chat allowance two different ways, but the project builds without it. |
| Live Server (ritwickdey.LiveServer) | 3 | 5 | 3 | 5 | 4.20 | Trial | One maintainer and an update eight months ago keep it out of Adopt, but it is dev-only and I can replace it in half an hour. || Markdown Mermaid (bierner.markdown-mermaid) | 4 | 5 | 3 | 5 | 4.45 | Adopt | A dev-only previewer with an MIT license, a known maintainer, and a half-hour exit. |
| xdg-utils and unzip | 5 | 5 | 3 | 5 | 4.70 | Adopt | Debian main packages with security updates, installed by the template. |

### Exit Plans (every critical dependency, every Trial)

### Exit Plans (every critical dependency, every Trial)

| Dependency | Trigger | Substitute | Hours to swap | Tested? (date and how) |
|------------|---|---|---|---|
| Cloudflare Workers | Cloudflare cuts the Free plan limits below the chapter's use, or ends the Free plan | A plain Node HTTP server with SQLite on a small host | 10 | Not tested. The D1 export covers the data half. |
| Cloudflare D1 | Free limits (5 GB, 5 million rows read and 100,000 rows written per day) fall below the chapter's use, or the Free plan changes | A SQLite file on the new host, loaded from the `wrangler d1 export` output | 4 | Yes. On 2026-11-12 at 20:22 UTC, `npm run db:export` wrote backup.sql (2,317 bytes, 9 INSERT rows, the status column inside the CREATE TABLE), and git ignores the file. The first attempt at 20:19 UTC failed with Authentication error 10000 because my login token had expired, and `npx wrangler login --device` fixed it. A new maintainer needs dashboard access or a working login before an export succeeds. |
| HW4 Worker deployment | Already triggered: it is Hold | The final repo's own Worker and its own D1 database, with one constant changed in app.js | 1.5 | Not tested. I deployed the final Worker at https://mgt3745-final.princemuteteke.workers.dev and the evals pass against it, but app.js still calls the HW4 Worker. |
| wrangler | A release breaks deploys, wrangler raises its Node floor above what the image provides, or its single publishing account is compromised | Deploy through the Cloudflare dashboard or API, or install the previous version recorded in package-lock.json | 3 | The pin is tested: after pinning to 4.160.1 on 2026-11-12, npm test passed 6 of 6 and the deploy and export commands ran on that version. The substitute is not tested. |
| GitHub Codespaces | The monthly free quota runs out, which happened on 2026-10-26 | A local VS Code clone | 1 | Not tested. I reached the storage limit on 2026-10-26 but did not complete the move to a local clone. |
| Dev container image javascript-node:22 | Node 22 reaches end of life on 2027-04-30, or wrangler raises its Node floor | The current LTS line (Node 26 per nodejs.org) by changing the image tag in .devcontainer/devcontainer.json, or Node installed locally if that tag does not exist | 1 | Not tested. |
| GitHub Copilot | My student eligibility ends or the free allowance stops covering my use | No assistant; the repository builds and tests without it | 0.5 | Not tested. |
| Live Server (ritwickdey.LiveServer) | The extension stops receiving updates or breaks on a VS Code release | `python3 -m http.server 5500` run from the repository root | 0.5 | Yes. On 2026-11-12, Python 3.13.5 served index.html from the Codespace on port 5500 and returned HTTP 200. |

### Changes Caused by This Audit

- **Pinned wrangler.** package.json changed from `^4` to the exact version 4.160.1, and package-lock.json is now committed (commit 6191eed). It is the version the audit measured, and the lockfile means a deployment installs the same 38 packages. After the pin, the six tests in evals/worker.test.js passed against the final Worker on 2026-11-12. There was no passing baseline before the pin, because the final repository had no Worker or database yet, and npm had already installed 4.160.1 through the `^4` range, so the pin changed no installed code. 4.161.0 was released on the morning of the audit, and moving to it will be a deliberate upgrade.
- **Fixed schema.sql.** The audit's own test run failed one of six tests with a 500 on the status update. The table had no `status` column: schema.sql never defined the column that worker/src/index.js writes, so a database built from the repository could not mark an update completed. Commit e29aa2c adds `status TEXT NOT NULL DEFAULT 'pending'`. The tests passed 6 of 6 afterward, and the export on 2026-11-12 shows the column.
- **Created the final repository's own database and Worker.** The configuration held a placeholder `database_id`, and the tests write rows, so I created the D1 database mgt3745-final-entries and deployed the Worker at https://mgt3745-final.princemuteteke.workers.dev (commits 1777b9f and 37d69ad). The tests write only to this database. backup.sql is ignored by git.
- **Tested one exit step.** The D1 export ran on 2026-11-12 (see the Exit Plans table), after a first attempt failed with an authentication error.
- **Corrected two sources during the audit.** I first rated Live Server from its GitHub README, which stops at 5.6.1 in 2019, and rated it Hold. Its Marketplace page shows 5.7.10 updated 2026-02-27, so I corrected the evidence and moved it to Trial (evidence commit 509b05e). I first took Node 22's maintenance start from a third-party page as October 2026, and the official schedule file shows 2025-10-21. The end-of-life date, 2027-04-30, did not change.
- **Did not change.** app.js still sends requests to the HW4 Worker. That row is Hold, and moving the page to the new Worker would hide the chapter's existing entries until they are migrated. I left it for after the audit.
- **ADR and DDR.** ADR-001 gained one line pointing to this audit. The audit did not change the decision. DDR-LOG.md has a line for Claude's help.

### Prediction Stake Resolution

The prediction held, narrowly. Ten of the 11 rows (90.9 percent) landed in Adopt or Trial, against a prediction of at least 90 percent. Only the HW4 Worker deployment landed in Hold. The margin is one row. When I first scored Live Server from its GitHub README it was Hold and the figure was 9 of 11 (81.8 percent), which would have failed. I corrected that after reading its Marketplace page, and no other score changed, so the pass depends on a source correction.

The prediction rested on the stack being mainstream, free, and replaceable, and the exit plans support that: the longest estimate is 10 hours for the Workers platform. It missed two things. wrangler is stable but moves fast, with 13 releases in three weeks and one publishing account, and my own page depended on a deployment outside the repository that I had not counted when I wrote the stake. The audit also found the missing `status` column that a rebuild from schema.sql would have shipped.