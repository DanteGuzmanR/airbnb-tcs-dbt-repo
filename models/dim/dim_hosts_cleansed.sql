with resultset as (
    select * from {{ ref('src_hosts') }}
)
select
host_id,
    NVL(
        host_name,
        'Anonymous'
    ) AS host_name,
    is_superhost,
    {{ superhost_label('is_superhost') }}  AS host_status,
    created_at,
    updated_at
from resultset