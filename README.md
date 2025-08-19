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

## 📖 Data Storytelling & Insights

This dashboard goes beyond the numbers to highlight **why the data matters**:

- **Seasonal demand:** Reviews peak in summer months, showing strong seasonality in Bristol’s Airbnb market.  
- **COVID impact:** A sharp drop in 2020 reflects how travel restrictions hit short-term rentals.  
- **Neighbourhood pricing:** Clifton and City Centre listings are the most expensive, while Easton and Southville remain more affordable.  
- **Room type patterns:** Entire homes/apartments dominate the high-price range, while private rooms offer budget-friendly options.  
- **Demand vs. price:** Higher prices do not always equal more reviews — suggesting guests balance affordability with location when booking.  

➡️ Together, these insights show how **location, affordability, and external events (like COVID)** shape Airbnb demand in Bristol.


## 🛠 Tools Used
- **SQL (SQLite via DBeaver)** – Data cleaning & transformation  
- **Power BI (Power Query, DAX, Dashboarding)** – Data modeling & visualisation  

---

## 🚀 How to Use
1. Clone the repo:
   ```bash
   git clone https://github.com/Kaung31/Bristol-Airbnb-Analysis.git
