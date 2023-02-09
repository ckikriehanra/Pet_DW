USE [Pet_finder_DW];
--How many pets are there from 1 to 3 years old?
SELECT SUM([Quantity]) AS no_pet
FROM [dbo].[Pet_periodic_FACT_table]
WHERE [Age] BETWEEN 1 AND 3;

--How many pets were rescued in Kuala Lumpur?
SELECT COUNT(*) AS No_pet_in_Kuala_Lumpur
FROM [dbo].[Pet_periodic_FACT_table] AS P
INNER JOIN (
	SELECT *
	FROM [dbo].[State_DIM]
	WHERE [State] = 'Kuala Lumpur'
) AS S
ON P.State_key = S.State_key;

--How many vaccinated pets are also sterilized?
SELECT COUNT(*) AS No_pet
FROM [dbo].[Pet_periodic_FACT_table] AS PF
INNER JOIN (
	SELECT * 
	FROM [dbo].[Pet_DIM]
	WHERE [Vaccinated] = 'Yes' AND [Sterilized] = 'Yes'
) AS P
ON PF.Pet_key = P.Pet_key;

