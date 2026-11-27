-- Leading indicator (context/PROJECT.md, docs/DECISION-001.md):
-- updates posted in the first 7 days after the first real post.
-- created_at is stored by D1 as UTC text, YYYY-MM-DD HH:MM:SS, so the
-- window is computed in UTC. The first row marks the start of the window,
-- which only works if the production database is cleared of test rows
-- before the first real user posts. The window end is exclusive.
SELECT
  MIN(created_at) AS first_post,
  datetime(MIN(created_at), '+7 days') AS window_end,
  COUNT(*) AS updates_in_first_7_days
FROM entries
WHERE created_at < datetime((SELECT MIN(created_at) FROM entries), '+7 days');