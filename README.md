# cuvette


🧠 Student Performance ML Project
This project focuses on predicting whether a student will pass or fail based on their demographic and academic features using Python + Machine Learning. It includes all the essential steps: from loading the dataset and performing EDA to training and evaluating classification models.

📁 Dataset
Source: Student Performance in Exams – Kaggle

The dataset includes:

Gender

Race/ethnicity

Parental level of education

Lunch status

Test preparation course

Scores in math, reading, and writing

✅ Objectives
Clean and explore the data

Engineer new features

Visualize trends and patterns

Train classification models (Logistic Regression & Random Forest)

Evaluate model performance

📌 Project Steps
1. Data Loading
Load the CSV using pandas

Display the first few records

2. Data Cleaning
Check for missing values

Remove duplicates if any

3. Exploratory Data Analysis (EDA)
Visualize distributions using seaborn and matplotlib

Compare scores across demographic groups

Identify trends and outliers

4. Feature Engineering
Create a binary column pass_math (1 if score ≥ 40, else 0)

Convert categorical variables to numeric using one-hot encoding

5. Train-Test Split
Split the dataset into training and testing sets (80/20)

Ensure model is tested on unseen data

6. Model Training
Use Random Forest Classifier

Alternatively, test with Logistic Regression

7. Model Evaluation
Evaluate using:

Accuracy

Confusion Matrix

F1 Score

8. Documentation
Use markdown cells and comments to explain:

What each step does

Why each step is important

📊 Example Output
Visuals: Histograms, Boxplots, Pairplots

Metrics: Confusion matrix, Accuracy score, F1-score

🚀 Requirements
Install the following Python libraries:

bash
Copy
Edit
pip install pandas numpy matplotlib seaborn scikit-learn
🧠 Learnings
This project demonstrates:

A complete ML workflow in Python

The importance of EDA and feature engineering

Evaluation metrics in classification tasks

Section 2: SQL (Chinook Database)
🎯 Objective
This section focuses on solving real-world business queries using the Chinook Database, a sample database for a digital music store. The aim is to explore data insights using SQL and demonstrate proficiency in data retrieval, joins, aggregation, and time-based analysis.

🗃️ Dataset
Chinook Database: Contains information about customers, employees, invoices, artists, albums, tracks, and genres.

Loaded using SQLite Online IDE / DB Browser for SQLite.

✅ Tasks and Solutions
1️⃣ Top 5 Customers by Total Purchase Amount
Purpose: Identify high-value customers to target for loyalty programs or special offers.

sql
Copy
Edit
SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS CustomerName,
       ROUND(SUM(i.Total), 2) AS TotalPurchase
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalPurchase DESC
LIMIT 5;
2️⃣ Most Popular Genre by Tracks Sold
Purpose: Discover genre trends to support inventory and marketing decisions.

sql
Copy
Edit
SELECT g.Name AS Genre, COUNT(il.TrackId) AS TracksSold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId
ORDER BY TracksSold DESC
LIMIT 1;
3️⃣ Employees Who Are Managers and Their Subordinates
Purpose: Understand company hierarchy for org chart or internal communication analysis.

sql
Copy
Edit
SELECT m.EmployeeId AS ManagerID, m.FirstName || ' ' || m.LastName AS ManagerName,
       e.EmployeeId AS SubordinateID, e.FirstName || ' ' || e.LastName AS SubordinateName
FROM Employee e
JOIN Employee m ON e.ReportsTo = m.EmployeeId
ORDER BY m.EmployeeId;
4️⃣ Most Sold Album by Each Artist
Purpose: Find the most successful album per artist for royalty calculation or promotions.

sql
Copy
Edit
WITH AlbumSales AS (
    SELECT ar.ArtistId, ar.Name AS ArtistName, a.AlbumId, a.Title AS AlbumTitle,
           COUNT(il.TrackId) AS TotalSold
    FROM Artist ar
    JOIN Album a ON ar.ArtistId = a.ArtistId
    JOIN Track t ON a.AlbumId = t.AlbumId
    JOIN InvoiceLine il ON t.TrackId = il.TrackId
    GROUP BY a.AlbumId
)
SELECT * FROM (
    SELECT *, RANK() OVER (PARTITION BY ArtistId ORDER BY TotalSold DESC) AS rnk
    FROM AlbumSales
) ranked_albums
WHERE rnk = 1;
5️⃣ Monthly Sales Trend in 2013
Purpose: Analyze revenue trends to assess seasonal performance and forecast future sales.

sql
Copy
Edit
SELECT STRFTIME('%Y-%m', InvoiceDate) AS Month, ROUND(SUM(Total), 2) AS MonthlySales
FROM Invoice
WHERE STRFTIME('%Y', InvoiceDate) = '2013'
GROUP BY Month
ORDER BY Month;
📎 Files Submitted
chinook_queries.sql: All 5 SQL queries.

output_screenshots/: Screenshots of each query's result.

README.md: Explanation of the problem, queries, and their significance.

📌 Tools Used
SQLite Online: https://sqliteonline.com/

Chinook Sample Database: Available on GitHub




 Section 4: Excel (Online Retail Dataset – UCI)
🎯 Objective
In this section, we explore Excel-based data analysis using the Online Retail Dataset from UCI. The goal is to clean the dataset, generate useful summaries using Pivot Tables, apply formulas for metrics, and use visual tools for insight generation.

🗃️ Dataset
Online Retail Dataset (UCI)
Includes transactions from a UK-based online retailer between 2010 and 2011.

✅ Tasks Completed
1️⃣ Data Cleaning
Removed null values in essential fields like InvoiceNo, CustomerID, and Description.

Handled duplicates by removing repeated transactions using Excel's “Remove Duplicates” feature on key columns (InvoiceNo, StockCode, Quantity, CustomerID, etc.).

2️⃣ Pivot Table – Total Sales by Country and Month
Created a Pivot Table:

Rows: Country

Columns: Month (extracted from InvoiceDate)

Values: Total Sales = Quantity * UnitPrice (added as a calculated column before)

Used this to analyze sales trends across regions and months.

3️⃣ Formulas Added
🔸 Average Order Value
excel
Copy
Edit
=Total Sales / Number of Orders
Used formula in a helper column or summary table to calculate AOV per country.

🔸 % Contribution to Total Sales (Per Country)
excel
Copy
Edit
=Country Sales / Total Sales
Applied across Pivot Table or summary section to track country-wise performance.

4️⃣ Conditional Formatting – Top 5 Countries by Revenue
Sorted countries by total revenue.

Applied conditional formatting:

Top 5 values → Green fill / bold font for emphasis.

Helps quickly identify high-performing countries.

5️⃣ Monthly Revenue Trend Chart
Created a line chart from the Pivot Table (Country: All, Columns: Month, Values: Total Sales).

This visual shows seasonal trends and peak sale periods over time.

📎 Files Submitted
OnlineRetail_Cleaned.xlsx: Cleaned dataset.

Pivot_Tables_Analysis.xlsx: Includes pivot tables, formulas, and visuals.

README.md: Summary of all tasks and rationale.

📌 Tools Used
Microsoft Excel (or Google Sheets for web-based alternatives)

Functions: IF, ISBLANK, SUMIF, AVERAGE, COUNTIFS

Charts: Line chart for monthly revenue

Conditional Formatting Rules
