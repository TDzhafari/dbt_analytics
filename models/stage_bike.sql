WITH CTE AS(
    SELECT 
        RIDE_ID,
        REPLACE(STARTED_AT,'"','') as STARTED_AT,
        REPLACE(ENDED_AT,'"','') as ENDED_AT,
        START_STATION_NAME,
        START_STATIO_ID as START_STATION_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LNG,
        MEMBER_CSUAL as MEMBER_CASUAL
    FROM {{ source('DEMO', 'BIKE') }}
    WHERE RIDE_ID != 'bikeid'
)
SELECT * FROM CTE