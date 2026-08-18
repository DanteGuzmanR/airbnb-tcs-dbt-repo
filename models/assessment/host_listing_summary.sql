{{ config(materialized='view') }}

WITH l AS (
    SELECT * FROM {{ ref('dim_listings_cleansed') }}
),
h AS (
    SELECT * FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    h.host_id,
    h.host_name,
    COUNT(l.listings_id)   AS number_of_listings,
    ROUND(AVG(l.price), 2) AS avg_price
FROM h
LEFT JOIN l ON l.host_id = h.host_id
GROUP BY h.host_id, h.host_name
ORDER BY number_of_listings DESC
