-- ========================================================
-- 02_quality_rules.sql
-- Purpose: Remove listings with invalid data and
-- filter reviews to only those linked to valid listings.
-- ========================================================

-- Step 2A: Filter listings for basic sanity checks
DROP TABLE IF EXISTS listings_stage_filtered;
CREATE TABLE listings_stage_filtered AS
SELECT *
FROM listings_stage_cast
WHERE
    -- Keep all rows for now, except unrealistic minimum_nights
    minimum_nights_num >= 1
    AND minimum_nights_num <= 365;

-- Step 2B: Filter reviews (remove orphans and duplicates)
DROP TABLE IF EXISTS reviews_stage_filtered;
CREATE TABLE reviews_stage_filtered AS
WITH joined AS (
    SELECT r.*
    FROM reviews_stage_cast r
    JOIN listings_stage_filtered l
        ON l.listing_id = r.listing_id
)
SELECT *
FROM (
    SELECT
        joined.*,
        ROW_NUMBER() OVER (
            PARTITION BY listing_id, review_id
            ORDER BY review_date
        ) AS rn
    FROM joined
)
WHERE rn = 1;

-- Audit counts
SELECT 'listings_stage_cast' AS step, COUNT(*) FROM listings_stage_cast
UNION ALL
SELECT 'listings_filtered' AS step, COUNT(*) FROM listings_stage_filtered
UNION ALL
SELECT 'reviews_stage_cast' AS step, COUNT(*) FROM reviews_stage_cast
UNION ALL
SELECT 'reviews_filtered' AS step, COUNT(*) FROM reviews_stage_filtered;
