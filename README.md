Bristol Airbnb Data Analysis

This project explores Airbnb listings and reviews data for Bristol, UK. It demonstrates an end-to-end data workflow — from raw data cleaning in SQL to analysis in R, and interactive visualisation in Tableau.

🔗 View Interactive Dashboard on Tableau Public
📌 Project Overview
1. Data Cleaning & Transformation (SQLite via DBeaver)

    Imported raw listings and reviews CSVs into SQLite.

    Applied quality rules: removed nulls, capped extreme outliers, standardised columns.

    Created clean tables and summary views for analysis.

2. Data Analysis in R

    Connected to the cleaned SQLite database.

    Generated aggregated datasets (prices by neighbourhood & room type, review trends, etc.).

    Exported tidy CSVs for Tableau visualisation.

3. Visualisation in Tableau

    Built an interactive dashboard with neighbourhood filters, price heatmaps, and review trends.

📂 Data Access

    The SQLite database (bristol_airbnb.db) is not included in this repo because it exceeds GitHub’s 100 MB limit.

    Instead, you can work with the cleaned CSV exports in the /exports folder — these contain all data needed for visualisation in Tableau.

🛠 Tools Used

    SQL (SQLite via DBeaver) – Data cleaning & transformation

    R – Data aggregation & export

    Tableau Public – Interactive dashboard creation

📊 Key Insights

    City Centre & Clifton have the highest average listing prices.

    Entire home/apartment listings dominate the high-price range.

    Review activity shows strong seasonal peaks in summer.

🚀 How to Use

    Clone the repo:

git clone https://github.com/Kaung31/Bristol-Airbnb-Analysis.git

Open the CSV files in /exports with Tableau Public/Desktop.

Explore the dashboard or create your own visuals.
