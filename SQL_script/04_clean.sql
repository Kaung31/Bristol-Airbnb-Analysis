-- ========================================================
-- 04_clean.sql
-- Purpose: Produce final cleaned datasets for analysis.
-- Here we apply final business rules, e.g., price=0 → NULL.
-- ========================================================

-- Final: listings_clean
DROP TABLE IF EXISTS listings_clean;
CREATE TABLE listings_clean AS
SELECT
    listing_id,
    name,
    host_id,
    host_name,
    neighbourhood,
    latitude,
    longitude,
    room_type,
    CASE
        WHEN price_capped <= 0 THEN NULL
        ELSE price_capped
    END AS price,
    minimum_nights_num      AS minimum_nights,
    number_of_reviews_num   AS number_of_reviews,
    last_review_date,
    reviews_per_month_num   AS reviews_per_month,
    host_listings_count_num AS host_listings_count,
    availability_365_num    AS availability_365
FROM listings_stage_capped;

CREATE INDEX IF NOT EXISTS idx_listings_clean_listingid
    ON listings_clean(listing_id);
CREATE INDEX IF NOT EXISTS idx_listings_clean_neighbourhood
    ON listings_clean(neighbourhood);
CREATE INDEX IF NOT EXISTS idx_listings_clean_roomtype
    ON listings_clean(room_type);

-- Final: reviews_clean
DROP TABLE IF EXISTS reviews_clean;
CREATE TABLE reviews_clean AS
SELECT
    listing_id,
    review_id,
    review_date,
    reviewer_id,
    reviewer_name,
    comments
FROM reviews_stage_filtered;

CREATE INDEX IF NOT EXISTS idx_reviews_clean_listing
    ON reviews_clean(listing_id);
CREATE INDEX IF NOT EXISTS idx_reviews_clean_date
    ON reviews_clean(review_date);

-- Validation checks
SELECT COUNT(*) AS negative_prices
FROM listings_clean
WHERE price < 0;

SELECT COUNT(*) AS orphan_reviews
FROM reviews_clean r
LEFT JOIN listings_clean l USING(listing_id)
WHERE l.listing_id IS NULL;
