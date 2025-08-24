-- Total Population vs Vaccinations
-- Shows Percentage of Population that has received at least one Covid Vaccine

WITH VaccinationData AS (
    SELECT 
        dea.continent, 
        dea.location, 
        dea.date, 
        dea.population, 
        vac.new_vaccinations, 
        SUM(vac.new_vaccinations::NUMERIC) OVER (
            PARTITION BY dea.location 
            ORDER BY dea.date
        ) as RollingPeopleVaccinated
    FROM covid19_death dea
    JOIN covid19_vaccination vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL 
)
SELECT 
    continent, 
    location, 
    date, 
    population, 
    new_vaccinations, 
    RollingPeopleVaccinated,
    CASE 
        WHEN population > 0 THEN ROUND((RollingPeopleVaccinated / population) * 100, 2)
        ELSE 0 
    END as VaccinationPercentage
FROM VaccinationData
Where new_vaccinations is not null
order by 2,3 


-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists #PercentPopulationVaccinated
Create Table PercentPopulationVaccinated
(
continent VARCHAR(255),
location VARCHAR(255),
Date DATE,
Population numeric,
New_vaccinations numeric,
RollingPeopleVaccinated numeric
)
-- Update only rows where percentage is currently NULL or incorrect
ALTER TABLE PercentPopulationVaccinated
ADD COLUMN vaccination_percentage NUMERIC;
INSERT INTO PercentPopulationVaccinated
WITH VaccinationData AS (
    SELECT 
        dea.continent, 
        dea.location, 
        dea.date, 
        dea.population, 
        vac.new_vaccinations::NUMERIC as new_vaccinations,
        SUM(vac.new_vaccinations::NUMERIC) OVER (
            PARTITION BY dea.Location 
            ORDER BY dea.Date
        ) as rollingPeopleVaccinated
    FROM covid19_death dea
    JOIN covid19_vaccination vac
        ON dea.location = vac.location
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL 
)
SELECT 
    continent, 
    location, 
    date, 
    population, 
    new_vaccinations,
    RollingPeopleVaccinated,
    CASE 
        WHEN population > 0 THEN ROUND((RollingPeopleVaccinated / population) * 100, 2)
        ELSE 0 
    END as vaccination_percentage
FROM VaccinationData;

Create View ViewPercentPopulationVaccinated as
Select 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations, 
    SUM(vac.new_vaccinations::NUMERIC) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From covid19_death dea
Join covid19_vaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 