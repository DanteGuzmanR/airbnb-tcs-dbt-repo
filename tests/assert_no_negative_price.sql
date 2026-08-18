-- Singular test: PASSES when this query returns zero rows.
SELECT *
FROM {{ ref('dim_listings_cleansed') }}
WHERE price < 0
