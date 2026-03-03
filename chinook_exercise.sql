/*
The Chinook database contains details of an online music store.
Here are some example answers to the question
*/

-- List all customers
SELECT
    *
FROM
    Customer c 
-- WHERE c.Company IS NULL

-- List all customers. Show only the CustomerId, FirstName and LastName columns
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    c.Country,
    c.Email
FROM
Customer c



-- List customers in the United Kingdom  
--WHERE c.Country = 'United Kingdom'

-- List customers whose first names begins with an A.
-- Hint: use LIKE and the % wildcard
-- WHERE c.FirstName LIKE 'A%'

-- List Customers with an apple email address

-- Which customers have the initials LK?
-- WHERE (c.firstName like 'L%') and (c.LastName like 'K%')

-- Which are the corporate customers i.e. those with a value, not NULL, in the Company column?
-- WHERE c.Company IS NOT NULL


-- How many customers are in each country.  Order by the most popular country first.
-- remember to use group by

-- When was the oldest employee born?  Who is that?
select top 1 e.BirthDate
from Employee e
order by e.BirthDate

select min(e.birthdate) from employee e


-- List the 10 latest invoices. Include the InvoiceId, InvoiceDate and Total
-- Then  also include the customer full name (first and last name together)
SELECT
    TOP(10)
    i.InvoiceId
    ,i.InvoiceDate
    ,i.Total
    ,c.LastName
    ,c.FirstName
    --,c.FirstName + ' ' + c.LastName AS CustomerFullName
    --,c.FirstName + ' ' + c.LastName + CAST(i.invoiceId as VARCHAR) AS CustomerFullName
    ,CONCAT(c.firstname,' ',c.LastName) AS CustomerFullName
    --,CONCAT(c.firstname,' ',c.LastName, i.InvoiceId) AS CustomerFullName -- CONCAT inherently coverts InvoiceId to a string
    ,c.SupportRepId
    ,CONCAT(e.FirstName, ' ',e.LastName) AS EmployeeFullName
FROM
    Invoice i LEFT JOIN Customer c ON i.CustomerId = c.CustomerId
-- match the customer id in the two tables to get the first and last name
    LEFT JOIN Employee e ON c.SupportRepId = E.EmployeeId
ORDER BY i.InvoiceDate DESC
-- can use an inner join instead because of the database structure in this case. It may be more efficient to run if lots of records


-- List the customers who have spent more than £45

-- List the City, CustomerId and LastName of all customers in Paris and London, 
-- and the Total of their invoices
	
-- Show all details about customer Michelle Brooks.  List salient details of her invoices.

/*
Which employees were born in the 1960s?  Show only the EmployeeId, FirstName, LastName and BirthDate columns
Note: Define a date value as with the region independent format 'yyyy-mm-dd' e.g. '1969-12-31'
*/


-- List countries, and the number of customers and the total invoiced amount
-- Order  high to low in terms of the number of customers

-- What are the top 10 most popular artists in terms of number of tracks bought by customers?

-- List the albums in alphabetical order of Title

-- List 10 albums and their artist.  Order by album title.