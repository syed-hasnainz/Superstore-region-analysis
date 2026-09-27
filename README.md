# Why Is the Central Region Underperforming?

A data analysis project using the Sample Superstore dataset (US retail orders) to investigate why one region consistently generates less profit than the others — and what's actually driving it.

## The Question

Central is the lowest-profit region in this dataset. Is it because Central sells less, or because something is eating into its margins? This project digs into that with SQL and visualizes the answer in Power BI.

## The Finding

**Central underperforms not because of weaker sales, but because of heavier discounting.** Central's average discount (~25%) is roughly double the other regions', and its average profit margin is the lowest of the four — at times dipping negative. The specific products driving this are **Tables** (-$17.7K total profit company-wide), **Bookcases**, and **Furnishings**, all of which get discounted past the point of profitability.

At a discount of 21% or higher, every region's margin turns negative — but Central sells the highest share of its volume in that danger zone, which is what separates it from West, East, and South.

## Data

- **Source:** [Sample Superstore](https://www.kaggle.com/datasets) — ~10,000 rows of US retail order-level data (Kaggle)
- **Raw file:** `data/superstore_raw.csv`
- **Cleaned file:** `data/superstore_clean.csv`

### Cleaning steps
- Checked for missing values across all 13 columns — none found.
- Removed **17 exact duplicate rows** (same values across every column, likely double-logged orders).
- Added two calculated columns:
  - `Profit Margin` = Profit / Sales
  - `Sales Per Unit` = Sales / Quantity

## SQL Analysis

Queries were run against the cleaned data in SQLite (`superstore.db`). Full query files are in `/sql`.

| Query | What it answers |
|---|---|
| `top subcategories by profit.sql` | Which products make the most money (Copiers, Phones, Accessories lead) |
| `bottom subcategories by profit.sql` | Which products lose money (Tables, Bookcases, Supplies) |
| `profit margin by region.sql` | Confirms Central has the lowest margin (7.9%) vs. West's 14.9% |
| `profit margin by segment.sql` | Margin breakdown by customer segment |
| `discount vs profit by region.sql` | The key query — shows margin collapsing as discount increases, worse in Central |

## Dashboard

Built in Power BI Desktop. See `powerbi/dashboard.png`.

Three visuals:
1. **Profit by Region** — bar chart ranking all four regions
2. **Discount vs. Profit Margin** — scatter plot showing Central's high-discount, low-margin position relative to the other three regions
3. **Profit by Sub-Category** — bar chart identifying Tables, Bookcases, and Furnishings as the specific loss drivers

## Tools Used

Excel (data cleaning) · SQLite / SQL (analysis) · Power BI Desktop (dashboard) · GitHub (documentation)

## Repo Structure

```
├── data/
│   ├── superstore_raw.csv
│   └── superstore_clean.csv
├── sql/
│   ├── 01_top_subcategories_by_profit.sql
│   ├── 02_bottom_subcategories_by_profit.sql
│   ├── 03_profit_margin_by_region.sql
│   ├── 04_profit_margin_by_segment.sql
│   └── 05_discount_vs_profit_by_region.sql
├── powerbi/
│   └── dashboard.png
└── README.md
```
