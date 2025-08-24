-- Create table with correct data types
CREATE TABLE Covid19_Vaccination (
    iso_code TEXT,
    continent TEXT,
    location TEXT,
    date DATE,
    new_tests DECIMAL,
    total_tests DECIMAL,
    total_tests_per_thousand DECIMAL,
    new_tests_per_thousand DECIMAL,
    new_tests_smoothed DECIMAL,
    new_tests_smoothed_per_thousand DECIMAL,
    positive_rate DECIMAL,
    tests_per_case DECIMAL,
    tests_units TEXT,
    total_vaccinations DECIMAL,
    people_vaccinated DECIMAL,
    people_fully_vaccinated DECIMAL,
    new_vaccinations DECIMAL,
    new_vaccinations_smoothed DECIMAL,
    total_vaccinations_per_hundred DECIMAL,
    people_vaccinated_per_hundred DECIMAL,
    people_fully_vaccinated_per_hundred DECIMAL,
    new_vaccinations_smoothed_per_million DECIMAL,
    stringency_index DECIMAL,
    population_density DECIMAL,
    median_age DECIMAL,
    aged_65_older DECIMAL,
    aged_70_older DECIMAL,
    gdp_per_capita DECIMAL,
    extreme_poverty DECIMAL,
    cardiovasc_death_rate DECIMAL,
    diabetes_prevalence DECIMAL,
    female_smokers DECIMAL,
    male_smokers DECIMAL,
    handwashing_facilities DECIMAL,
    hospital_beds_per_thousand DECIMAL,
    life_expectancy DECIMAL,
    human_development_index DECIMAL
);
copy covid19_Vaccination 
FROM 'C:\Users\viett\OneDrive - Thang Long University\Desktop\Sql_learn\Covid19_project\database\CovidVaccinations.csv' 
WITH (
    FORMAT CSV,
    HEADER true,
    DELIMITER ',',
    NULL ''
);
