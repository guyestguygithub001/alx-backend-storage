-- This query aggregates the total number of fans for each country of origin within the 'metal_bands' table, and displays the results in descending order of fan count.
SELECT origin, SUM(fans) AS nb_fans
    FROM metal_bands
    GROUP BY origin
    ORDER BY nb_fans DESC;
