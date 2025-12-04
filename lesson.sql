-- List patients in Kingston Hospital

/*
multiline comment
blocks off several rows at once
*/

SELECT
    PatientId,
    AdmittedDate,
    DischargeDate,
    -- 1 AS LengthOfStay, -- calculated field. If you just put 1, a column would be created with no name and all values are 1
    DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthOfStay, -- calculated field using a built in function, DATEDIFF
    DATEADD(WEEK,-2,AdmittedDate) AS ReminderDate, -- calculated field using built in function, DATEADD minus number to give date beforehand
    DATEADD(MONTH,3,DischargeDate) AS AppointmentDate,
    Hospital,
    Ward,
    Tariff
FROM
    PatientStay
-- for column or table names that include spaces, use square brackets around the  name
WHERE
    Hospital IN ('Kingston', 'PRUH')
-- AND Ward LIKE '%Surgery'
    -- AND Ward LIKE 'D%'
    -- AND Ward IN ('Day Surgery', 'General Surgery')
    -- AND Ward = 'Dermatology'
    -- AND AdmittedDate = '2024-02-27' -- SQL has automatically changed the date from a date format to a string
    -- AND AdmittedDate >= '2024-02-27' -- can use <, > <=, >=
-- AND AdmittedDate BETWEEN '2024-02-27' AND '2024-03-02'
-- AND Tariff > 6 -- can use single quotes and SQL will still recognise it is a number
-- ORDER BY Hospital, Ward, Tariff DESC
ORDER BY PatientId DESC

-- Summarise data

SELECT
    Hospital
    ,Ward
    -- can add commas at the start of next line instead, just a different style
    ,COUNT(*) AS NumberOfPatients
    ,SUM(Tariff) AS TotalTariff
FROM
    PatientStay
GROUP BY Hospital, Ward

-- use a join to combine data from more than one table
/*
SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,h.Hospital
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay ps JOIN DimHospital h ON ps.Hospital = h.Hospital
-- have created table aliases to make them shorter. must use the alias throughout the section of script
WHERE HospitalType = 'Teaching'
-- this is an inner join, only returns records where matching in both tables.
*/

SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay ps LEFT JOIN DimHospitalBad h ON ps.Hospital = h.Hospital -- left join - all records from the first table and those in the right table that match
    -- good to always use a Left join and swap the tables around

-- can also use a Full Outer Join - all records from both tables
 SELECT
    ps.PatientId
    ,ps.AdmittedDate
    ,ps.Hospital
    ,h.Hospital
    ,h.HospitalType
    ,h.HospitalSize
FROM
    PatientStay ps FULL OUTER JOIN DimHospitalBad h ON ps.Hospital = h.Hospital