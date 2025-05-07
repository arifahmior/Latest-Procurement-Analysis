SELECT * FROM sakila.`procurement kpi analysis dataset`;
DESCRIBE sakila.`procurement kpi analysis dataset`;
ALTER TABLE sakila.`procurement kpi analysis dataset`
ADD COLUMN Total_Negotiated_Price DECIMAL(10, 2);
SELECT Quantity, Negotiated_Price, (CAST(Quantity AS DECIMAL(10,2)) * CAST(Negotiated_Price AS DECIMAL(10,2))) AS Total_Negotiated_Price
FROM sakila.`procurement kpi analysis dataset`
LIMIT 10;
SET SQL_SAFE_UPDATES = 0;
UPDATE sakila.`procurement kpi analysis dataset`
SET Total_Negotiated_Price = CAST(Quantity AS DECIMAL(10,2)) * CAST(Negotiated_Price AS DECIMAL(10,2))
WHERE Quantity IS NOT NULL AND Negotiated_Price IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;
ALTER TABLE sakila.`procurement kpi analysis dataset`
ADD COLUMN Saving_Cost DECIMAL(10, 2);
SELECT Total_Price, Total_Negotiated_Price, (CAST(Total_Price AS DECIMAL(10,2)) - CAST(Total_Negotiated_Price AS DECIMAL(10,2))) AS Saving_Cost
FROM sakila.`procurement kpi analysis dataset`
LIMIT 10;
SET SQL_SAFE_UPDATES = 0;
UPDATE sakila.`procurement kpi analysis dataset`
SET Saving_Cost = CAST(Total_Price AS DECIMAL(10,2)) - CAST(Total_Negotiated_Price AS DECIMAL(10,2))
WHERE Total_Price IS NOT NULL AND Total_Negotiated_Price IS NOT NULL;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM sakila.`procurement kpi analysis dataset`;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM sakila.`procurement kpi analysis dataset`
WHERE Defective_Units IS NULL OR Defective_Units = 0
   OR Delivery_Date IS NULL OR Delivery_Date = 0
   OR Unit_Price IS NULL OR Unit_Price = 0
   OR Total_Price IS NULL OR Total_Price = 0;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM sakila.`procurement kpi analysis dataset`;


