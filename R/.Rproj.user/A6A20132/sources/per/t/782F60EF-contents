# ===== analysis_fixed.R =====
# Load required packages
library(DBI)
library(RSQLite)
library(dplyr)
library(readr)
library(lubridate)
library(ggplot2)

# ---- 1) Connect to SQLite ----
db_path <- "D:/Bristol_AIRBNB/bristol_airbnb.db"
con <- dbConnect(SQLite(), db_path)

# ---- 2) Pull data from your clean tables / views ----
price_nbhd_room <- dbGetQuery(con, "
  SELECT neighbourhood, room_type, avg_price, listings_with_price
  FROM v_price_by_nbhd_room
")

price_nbhd <- dbGetQuery(con, "
  SELECT neighbourhood, avg_price, listings_with_price
  FROM v_price_by_neighbourhood
")

reviews_monthly <- dbGetQuery(con, "
  SELECT month_start, review_count
  FROM v_reviews_monthly
")

# Updated to use listing_id instead of id
listings_for_map <- dbGetQuery(con, "
  SELECT listing_id, neighbourhood, room_type, latitude, longitude, price, number_of_reviews
  FROM listings_clean
  WHERE latitude IS NOT NULL AND longitude IS NOT NULL
")

listing_prices <- dbGetQuery(con, "
  SELECT neighbourhood, room_type, price
  FROM listings_clean
  WHERE price IS NOT NULL
")

price_summary <- listing_prices %>%
  group_by(neighbourhood, room_type) %>%
  summarise(
    n = n(),
    median_price = median(price, na.rm = TRUE),
    p90_price = quantile(price, 0.90, na.rm = TRUE),
    mean_price = mean(price, na.rm = TRUE),
    .groups = "drop"
  )

# ---- 3) Quick plots (optional sanity checks) ----
# Price distribution
ggplot(listing_prices, aes(price)) +
  geom_histogram(bins = 40) +
  ggtitle("Price distribution (capped in SQL)")

# Review counts over time
reviews_monthly$month_start <- as.Date(reviews_monthly$month_start)
ggplot(reviews_monthly, aes(month_start, review_count)) +
  geom_line() +
  ggtitle("Monthly review counts (market)")

# ---- 4) Export tidy CSVs for Tableau ----
export_path <- "D:/Bristol_AIRBNB/exports"
dir.create(export_path, showWarnings = FALSE)

write_csv(price_nbhd_room, file.path(export_path, "price_by_nbhd_room.csv"))
write_csv(price_nbhd,      file.path(export_path, "price_by_neighbourhood.csv"))
write_csv(reviews_monthly, file.path(export_path, "reviews_monthly.csv"))
write_csv(price_summary,   file.path(export_path, "price_summary_median_p90.csv"))
write_csv(listings_for_map,file.path(export_path, "listings_for_map.csv"))

# ---- 5) Done ----
dbDisconnect(con)
cat("✅ Exports written to:", export_path, "\n")
