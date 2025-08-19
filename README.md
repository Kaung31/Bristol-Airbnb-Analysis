# Bristol Airbnb Data Analysis

This project explores Airbnb listings and reviews data for **Bristol, UK**.  
It shows a full workflow — from cleaning raw data in SQL to building an **interactive Power BI dashboard** with DAX measures.

I originally built a Tableau version of this project using R for analysis.  
This Power BI version focuses on **data modeling, dashboard reporting, and storytelling**.

---

## 📌 Project Workflow

### 1. Data Cleaning (SQLite + DBeaver)
- Imported raw listings and reviews CSVs into SQLite.  
- Removed nulls, duplicates, and capped extreme outliers.  
- Standardised column names and data types.  
- Created clean tables and summary views for analysis.  

### 2. Data Modeling (Power BI)
- Loaded cleaned CSVs into Power BI.  
- Built a star schema model:
  - Listings (neighbourhood, room type, price)  
  - Reviews (monthly trends)  
  - Custom Date table for time-series analysis  
- Defined relationships between tables.  
- Created DAX measures:
  - **Total Listings**  
  - **Total Reviews**  
  - **Median Price**  
  - **Reviews per Listing**  

### 3. Dashboard Reporting (Power BI)
- Designed an interactive dashboard with:
  - **KPI cards** for quick insights  
  - **Line chart** of reviews over time (seasonality + COVID impact)  
  - **Bar charts** for median price by neighbourhood and by room type  
  - **Filters** for neighbourhood and room type  

---

## 📊 Key Insights
- **Clifton and City Centre** have the highest average listing prices.  
- **Entire homes/apartments** dominate the high-price range.  
- **Review activity** peaks in summer and drops sharply in 2020 (COVID impact).  

---

## 🛠 Tools Used
- **SQL (SQLite via DBeaver)** – Data cleaning & transformation  
- **Power BI (Power Query, DAX, Dashboarding)** – Data modeling & visualisation  

---

## 🚀 How to Use
1. Clone the repo:
   ```bash
   git clone https://github.com/Kaung31/Bristol-Airbnb-Analysis.git
