# TOOLS.md

The ledger of Trust Boundary crossings. One row per external service this
repository depends on. Read by the agent on every task, so keep it short: a
service not in use does not belong here.

Never put a credential in this file. A key, token, or password anywhere in
the repository is graded as a security failure regardless of the rest.

Each crossing statement answers three questions in one first-person sentence:
what crosses, to whom, and who is accountable.

|| Tool | Purpose | Ring | Checked on | Limit or price | Exit | Trusted with | Credentials live | Crossing statement | Switching cost |
|---|---|---|---|---|---|---|---|---|---|
| Cloudflare Workers | Runs the API | Adopt | 2026-11-11 | Free: 100,000 requests per day, 10 ms CPU per invocation | A Node HTTP server with SQLite, about 10 hours | Every chapter update a chair submits; request metadata (IP, timestamp) Cloudflare logs by default | Cloudflare dashboard login; wrangler device-auth token inside the Codespace | Chapter updates a chair types leave the browser and are handled by Workers under Cloudflare's free-tier terms. I am accountable for what happens to that data. | Medium: rewrite the Worker for another host |
| Cloudflare D1 | Stores chapter updates | Adopt | 2026-11-11 | Free: 5 GB, 5 million rows read and 100,000 rows written per day | SQLite loaded from `wrangler d1 export`, about 4 hours; export tested 2026-11-12 | The same chapter updates, stored in the database | Cloudflare dashboard login; wrangler device-auth token | Chapter updates a chair types are stored on D1 under Cloudflare's free-tier terms, in a region I did not choose. I am accountable for what happens to that data. | Medium: `wrangler d1 export` |
| HW4 Worker deployment | The API the page currently calls | Hold | 2026-11-12 | Same Free plan limits as any Worker on my account | Repoint app.js to the final Worker, about 1.5 hours | Every update submitted through the page | Cloudflare dashboard login; wrangler device-auth token | The page sends every update a chair types to the HW4 Worker, which stores it in the HW4 D1 database on my Cloudflare account, and I am accountable for what that deployment holds. | Low: change one constant in app.js after migrating entries |
| wrangler | Deploys the Worker and runs database commands | Trial | 2026-11-12 | Free CLI; 4.160.1 pinned | Dashboard or API deploy, about 3 hours; pin tested 2026-11-12 | Nothing of mine directly; it holds my Cloudflare auth token locally and runs deploy and database commands for me | Device-auth token stored locally by wrangler after login | wrangler is a third-party npm package with one publishing account, and every deploy and database command runs through code I did not write and have not audited. I am accountable for trusting it. | Low: a CLI, no data lock-in beyond the Cloudflare account |
| GitHub | Hosts the code and its history | Adopt | 2026-11-11 | Free personal account: unlimited public and private repositories | git clone to any host, about 1 hour | Source code and commit history | GitHub account login; SSO | All code and history are on GitHub. Template repos mean no product dependency beyond git itself. I am accountable for what I push. | Low: git clone anywhere |
| GitHub Codespaces | Runs the cloud development container | Trial | 2026-11-11 | Free: 15 GB-month storage, 120 core hours, reached 2026-10-26 | Local VS Code clone, about 1 hour; not tested | The devcontainer configuration and the workspace files | GitHub account login | My workspace files cross to GitHub's cloud machines so the project can run in a browser. I am accountable for keeping secrets out of the repository. | Low: use a local clone |
| Dev container image javascript-node:22 | The base image of the Codespace | Trial | 2026-11-12 | Free; Node 22 ends 2027-04-30 | Newer LTS tag or a local Node, about 1 hour; not tested | The workspace files and the commands that run in the container | None; a wrangler login token is stored inside the container | The Codespace runs on an image Microsoft publishes, so everything that runs in it, including wrangler, runs on a base I did not build. I am accountable for the tag I chose. | Low: change one line in devcontainer.json |
| GitHub Copilot | In-editor assistant | Trial | 2026-11-11 | Free: 2,000 completions per month; Student: unlimited completions and an allowance of AI credits | Work without it, about 0.5 hours; not tested | Repo contents, including worker/src/index.js and every context file, as context for suggestions | GitHub account | Everything in this repository may be sent to Copilot as context on every task. No secrets belong in the repo, ever, because of this. I am accountable for what it returns and I accept. | Low: turn it off |
| Live Server (ritwickdey.LiveServer) | Local static server for the page | Trial | 2026-11-12 | Free; 5.7.10, updated 2026-02-27 | `python3 -m http.server 5500`, about 0.5 hours; tested 2026-11-12 | Local files served from the workspace | None | A VS Code extension from one individual maintainer can read and serve my workspace files, and I am accountable for installing it. | Low: remove the extension |
| Markdown Preview Mermaid Support (bierner.markdown-mermaid) | Previews Mermaid diagrams in Markdown | Adopt | 2026-11-12 | Free; 1.32.1, updated 2026-05-20 | Remove it; diagrams still render on GitHub, about 0.5 hours | Markdown files previewed in the editor | None | A VS Code extension reads the Markdown I preview, and I am accountable for installing it. | Low: remove the extension |
| xdg-utils and unzip | Helper packages the template installs | Adopt | 2026-11-12 | Free; Debian 13 main archive | Remove the postCreateCommand line, about 0.5 hours | Nothing; they run inside the container | None | Two Debian packages are installed by the template's postCreateCommand with apt, and I am accountable for running that command. | Low: remove the command |

## Revisit triggers

- A new service is added to the repository.
- A vendor changes pricing, terms, or region.
- A credential moves.
