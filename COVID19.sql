--Viewing Tables
SELECT *
FROM Project..CovidDeaths

SELECT *
FROM Project..CovidVaccinations



--Selecting Data needed for the Queries
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM Project..CovidDeaths
ORDER BY 1,2

--1. Showing the date, total_cases, total_deaths and death_rate in Nigeria
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS Death_Rate
FROM Project.dbo.CovidDeaths
WHERE location LIKE '%Nigeria%' AND continent IS NOT NULL
ORDER BY 1,2


--Total Cases vs Population
--What percentage of population got covid

SELECT location, date, total_cases, population, (total_cases/population)*100 AS InfectedPopulation_Rate
FROM Project..CovidDeaths
--WHERE location LIKE '%Nigeria%'
ORDER BY 1,2

--2. location with highest infection rate compared to population
SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 AS InfectedPopulation_Rate
FROM Project..CovidDeaths
--WHERE location LIKE '%Nigeria%'
GROUP BY location, population
ORDER BY InfectedPopulation_Rate DESC

--3. Location(countries) with Highest Death Count per Population
SELECT location, MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM Project..CovidDeaths
--WHERE location LIKE '%Nigeria%'
WHERE continent is not NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

--4. Showing the location(continents) and their TotalDeathCount 
SELECT location, MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM Project..CovidDeaths
--WHERE location LIKE '%Nigeria%'
WHERE continent is NULL AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC

--5. SHOWING THE  GLOBAL total_cases, totatl_deaths AND death_Rate
SELECT SUM(new_cases) AS Total_Cases, SUM(CAST(new_deaths AS INT)) as Total_Deaths, SUM (CAST(new_deaths AS INT))/SUM
	(new_cases)*100 AS DeathRate
FROM Project..CovidDeaths
WHERE continent is not NULL
--GROUP BY date
ORDER BY 1,2

--6. SHOWING DATA BY CONTINENTS
--a
SELECT continent, MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM Project..CovidDeaths
WHERE continent is not NULL
GROUP BY continent
ORDER BY TotalDeathCount DESC

--b
SELECT location, MAX(CAST(Total_deaths AS INT)) AS TotalDeathCount
FROM Project..CovidDeaths
WHERE continent is NULL
GROUP BY location
ORDER BY TotalDeathCount DESC

--7. JOINING CovidDeaths AND CovidVaccinations
SELECT *
FROM Project..CovidDeaths AS Death
JOIN Project..CovidVaccinations AS Vac
ON death.location = Vac.location
AND death.date = Vac.date

--8. SHOWING THE TOTAL POPULATION AND VACCINATIONS
--a. 
SELECT death.continent, death.date, death.population, vac.new_vaccinations, vac.total_vaccinations
FROM Project..CovidDeaths AS death
JOIN Project..CovidVaccinations AS Vac
    ON death.location = Vac.location
    AND death.date = Vac.date

--b.
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM (CONVERT(INT,vac.new_vaccinations)) OVER (PARTITION BY death.location ORDER BY death.location,
	death.date) AS RollingPeopleVaccination
FROM Project..CovidDeaths AS death
JOIN Project..CovidVaccinations AS vac
	ON death.location = vac.location
	AND death.date = vac.date
WHERE death.continent is not NULL
ORDER BY 2,3

--USE CTE
WITH popvsvac(continent, location, date, population, new_vaccinations, RollingPeopleVaccination)
AS
(
SELECT death.continent, death.location, death.date, death.population, vac.new_vaccinations,
	SUM (CONVERT(INT,vac.new_vaccinations)) OVER (PARTITION BY death.location ORDER BY death.location,
	death.date) AS RollingPeopleVaccination
--	,(RollingPeopleVaccination/population) *100
FROM Project..CovidDeaths death
JOIN Project..CovidVaccinations vac
	ON death.location = vac.location
	AND death.date = vac.date
WHERE death.continent is not NULL
--ORDER BY 2,3 
)
SELECT*, (RollingPeopleVaccination/population)*100
FROM PopvsVac
