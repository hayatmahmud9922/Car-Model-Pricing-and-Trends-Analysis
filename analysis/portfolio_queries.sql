-- Portfolio examples for the cleaned car inventory dataset.
SELECT COUNT(*) AS total_vehicles, ROUND(AVG(price_usd), 2) AS average_price,
       ROUND(AVG(mileage), 0) AS average_mileage
FROM car_inventory_clean;

SELECT make, COUNT(*) AS listings, ROUND(AVG(price_usd), 2) AS average_price,
       MIN(price_usd) AS lowest_price, MAX(price_usd) AS highest_price
FROM car_inventory_clean GROUP BY make ORDER BY average_price DESC;

SELECT borough, COUNT(*) AS listings, ROUND(AVG(price_usd), 2) AS average_price
FROM car_inventory_clean GROUP BY borough ORDER BY listings DESC, borough;

SELECT make, model, year, price_usd, mileage, borough
FROM car_inventory_clean WHERE price_usd < 30000 AND mileage < 40000
ORDER BY price_usd;

SELECT make, model, year, price_usd, mileage, COUNT(*) AS duplicate_count
FROM car_inventory_clean GROUP BY make, model, year, price_usd, mileage
HAVING COUNT(*) > 1;
