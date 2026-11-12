# Sourcing Audit

## Audit 1, November 2026

### Prediction Stake (commit before any evidence)

I predict that at least 90 percent of the rows in my inventory will land in the Adopt or Trial rings. The stack is mainstream, free, and replaceable with a git clone or a CLI swap, which is what the Switching cost column in TOOLS.md already says. Resolution: Tight, a percentage of rows. The prediction fails if more than 10 percent of the rows land in Assess or Hold.

### Inventory

| Dependency | Kind (package, dev package, platform, model, builder, CDN script) | Where it is recorded | Ships to users? |
|------------|------|------|------|
| wrangler | dev package | package.json devDependencies (`^4`, range, no lockfile yet) | No |
| Cloudflare Workers | platform | worker/wrangler.toml, worker/src/index.js | Yes, it serves the API |
| Cloudflare D1 | platform | worker/wrangler.toml binding `DB`, schema.sql | Yes, it stores chapter updates |
| HW4 Worker deployment (mgt3745-hw4.princemuteteke.workers.dev) | platform, my own earlier deployment | app.js line 4 | Yes, the page calls it |
| GitHub | platform | the repository, .github/ | No |
| GitHub Codespaces | platform | .devcontainer/devcontainer.json | No |
| Dev container image mcr.microsoft.com/devcontainers/javascript-node:22 | container image | .devcontainer/devcontainer.json | No |
| GitHub Copilot | AI assistant | .devcontainer/devcontainer.json extensions, .github/copilot-instructions.md, .github/instructions/, .github/prompts/ | No |
| Live Server (ritwickdey.LiveServer) | dev extension | .devcontainer/devcontainer.json | No |
| Markdown Mermaid (bierner.markdown-mermaid) | dev extension | .devcontainer/devcontainer.json | No |
| xdg-utils and unzip | apt packages | .devcontainer/devcontainer.json postCreateCommand | No |

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

### Weights (commit in their own commit, before scoring)

| Criterion | Weight | Why this weight for this project |
|-----------|--------|----------------------------------|
| Stability | 25 | Chair submissions are time-sensitive, so a dependency that breaks or changes behavior between releases costs the chapter trust it cannot easily rebuild. |
| Pricing predictability | 25 | Everything runs on a free tier, and a free tier that shrinks or ends stops the tool outright. This semester's GitHub Models withdrawal shows that it happens. |
| Institutional fit | 15 | The course and its graders run on Cloudflare and GitHub through December 14, so fit matters now. The weight is lower because the tool outlives the course. |
| Exit cost | 35 | The chapter keeps using the tool after I leave, and whoever maintains it will not have my hours, so how quickly a service can be replaced decides whether the tool survives. |

Total: 100