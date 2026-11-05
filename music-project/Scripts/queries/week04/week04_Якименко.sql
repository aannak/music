-- Запрос 1. COUNT (Таблица artists).
-- Вопрос по данным: Сколько всего артистов в базе?
-- Демонстрирует: Агрегатная функция COUNT.
SELECT COUNT(*) AS total_artists FROM artists;

-- Запрос 2. MIN и MAX (Таблица artists).
-- Вопрос по данным: Какой самый ранний и самый поздний год основания артиста?
-- Демонстрирует: Агрегатные функции MIN и MAX.
SELECT MIN(formed_year) AS earliest_year, MAX(formed_year) AS latest_year FROM artists;

-- Запрос 3. GROUP BY по одному столбцу (Таблица artists).
-- Вопрос по данным: Сколько артистов в каждой стране?
-- Демонстрирует: GROUP BY по одному столбцу.
SELECT country, COUNT(*) AS artist_count 
FROM artists 
GROUP BY country;

-- Запрос 4. GROUP BY по двум столбцам (Таблица listens).
-- Вопрос по данным: Сколько прослушиваний было сделано с каждого устройства (device) каждым пользователем (user_id)?
-- Демонстрирует: GROUP BY по двум столбцам.
SELECT user_id, device, COUNT(*) AS listen_count 
FROM listens 
GROUP BY user_id, device;

-- Запрос 5. HAVING (Таблица artists).
-- Вопрос по данным: Какие страны имеют более 2 артистов?
-- Демонстрирует: GROUP BY и HAVING.
SELECT country, COUNT(*) AS artist_count 
FROM artists 
GROUP BY country 
HAVING COUNT(*) > 2;

-- Запрос 6. WHERE + GROUP BY + ORDER BY (Таблица listens).
-- Вопрос по данным: Какие устройства (device) имеют среднее количество прослушанных секунд больше 150, и как они отсортированы по этому среднему значению?
-- Демонстрирует: WHERE, GROUP BY, AVG и ORDER BY.
SELECT device, AVG(seconds_played) AS avg_seconds 
FROM listens 
WHERE seconds_played > 0 
GROUP BY device 
ORDER BY avg_seconds DESC;

-- Запрос 7. SUM и AVG (Таблица listens).
-- Вопрос по данным: Какова общая и средняя длительность всех прослушиваний в секундах?
-- Демонстрирует: Агрегатные функции SUM и AVG.
SELECT SUM(seconds_played) AS total_seconds, AVG(seconds_played) AS avg_seconds FROM listens;

-- Запрос 8. COUNT с DISTINCT (Таблица listens).
-- Вопрос по данным: Сколько уникальных устройств (device) использовалось для прослушивания?
-- Демонстрирует: COUNT(DISTINCT column).
SELECT COUNT(DISTINCT device) AS unique_devices FROM listens;

-- Запрос 9. GROUP BY с HAVING (Таблица listens).
-- Вопрос по данным: Какие пользователи (user_id) прослушали в сумме более 1000 секунд?
-- Демонстрирует: GROUP BY, SUM и HAVING.
SELECT user_id, SUM(seconds_played) AS total_seconds 
FROM listens 
GROUP BY user_id 
HAVING SUM(seconds_played) > 1000;

-- Запрос 10. Сложный GROUP BY (Таблица artists).
-- Вопрос по данным: В каких странах средний год основания артистов больше 1990, и как они отсортированы по этому году?
-- Демонстрирует: GROUP BY, AVG и ORDER BY.
SELECT country, AVG(formed_year) AS avg_formed_year 
FROM artists 
WHERE formed_year IS NOT NULL 
GROUP BY country 
HAVING AVG(formed_year) > 1990 
ORDER BY avg_formed_year DESC;