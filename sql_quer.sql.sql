-- 1. Top 5 Customers by Total Purchase Amount
SELECT 
    c.CustomerId,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    ROUND(SUM(i.Total), 2) AS TotalPurchase
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalPurchase DESC
LIMIT 5;

-- 2. Most Popular Genre by Total Tracks Sold
SELECT 
    g.Name AS Genre,
    COUNT(il.TrackId) AS TracksSold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId
ORDER BY TracksSold DESC
LIMIT 1;


-- 3. Employees Who Are Managers and Their Subordinates
SELECT 
    m.EmployeeId AS ManagerID,
    m.FirstName || ' ' || m.LastName AS ManagerName,
    e.EmployeeId AS SubordinateID,
    e.FirstName || ' ' || e.LastName AS SubordinateName
FROM Employee e
JOIN Employee m ON e.ReportsTo = m.EmployeeId
ORDER BY m.EmployeeId;






-- 4. Most Sold Album by Each Artist
WITH AlbumSales AS (
    SELECT 
        ar.ArtistId,
        ar.Name AS ArtistName,
        a.AlbumId,
        a.Title AS AlbumTitle,
        COUNT(il.TrackId) AS TotalSold
    FROM Artist ar
    JOIN Album a ON ar.ArtistId = a.ArtistId
    JOIN Track t ON a.AlbumId = t.AlbumId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
    GROUP BY a.AlbumId
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY ArtistId ORDER BY TotalSold DESC) AS rnk
    FROM AlbumSales
) ranked_albums
WHERE rnk = 1;

-- 5. Monthly Sales Trends in 2013
SELECT 
    STRFTIME('%Y-%m', InvoiceDate) AS Month,
    ROUND(SUM(Total), 2) AS MonthlySales
FROM Invoice
WHERE STRFTIME('%Y', InvoiceDate) = '2013'
GROUP BY Month
ORDER BY Month;








