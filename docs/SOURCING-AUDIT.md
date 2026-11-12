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
| wrangler | 4.160.1, package metadata modified 2026-11-11 14:45 UTC (npm view) | Cloudflare, one publishing account listed: wrangler-publisher, workers-devprod@cloudflare.com | MIT OR Apache-2.0 | Free CLI | npm audit reports 0 vulnerabilities and npm view shows no deprecation notice. package.json says ^4, so any 4.x release installs. 38 packages installed, 1 direct and 37 transitive. | 2026-11-11 |
| Cloudflare Workers (Free plan) | Hosted service, not versioned | Cloudflare | Cloudflare terms of service | 100,000 requests per day and 10 ms of CPU time per invocation on Free, plus a burst limit of 1,000 requests per minute. The paid plan is a $5.00 monthly subscription. | Source: developers.cloudflare.com/workers/platform/pricing and /workers/platform/limits | 2026-11-11 |
| Cloudflare D1 (Free plan) | Hosted service, not versioned | Cloudflare | Cloudflare terms of service | 5 GB total storage, 5 million rows read per day, and 100,000 rows written per day. 500 MB per database on Free. | Cloudflare says the Free plan will always include D1 for prototyping, and at the daily read or write limit queries stop working. Time Travel restores a database to any minute in the last 7 days on Free, from a 2023 changelog entry I did not re-verify. Sources: cloudflare.com/plans and developers.cloudflare.com/d1/platform/pricing | 2026-11-11 |
| GitHub (Free personal account) | Hosted service, not versioned | GitHub, owned by Microsoft | GitHub terms of service | Unlimited public and private repositories with unlimited collaborators. | Source: docs.github.com/en/get-started/learning-about-github/githubs-plans | 2026-11-11 |
| GitHub Codespaces | Hosted service, not versioned | GitHub | GitHub terms of service | Free personal accounts get 15 GB-month of storage and 120 hours of compute. | With no payment method set, use is blocked once either quota runs out, until the next monthly cycle. I hit the storage limit on 2026-10-26 and moved to a local VS Code clone. Source: docs.github.com/en/billing/concepts/product-billing/github-codespaces | 2026-11-11 |
| GitHub Copilot | Hosted service, not versioned | GitHub, owned by Microsoft | GitHub terms and Copilot terms | Copilot Free allows 2,000 completions a month. Verified students get Copilot Student, which has unlimited completions and an allowance of AI credits at no cost. | GitHub's own plan pages describe the free chat allowance two ways: up to 50 premium requests per month on one and an allowance of AI credits on another, so the pricing model is mid-change. A secondary site says GitHub reevaluates student eligibility every month. Source: docs.github.com/en/copilot/concepts/billing/individual-plans | 2026-11-11 |
| Node.js 22 (the devcontainer image tag :22) | 22 line, latest patch not read | OpenJS Foundation, Node.js release team | MIT | Free | Node 22 moved from Active LTS to Maintenance LTS in October 2026 and reaches end of life on April 30, 2027. Node 24 is supported through April 2028. These two come from third-party pages summarizing the official schedule, so read nodejs.org/en/about/previous-releases before relying on them. | 2026-11-11 |
| Live Server (ritwickdey.LiveServer) | 5.6.1, 17 April 2019, per the changelog in its README | Ritwick Dey, individual maintainer | MIT | Free | The README changelog's latest entry is 5.6.1 dated 17 April 2019, and a mirror lists the repository's last push as 2024-08-07. I have not read its Marketplace page. | 2026-11-11 |
| Markdown Preview Mermaid Support (bierner.markdown-mermaid) | 1.23.0 per a package.json snapshot of unknown date. Marketplace page not read. | Matt Bierner, repository mjbvz/vscode-markdown-mermaid | MIT | Free | Used only to preview Mermaid diagrams in Markdown. | 2026-11-11 |

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
| Live Server (ritwickdey.LiveServer) | 2 | 5 | 3 | 5 | 3.95 | Hold | Its README's latest changelog entry is from April 2019; the total is high because it is free and easy to remove, but stability decides it. |
| Markdown Mermaid (bierner.markdown-mermaid) | 4 | 5 | 3 | 5 | 4.45 | Adopt | A dev-only previewer with an MIT license, a known maintainer, and a half-hour exit. |
| xdg-utils and unzip | 5 | 5 | 3 | 5 | 4.70 | Adopt | Debian main packages with security updates, installed by the template. |

### Exit Plans (every critical dependency, every Trial)

| Dependency | Trigger | Substitute | Hours to swap | Tested? (date and how) |
|------------|---|---|---|---|
| Cloudflare Workers | Cloudflare cuts the Free plan limits below the chapter's use, or ends the Free plan | A plain Node HTTP server with SQLite on a small host | 10 | Not tested. The D1 export covers the data half. |
| Cloudflare D1 | Free limits (5 GB, 5 million rows read and 100,000 rows written per day) fall below the chapter's use, or the Free plan changes | A SQLite file on the new host, loaded from the `wrangler d1 export` output | 4 | Not yet tested. The export runs once the database exists. |
| HW4 Worker deployment | Already triggered: it is Hold | The final repo's own Worker and its own D1 database, with one constant changed in app.js | 1.5 | Not yet tested. It runs after the page points at the final Worker. |
| wrangler | A release breaks deploys, wrangler raises its Node floor above what the image provides, or its publishing account is compromised | Deploy through the Cloudflare dashboard or API, or roll back to the previous pinned version | 3 | Not tested as an exit. The pin is tested by running npm test before and after. |
| GitHub Codespaces | The monthly free quota runs out, which happened on 2026-10-26 | A local VS Code clone | 1 | Yes. On 2026-10-26, on the team repository, I ran out of included storage and continued from a local clone, pushing from it. |
| Dev container image javascript-node:22 | Node 22 reaches end of life on April 30, 2027, or wrangler raises its Node floor | The javascript-node:24 image, or Node installed locally | 1 | Not tested. |
| GitHub Copilot | My student eligibility ends or the free allowance stops covering my use | No assistant; the repository builds and tests without it | 0.5 | Not tested. |