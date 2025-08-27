--Shows likelihood of dying if we contract covid in your country
-- (Example United States)
SELECT 
    sum(new_cases) as total_cases,
    sum(new_deaths::NUMERIC) as total_deaths,
    Round((sum(new_deaths::NUMERIC)+sum(new_cases))/2,2) as DeathPercentage
FROM covid19_death
-- WHERE location like '%States%'
WHERE continent is not NULL
ORDER BY 1,2
 

 
