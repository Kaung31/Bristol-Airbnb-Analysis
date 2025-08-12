-- ========================================================
-- 05_views.sql
-- Purpose: Create analysis-ready views for Tableau/R.
-- These hide filtering logic and apply business rules.
-- ========================================================

-- Price by neighbourhood & room type
DROP VIEW IF EXISTS v_price_by_nbhd_room;
CREATE VIEW v_price_by_nbhd_room AS
SELECT
    neighbourhood,
    room_type,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS listings_with_price
FROM listings_clean
WHERE price IS NOT NULL
GROUP BY 1,2;

-- Price by neighbourhood (all room types)
DROP VIEW IF EXISTS v_price_by_neighbourhood;
CREATE VIEW v_price_by_neighbourhood AS
SELECT
    neighbourhood,
    ROUND(AVG(price), 2) AS avg_price,
    COUNT(*) AS listings_with_price
FROM listings_clean
WHERE price IS NOT NULL
GROUP BY 1;

-- Monthly reviews trend
DROP VIEW IF EXISTS v_reviews_monthly;
CREATE VIEW v_reviews_monthly AS
SELECT
    STRFTIME('%Y-%m-01', review_date) AS month_start,
    COUNT(*) AS review_count
FROM reviews_clean
GROUP BY 1
ORDER BY 1;
