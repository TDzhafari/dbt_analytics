WITH BIKE AS (
    SELECT 
        DISTINCT

        START_STATION_ID as station_id,
        START_STATION_NAME as station_name,        
        START_LAT as station_lat,
        START_LNG as start_station_lng

    FROM {{ source('DEMO', 'BIKE') }}
    WHERE RIDE_ID != 'ride_id'
)
SELECT * FROM BIKE