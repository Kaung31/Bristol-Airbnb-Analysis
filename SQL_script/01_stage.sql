-- ========================================================
-- 01_stage.sql
-- Purpose: Create "stage" tables from raw CSV imports.
-- This is the first layer after loading data into DBeaver.
-- No cleaning yet; just casting to correct types.
-- ========================================================

-- 1. Stage: listings (cast key fields to numeric/date)
DROP TABLE IF EXISTS listings_stage_cast;
CREATE TABLE listings_stage_cast AS
SELECT
    listing_id,
    name,
    host_id,
    host_name,
    neighbourhood,  -- already correct in CSV
    latitude,
    longitude,
    room_type,
    -- Price: remove currency symbols and commas, cast to REAL
    CAST(REPLACE(REPLACE(price, '$', ''), ',', '') AS REAL) AS price_num,
    CAST(minimum_nights AS INTEGER) AS minimum_nights_num,
    CAST(number_of_reviews AS INTEGER) AS number_of_reviews_num,
    DATE(last_review) AS last_review_date,
    CAST(reviews_per_month AS REAL) AS reviews_per_month_num,
    CAST(calculated_host_listings_count AS INTEGER) AS host_listings_count_num,
    CAST(availability_365 AS INTEGER) AS availability_365_num
FROM listings_raw;

-- 2. Stage: reviews (cast dates, keep IDs)
DROP TABLE IF EXISTS reviews_stage_cast;
CREATE TABLE reviews_stage_cast AS
SELECT
    listing_id,
    id AS review_id,
    DATE(date) AS review_date,
    reviewer_id,
    reviewer_name,
    comments
FROM reviews_raw;
