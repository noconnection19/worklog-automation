# WorkLog Automation

## Tujuan

Mengotomasi pembuatan working report bulanan menggunakan Telegram +
n8n + Database + Python + AI.

## Arsitektur

``` text
Telegram Bot
      |
      v
     n8n
  |    |    |
 DB   AI  Scheduler
      |
      v
 Python (openpyxl)
      |
      v
 Excel Template
      |
      v
 Email
```

## Roadmap

### Sprint 1

-   Install n8n (Docker)
-   Buat Telegram Bot
-   Simpan aktivitas ke SQLite

### Sprint 2

-   AI merapikan deskripsi aktivitas
-   Command `/today`, `/week`, `/month`

### Sprint 3

-   Generate Excel dari template perusahaan
-   Pertahankan seluruh formula

### Sprint 4

-   Email otomatis awal bulan

### Sprint 5

-   Dashboard
-   Integrasi Git
-   Integrasi Outlook
-   Statistik produktivitas

## Struktur Project

``` text
worklog-automation/
├── n8n/
│   └── workflow.json
├── python/
│   ├── generate_excel.py
│   └── template.xlsx
├── database/
│   └── worklog.db
├── docs/
│   ├── PRD.md
│   ├── DATABASE.md
│   ├── N8N_WORKFLOW.md
│   ├── TELEGRAM.md
│   ├── EXCEL_GENERATOR.md
│   └── ROADMAP.md
└── README.md
```

## Database

### work_logs

  Kolom         Tipe
  ------------- ----------
  id            integer
  work_date     date
  check_in      text
  check_out     text
  break_time    text
  place         text
  activity      text
  ai_activity   text
  created_at    datetime

## Input Telegram

Normal:

``` text
fix login api
```

Override:

``` text
out 20:30
place WFH
Deploy Production
```

## Workflow n8n

1.  Telegram Trigger
2.  Parse Message
3.  Default Value
4.  AI Improve (opsional)
5.  Insert Database

Workflow bulanan:

1.  Cron (tgl 1)
2.  Query bulan sebelumnya
3.  Jalankan Python
4.  Generate Excel
5.  Email

## Excel Generator

-   Copy template
-   Isi header
-   Isi aktivitas
-   Biarkan formula tetap berjalan
-   Simpan hasil

## Fitur Masa Depan

-   WhatsApp
-   Voice note
-   OCR screenshot
-   Git commit summary
-   Outlook Calendar
-   Dashboard
-   KPI
-   PDF Export
