# Metric queries

Put each decision metric here as a query or script anyone can rerun, named for the metric (for example paid-within-30.sql).
Link it from docs/DECISION-001.md and context/EVALS.md.

## updates-first-7-days.sql

The leading indicator from context/PROJECT.md and docs/DECISION-001.md: updates posted in the first 7 days after the first real post. Threshold: at least 3. It only reads. Run it against production, never against a database with test rows:

npx wrangler d1 execute mgt3745-final-entries --remote --file=evals/queries/updates-first-7-days.sql --config worker/wrangler.toml

Before the first real user posts, delete every test row from production so the first row is the first real post. Run the same file locally, against sample rows, to check the query itself.