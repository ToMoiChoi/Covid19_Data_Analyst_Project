--Show the percentage of population Covid
SELECT 
    location, 
    date,
    total_cases,
    population,
    ROUND((total_cases/population)*100 ,2) as percentage_case
FROM covid19_death
WHERE location like '%States%'
ORDER BY 1,2