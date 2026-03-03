--SELECT * from airports

SELECT DISTINCT [type] from airports

SELECT
    a.name
    ,a.latitude_deg
    ,a.longitude_deg
    ,a.iata_code
    ,a.elevation_ft
    ,ROUND(a.elevation_ft / 3.28,1) AS elevation_m --calculated column
    ,a.iso_country
FROM
    airports a
    --given airports table an alias of 'a' makes easy to refer to in subsequent lines.
WHERE a.[type]='large_airport' --using a. will open up a list of fields in the table.
    AND a.[continent]='EU' -- use and to add another criteria for selection
    AND a.[iso_country] IN ('GB','FR')
    -- use in ('criteria 1','criteria 2') to select more than one criteria from a line
    --AND a.latitude_deg between 51 and 54 --use BETWEEN for numbers
ORDER BY a.name -- defaults to ascending (ASC), use DESC for descending

-- which 5 regions have the most airports? 
--use group by to group data by region, then count the number of airports in each region, and order by the count top 5 results only.
SELECT top 5
a.iso_region
    ,COUNT(*) as total_airports
FROM
    airports a
GROUP BY a.iso_region
ORDER BY total_airports DESC
