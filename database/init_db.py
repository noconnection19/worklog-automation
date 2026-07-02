"""Initialize the SQLite database from init.sql."""
import sqlite3
from pathlib import Path

DB_DIR = Path(__file__).parent
DB_PATH = DB_DIR / "worklog.db"

conn = sqlite3.connect(DB_PATH)
conn.executescript((DB_DIR / "init.sql").read_text())
conn.close()
print(f"Database ready: {DB_PATH}")

# ponytail: self-check
conn = sqlite3.connect(DB_PATH)
tables = conn.execute("SELECT name FROM sqlite_master WHERE type='table'").fetchall()
assert ("work_logs",) in tables, "work_logs table not created"
cols = [r[1] for r in conn.execute("PRAGMA table_info(work_logs)").fetchall()]
assert "activity" in cols and "ai_activity" in cols, f"Missing columns: {cols}"
conn.close()
print("Self-check passed.")
