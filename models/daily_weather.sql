WITH daily_weather as(
    SELECT DATE(TIME) as daily_weather,
    WEATHER, 
    TEMP, 
    HUMIDITY, 
    CLOUDS 
    FROM {{ source('DEMO', 'WEATHER') }} LIMIT 10

),
daily_weather_aggregate as(
    SELECT daily_weather, weather, count(weather),
    ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) as ROW_NUMBER
    FROM daily_weather
    GROUP BY daily_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)
SELECT * FROM daily_weather_aggregate