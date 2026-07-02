CREATE TABLE IF NOT EXISTS work_logs (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    work_date   DATE    NOT NULL,
    check_in    TEXT    DEFAULT '08:00',
    check_out   TEXT    DEFAULT '17:30',
    break_time  TEXT    DEFAULT '1 Hour',
    place       TEXT    DEFAULT 'TMMIN Sunter 1',
    activity    TEXT    NOT NULL,
    ai_activity TEXT,
    created_at  DATETIME DEFAULT (datetime('now','localtime'))
);
