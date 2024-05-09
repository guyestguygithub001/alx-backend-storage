-- This query retrieves all bands identified with Glam rock as their primary genre and ranks them by their 'lifespan'. The 'lifespan' is calculated as the difference between the year they split and the year they were formed, using '2020' as the default split year if the actual split year is not available.
SELECT band_name, (IFNULL(split, '2020') - formed) AS lifespan
    FROM metal_bands
    WHERE FIND_IN_SET('Glam rock', IFNULL(style, "")) > 0
    ORDER BY lifespan DESC;
