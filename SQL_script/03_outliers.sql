-- ========================================================
-- 03_outliers.sql
-- Purpose: Identify and cap extreme prices at approx P99.
-- This prevents skew from unrealistic high values.
-- ========================================================

-- Rank prices to find P99 threshold
DROP TABLE IF EXISTS listings_price_ranked;
CREATE TABLE listings_price_ranked AS
SELECT *,
       PERCENT_RANK() OVER (ORDER BY price_num) AS p_rank
FROM listings_stage_filtered
WHERE price_num IS NOT NULL;

-- Find P99 value (first price at or above 99th percentile)
WITH p AS (
    SELECT price_num
    FROM listings_price_ranked
    WHERE p_rank >= 0.99
    ORDER BY p_rank ASC
    LIMIT 1
)
SELECT price_num AS p99 FROM p;

-- Apply capping: if price > P99, set to P99 value
DROP TABLE IF EXISTS listings_stage_capped;
CREATE TABLE listings_stage_capped AS
WITH p AS (
    SELECT price_num AS p99
    FROM listings_price_ranked
    WHERE p_rank >= 0.99
    ORDER BY p_rank ASC
    LIMIT 1
)
SELECT
    l.*,
    CASE
        WHEN l.price_num > p.p99 THEN p.p99
        ELSE l.price_num
    END AS price_capped
FROM listings_stage_filtered l, p;

-- Compare before/after ranges
SELECT MIN(price_num) AS min_before, MAX(price_num) AS max_before
FROM listings_stage_filtered;
SELECT MIN(price_capped) AS min_after, MAX(price_capped) AS max_after
FROM listings_stage_capped;
