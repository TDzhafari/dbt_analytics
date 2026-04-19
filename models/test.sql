SELECT *
FROM {{ source('DEMO', 'BIKE') }}
LIMIT 10