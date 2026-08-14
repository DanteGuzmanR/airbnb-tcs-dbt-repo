{{config (materialized = 'table')}}

with l as (
    select * from {{ref('dim_listings_cleansed')}}
),
h as (
    select * from {{ref('dim_hosts_cleansed')}}
)
select 
    l.listings_id,
    l.listings_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    h.host_status,
    l.created_at,
    GREATEST(l.updated_at, h.updated_at) as updated_at
FROM l
LEFT JOIN h ON (h.host_id = l.host_id)