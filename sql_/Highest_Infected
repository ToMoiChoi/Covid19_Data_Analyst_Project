-- Countries with Highest Infection Rate compared to Population
Select 
    Location, 
    Population, 
        MAX(total_cases) as HighestInfectionCount,  
    Round(
        Max((COALESCE(total_cases,0)/population))*100 ,2
        ) as PercentPopulationInfected
From covid19_death
Where population is not null 
Group by Location, Population
order by PercentPopulationInfected DESC
