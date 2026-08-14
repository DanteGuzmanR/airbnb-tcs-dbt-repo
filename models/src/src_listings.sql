WITH resultset as (
    select * from {{source ('airbnb','listings')}}
)
select
ID as listings_id,
NAME as listings_name,
LISTING_URL,
ROOM_TYPE,
MINIMUM_NIGHTS,
HOST_ID,
PRICE As Price_Str,
CREATED_AT,
UPDATED_AT
from resultset