"""Load the supermarket sales CSV into a SQLite database (sales.db, table `sales`)."""
import csv, sqlite3, pathlib
db = sqlite3.connect("sales.db"); cur = db.cursor()
cur.execute("DROP TABLE IF EXISTS sales")
cur.execute("""CREATE TABLE sales (invoice_id TEXT, branch TEXT, city TEXT, customer_type TEXT,
gender TEXT, product_line TEXT, unit_price REAL, quantity INTEGER, tax REAL, total REAL,
date TEXT, time TEXT, payment TEXT, cogs REAL, gross_margin_pct REAL, gross_income REAL, rating REAL)""")
with open("data/supermarket_sales.csv", newline="", encoding="utf-8-sig") as f:
    rows = list(csv.reader(f))
from datetime import datetime
def norm(r):
    r[10] = datetime.strptime(r[10], "%m/%d/%Y").strftime("%Y-%m-%d")
    return r
cur.executemany("INSERT INTO sales VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", [norm(r) for r in rows[1:]])
db.commit(); print("loaded", cur.execute("SELECT COUNT(*) FROM sales").fetchone()[0], "rows")
