USE Covid_19;


SELECT * FROM [Covid-19];

--checking avg and sum of all meaningfull data
SELECT 
    ROUND(AVG(CAST(Confirmed AS FLOAT)),2) AS Average_Confirmed,
	ROUND(AVG(CAST(Recovered AS FLOAT)),2) AS Average_Recovered,
    ROUND(AVG(CAST(Deaths AS FLOAT)),2) AS Average_Deaths,
	SUM(CAST(Confirmed AS BIGINT)) AS SUM_Confirmed,
	SUM(CAST(Recovered AS BIGINT)) AS SUM_Recovered,
    SUM(CAST(Deaths AS BIGINT)) AS SUM_Deaths,
	Country
FROM 
    [Covid-19] 
WHERE 
    Confirmed > 0
GROUP BY
	Country;

-- checking max for each measures
SELECT 
	MAX(Confirmed) AS Most_Confirmed,
	MAX(Recovered) AS Most_Recovered,
	MAX(Deaths) AS Most_Deaths,
	Country
FROM
	[Covid-19]
GROUP BY
	Country

--The number of days when the number of confirmed cases exceeded a certain threshold value for Germany and Italy

SELECT COUNT(Date) AS Days_above_boundary_deaths FROM [Covid-19] WHERE Country = 'Germany' AND Deaths > 20000;
SELECT COUNT(Date) AS Days_above_boundary_deaths FROM [Covid-19] WHERE Country = 'Italy' AND Deaths > 20000;



--Comparing the dynamics of confirmed cases, recoveries, and deaths growth between different countries over a period 2020/2022
SELECT 
    Country,
    MAX(Confirmed) - MIN(Confirmed) AS Growth_Confirmed,
    MAX(Recovered) - MIN(Recovered) AS Growth_Recovered,
    MAX(Deaths) - MIN(Deaths) AS Growth_Deaths
FROM 
    [Covid-19]
WHERE 
    Date BETWEEN '2020-01-01' AND '2022-12-31'
GROUP BY 
    Country;











