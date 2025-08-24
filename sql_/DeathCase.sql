--Shows likelihood of dying if we contract covid in your country
-- (Example United States)
SELECT 
    location, 
    date,
    total_cases,
    COALESCE(total_deaths,0) as total_deaths,
    ROUND((COALESCE(total_deaths,0)/total_cases)*100 ,2) as percentage_case_have_death,
    population
FROM covid19_death
WHERE location like '%States%'
ORDER BY 1,2
 

 
