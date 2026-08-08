# Car Inventory Data Cleaning & Pricing Analysis

An end-to-end portfolio project demonstrating accurate data entry, spreadsheet cleanup, quality assurance, Python automation, and SQL analysis for a fictional New York car dealership.

## Client problem

The source inventory contained inconsistent dates, currency symbols, mileage units, duplicate records, mixed capitalization, and combined location fields. These issues made the data unreliable for CRM import and reporting.

## Solution delivered

- Cleaned and standardized 25 source rows into 24 unique records
- Converted price and mileage fields into analysis-ready numbers
- Normalized vehicle names, conditions, fuel types, and transmissions
- Split location into borough and state
- Converted six date formats into ISO `YYYY-MM-DD`
- Added automated validation and duplicate checks
- Prepared SQL queries for reporting and business analysis

## Project files

| File | Purpose |
|---|---|
| `data/raw/car_inventory_raw.csv` | Original messy client-style data |
| `data/clean/car_inventory_clean.csv` | Final clean, import-ready output |
| `scripts/clean_inventory.py` | Reproducible cleaning and validation |
| `analysis/quality_report.md` | Before-and-after quality results |
| `analysis/portfolio_queries.sql` | Practical SQL analysis examples |
| `docs/data_dictionary.md` | Field definitions and cleaning rules |

## Quality results

| Check | Before | After |
|---|---:|---:|
| Duplicate records | 1 | 0 |
| Mixed date formats | 6 | 0 |
| Currency/mileage stored as text | 25 | 0 |
| Inconsistent category labels | 18 | 0 |
| Combined location fields | 25 | 0 |

## Run the cleaning process

```bash
python scripts/clean_inventory.py
```

Expected result:

```text
Cleaned 25 rows; exported 24 unique records.
```

## Services demonstrated

- Data entry and online research
- Excel and CSV cleanup
- PDF-to-Excel formatting
- Duplicate removal and quality control
- CRM/database import preparation
- Python data automation
- SQL reporting

## About me

I am Hayat Mahmud, an administrative and technical support professional based in New York. I focus on accurate, confidential, well-organized work and clear client communication. I am available for data entry, Excel cleanup, web research, administrative support, and database projects through Upwork.

> All records in this repository are fictional and were created solely for portfolio demonstration.
