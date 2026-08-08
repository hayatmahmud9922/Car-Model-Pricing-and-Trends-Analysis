"""Clean and validate the fictional car inventory portfolio dataset."""
import csv
import re
from datetime import datetime
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
INPUT = ROOT / "data" / "raw" / "car_inventory_raw.csv"
OUTPUT = ROOT / "data" / "clean" / "car_inventory_clean.csv"
MODEL_MAP = {"camry": "Camry", "CIVIC": "Civic", "RAV 4": "RAV4", "c 300": "C 300", "ROGUE": "Rogue"}
CONDITION_MAP = {"used": "Used", "USED": "Used", "Pre Owned": "Used", "pre-owned": "Used"}
FUEL_MAP = {"gas": "Gasoline", "Gas": "Gasoline", "gasoline": "Gasoline", "electric": "Electric"}
TRANSMISSION_MAP = {"auto": "Automatic", "Auto": "Automatic", "automatic": "Automatic"}

def digits(value):
    return int(re.sub(r"[^0-9]", "", value))

def parse_date(value):
    for fmt in ("%m/%d/%Y", "%Y-%m-%d", "%m-%d-%Y", "%Y/%m/%d", "%b %d %Y", "%m/%d/%y"):
        try:
            return datetime.strptime(value, fmt).date().isoformat()
        except ValueError:
            pass
    raise ValueError(f"Unsupported date: {value}")

def clean_location(value):
    text = re.sub(r"\s*,\s*", ",", value.strip())
    if "," not in text:
        text = re.sub(r"\s+NY$", ",NY", text)
    borough, state = text.rsplit(",", 1)
    return borough.strip(), state.strip().upper()

def clean_row(row):
    borough, state = clean_location(row["location"])
    return {
        "record_id": row["record_id"].zfill(3),
        "make": row["make"].title() if row["make"].lower() != "bmw" else "BMW",
        "model": MODEL_MAP.get(row["model"], row["model"].title()),
        "year": int(row["year"]),
        "price_usd": digits(row["price"]),
        "mileage": digits(row["mileage"]),
        "condition": CONDITION_MAP.get(row["condition"], row["condition"].title()),
        "fuel_type": FUEL_MAP.get(row["fuel_type"], row["fuel_type"].title()),
        "transmission": TRANSMISSION_MAP.get(row["transmission"], row["transmission"].title()),
        "borough": borough, "state": state, "date_listed": parse_date(row["date_listed"]),
    }

def main():
    with INPUT.open(newline="", encoding="utf-8") as source:
        rows = [clean_row(row) for row in csv.DictReader(source)]
    seen, clean_rows = set(), []
    for row in rows:
        key = (row["make"], row["model"], row["year"], row["price_usd"], row["mileage"])
        if key not in seen:
            seen.add(key)
            clean_rows.append(row)
    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    with OUTPUT.open("w", newline="", encoding="utf-8") as target:
        writer = csv.DictWriter(target, fieldnames=clean_rows[0].keys())
        writer.writeheader()
        writer.writerows(clean_rows)
    assert len(rows) == 25 and len(clean_rows) == 24
    assert all(1900 <= row["year"] <= 2026 for row in clean_rows)
    assert all(row["price_usd"] > 0 and row["mileage"] >= 0 for row in clean_rows)
    print(f"Cleaned {len(rows)} rows; exported {len(clean_rows)} unique records.")

if __name__ == "__main__":
    main()
