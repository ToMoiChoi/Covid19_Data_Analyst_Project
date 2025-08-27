SELECT 
    continent,
    sum(new_deaths) as total_deaths
FROM covid19_death
WHERE continent is not null
GROUP BY continent 
ORDER BY total_deaths DESC