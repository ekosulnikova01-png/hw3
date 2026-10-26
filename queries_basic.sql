-- 1. Фильтрация по дате и сортировка
SELECT * FROM bookings.flights 
WHERE scheduled_departure >= '2017-07-01' AND scheduled_departure < '2017-08-01'
ORDER BY scheduled_departure ASC LIMIT 5;

SELECT * FROM bookings.flights 
WHERE status = 'Arrived'
ORDER BY actual_departure DESC LIMIT 5;

SELECT * FROM bookings.flights 
WHERE departure_airport = 'DME'
ORDER BY flight_no ASC;

-- 2. Агрегация и группировка
SELECT status, COUNT(*) AS count FROM bookings.flights GROUP BY status;
SELECT departure_airport, COUNT(*) AS count FROM bookings.flights GROUP BY departure_airport ORDER BY count DESC;
SELECT flight_no, COUNT(*) FROM bookings.flights GROUP BY flight_no HAVING COUNT(*) > 1;

-- 3. JOIN
SELECT f.flight_no, a.city AS dep_city 
FROM bookings.flights f 
INNER JOIN bookings.airports a ON f.departure_airport = a.airport_code LIMIT 5;

SELECT f.flight_no, a.city AS arr_city 
FROM bookings.flights f 
LEFT JOIN bookings.airports a ON f.arrival_airport = a.airport_code LIMIT 5;

SELECT f.flight_no, a1.city AS dep_city, a2.city AS arr_city 
FROM bookings.flights f
FULL OUTER JOIN bookings.airports a1 ON f.departure_airport = a1.airport_code
FULL OUTER JOIN bookings.airports a2 ON f.arrival_airport = a2.airport_code
WHERE f.flight_no IS NOT NULL LIMIT 5;

SELECT f.flight_no, a.city 
FROM bookings.flights f 
CROSS JOIN bookings.airports a LIMIT 10;