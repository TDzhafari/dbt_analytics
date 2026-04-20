WITH daily_weather as(
    SELECT DATE(TIME) as daily_weather,
    WEATHER, 
    TEMP, 
    HUMIDITY, 
    CLOUDS,
    pressure
    FROM {{ source('DEMO', 'WEATHER') }} LIMIT 100

),
daily_weather_aggregate as(
    SELECT 
    daily_weather, 
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure), 2) as avg_pressure,
    round(avg(humidity), 2) as avg_humidity
    FROM daily_weather
    GROUP BY daily_weather, weather
    qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
)
SELECT * FROM daily_weather_aggregate