-- Запрос 1. COUNT (Таблица tracks).
-- Вопрос по данным: Сколько всего треков в базе?
-- Демонстрирует: Агрегатная функция COUNT.
SELECT COUNT(*) AS total_tracks FROM tracks;

-- Запрос 2. SUM и AVG (Таблица tracks).
-- Вопрос по данным: Какова общая и средняя длительность всех треков в секундах?
-- Демонстрирует: Агрегатные функции SUM и AVG.
SELECT SUM(duration_sec) AS total_duration, AVG(duration_sec) AS avg_duration FROM tracks;

-- Запрос 3. MIN и MAX (Таблица tracks).
-- Вопрос по данным: Какой трек самый короткий и самый длинный по длительности?
-- Демонстрирует: Агрегатные функции MIN и MAX.
SELECT MIN(duration_sec) AS min_duration, MAX(duration_sec) AS max_duration FROM tracks;

-- Запрос 4. GROUP BY по одному столбцу (Таблица albums).
-- Вопрос по данным: Сколько альбомов выпустил каждый артист (artist_id)?
-- Демонстрирует: GROUP BY по одному столбцу и COUNT.
SELECT artist_id, COUNT(*) AS album_count 
FROM albums 
GROUP BY artist_id;

-- Запрос 5. GROUP BY по двум столбцам (Таблица albums).
-- Вопрос по данным: Сколько альбомов каждого типа (Studio, Live) выпустил каждый артист?
-- Демонстрирует: GROUP BY по двум столбцам.
SELECT artist_id, album_type, COUNT(*) AS count_albums 
FROM albums 
GROUP BY artist_id, album_type;

-- Запрос 6. HAVING (Таблица tracks).
-- Вопрос по данным: Какие артисты (по album_id) имеют суммарное количество прослушиваний треков больше 5 000 000?
-- Демонстрирует: GROUP BY и HAVING.
SELECT album_id, SUM(play_count) AS total_plays 
FROM tracks 
GROUP BY album_id 
HAVING SUM(play_count) > 5000000;

-- Запрос 7. WHERE + GROUP BY + ORDER BY (Таблица tracks).
-- Вопрос по данным: Какие альбомы имеют среднюю длительность трека более 200 секунд, и как они отсортированы по этой средней длительности (от большей к меньшей)?
-- Демонстрирует: Комбинацию WHERE, GROUP BY, AVG и ORDER BY.
SELECT album_id, AVG(duration_sec) AS avg_duration 
FROM tracks 
WHERE duration_sec > 100 
GROUP BY album_id 
ORDER BY avg_duration DESC;

-- Запрос 8. COUNT с DISTINCT (Таблица albums).
-- Вопрос по данным: Сколько уникальных артистов имеют хотя бы один альбом в базе?
-- Демонстрирует: COUNT(DISTINCT column).
SELECT COUNT(DISTINCT artist_id) AS unique_artists FROM albums;

-- Запрос 9. GROUP BY с вычисляемым столбцом (Таблица tracks).
-- Вопрос по данным: Каково общее количество прослушиваний для каждого типа трека (explicit = TRUE / FALSE)?
-- Демонстрирует: GROUP BY и SUM с вычислением.
SELECT explicit, SUM(play_count) AS total_plays 
FROM tracks 
GROUP BY explicit;

-- Запрос 10. Сложный HAVING (Таблица tracks).
-- Вопрос по данным: Какие альбомы имеют более 3 треков, и их среднее количество прослушиваний больше 1 000 000?
-- Демонстрирует: GROUP BY, HAVING с двумя условиями (AND).
SELECT album_id, COUNT(*) AS track_count, AVG(play_count) AS avg_plays 
FROM tracks 
GROUP BY album_id 
HAVING COUNT(*) > 3 AND AVG(play_count) > 1000000;