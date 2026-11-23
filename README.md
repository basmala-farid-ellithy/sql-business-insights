# SQL Business Insights (SQLite)

A set of business questions answered in SQL against a public supermarket sales dataset
(1,000 transactions, 3 branches, Q1 2019). Demonstrates the reporting queries behind
typical MIS packs: revenue trends, product performance, customer segments, branch
comparison, and payment mix.

## Structure
- `load_data.py` - loads the CSV into `sales.db` (SQLite), normalizing dates to ISO format
- `queries/` - one `.sql` file per business question
- `results/` - the query output, committed so findings are readable without running anything

## Questions and findings
1. **Monthly revenue trend** - January strongest (116.3k), February dip (97.2k), March rebound (109.5k).
2. **Product line ranking** - Food and beverages leads revenue (56.1k); Home and lifestyle has the
   largest average basket (320.6); margins are uniform (~5%), so growth must come from volume and mix.
3. **Customer segments** - Members and walk-ins are nearly equal in count and revenue, but members
   spend ~3% more per visit; ratings are similar, so membership perks are not visibly lifting satisfaction.
4. **Branch performance** - Revenue is evenly spread across the three cities; peak revenue hour differs
   by branch (7pm in Naypyitaw and Mandalay, 11am in Yangon), which matters for staffing.
5. **Payment mix** - Members lean credit card (35.2% of member revenue); walk-ins lean e-wallet and cash.

## Run it
```
python3 load_data.py
sqlite3 -header -column sales.db < queries/01_monthly_revenue.sql
```

## Data
Public "Supermarket Sales" dataset (plotly/datasets mirror of the well-known Kaggle dataset),
stored in `data/` for reproducibility.

## Stack
SQL (SQLite), Python for the loader.
