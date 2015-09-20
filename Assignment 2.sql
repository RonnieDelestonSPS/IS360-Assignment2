COPY (
Select 
flights.year AS 'Year',
flights.month AS 'Month',
flights.day AS 'Day',
flights.origin AS 'Airport of Origin',
flights.carrier AS 'Carrier',
AVG(flights.dep_delay) AS 'Average Departure Delay',
AVG(flights.arr_delay) AS 'Arrival Delay'
FROM flights
LEFT JOIN planes
ON flights.tailnum = planes.tailnum
WHERE (flights.origin = 'LGA' OR flights.origin = 'EWR' OR flights.origin = 'JFK') AND (flights.year = 2013 AND ((flights.month = 2 AND flights.day > 22) OR (flights.month = 3 AND flights.day = 1)))
GROUP BY flights.origin,flights.month)
TO '/Users/Ronnie/Documents/Education/2015 Fall/IS 360/Week 2/Assignment 2.csv' WITH CSV HEADER;

