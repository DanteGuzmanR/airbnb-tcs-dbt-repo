{{ config(materialized='view') }}

WITH reviews AS (
    SELECT
        listings_id,
        {{ sentiment_score('review_sentiment') }} AS sentiment_score
    FROM {{ ref('fct_reviews') }}
)
SELECT
    listings_id,
    COUNT(*)                        AS total_reviews,
    ROUND(AVG(sentiment_score), 2)  AS avg_sentiment,
    SUM(sentiment_score)            AS net_sentiment
FROM reviews
GROUP BY listings_id
ORDER BY avg_sentiment DESC