-- Запрос 1. WHERE с OR: ...
SELECT title, explicit, play_count 
FROM tracks 
WHERE explicit = TRUE OR play_count > 1000000;

-- Запрос 2. IN: ...
SELECT title, duration_sec, track_number 
FROM tracks 
WHERE track_number IN (1, 2, 3);

-- Запрос 3. BETWEEN и вычисляемый столбец: ...
SELECT title, duration_sec, ROUND(duration_sec / 60.0, 2) AS duration_minutes 
FROM tracks 
WHERE duration_sec BETWEEN 200 AND 300;

-- Запрос 4. LIKE: ...
SELECT title, duration_sec 
FROM tracks 
WHERE title LIKE '%Love%';

-- Запрос 5. ORDER BY и IS NULL: ...
SELECT title, play_count, track_number 
FROM tracks 
WHERE track_number IS NULL 
ORDER BY play_count DESC;