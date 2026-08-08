# Data Dictionary

All records are fictional and were created for portfolio demonstration.

| Field | Type | Description | Cleaning rule |
|---|---|---|---|
| record_id | Text | Unique inventory identifier | Preserved as three digits |
| make | Text | Vehicle manufacturer | Standardized capitalization |
| model | Text | Vehicle model | Standardized spelling and capitalization |
| year | Integer | Model year | Validated between 1900 and 2026 |
| price_usd | Integer | Listing price in US dollars | Removed symbols and separators |
| mileage | Integer | Odometer mileage | Removed units and separators |
| condition | Text | Used or Certified | Consolidated inconsistent categories |
| fuel_type | Text | Gasoline, Hybrid, or Electric | Standardized labels |
| transmission | Text | Automatic or CVT | Expanded abbreviations |
| borough | Text | New York City borough | Split from location |
| state | Text | Two-letter state code | Uppercased |
| date_listed | Date | Listing date | Converted to ISO YYYY-MM-DD |
