-- 1. Подзапрос с IN: альбомы исполнителей из США
-- (показывает альбомы, созданные американскими артистами)
SELECT album_id, title, release_date, artist_id
FROM albums
WHERE artist_id IN (
    SELECT artist_id
    FROM artists
    WHERE country = 'США'
)
ORDER BY release_date DESC;

-- 2. NOT EXISTS: исполнители, у которых нет ни одного альбома
SELECT a.artist_id, a.name, a.country
FROM artists a
WHERE NOT EXISTS (
    SELECT 1
    FROM albums al
    WHERE al.artist_id = a.artist_id
)
ORDER BY a.name;

-- 3. Подзапрос в FROM: исполнители и количество их альбомов (только те, у кого >= 2 альбомов)
SELECT stats.artist_id, stats.name, stats.albums_count
FROM (
    SELECT a.artist_id, a.name, COUNT(al.album_id) AS albums_count
    FROM artists a
    JOIN albums al ON a.artist_id = al.artist_id
    GROUP BY a.artist_id, a.name
) AS stats
WHERE stats.albums_count >= 2
ORDER BY stats.albums_count DESC;

-- 4. CTE (WITH): альбомы, выпущенные позже среднего года выпуска по всем альбомам
WITH avg_year AS (
    SELECT AVG(EXTRACT(YEAR FROM release_date)) AS avg_release_year
    FROM albums
)
SELECT al.album_id, al.title, al.release_date, ROUND(avg_year.avg_release_year, 0) AS avg_all_year
FROM albums al, avg_year
WHERE EXTRACT(YEAR FROM al.release_date) > avg_year.avg_release_year
ORDER BY al.release_date DESC;

-- 5. Аналитический: исполнители, у которых средняя длительность треков в альбомах выше средней по всем исполнителям
-- (сочетает JOIN, CTE и агрегацию)
WITH artist_avg AS (
    SELECT a.artist_id, a.name, a.country,
           COUNT(t.track_id) AS total_tracks,
           AVG(t.duration_sec) AS avg_duration
    FROM artists a
    JOIN albums al ON a.artist_id = al.artist_id
    JOIN tracks t ON al.album_id = t.album_id
    GROUP BY a.artist_id, a.name, a.country
)
SELECT artist_id, name, country, total_tracks, ROUND(avg_duration, 1) AS avg_duration
FROM artist_avg
WHERE avg_duration > (
    SELECT AVG(avg_duration)
    FROM artist_avg
)
ORDER BY avg_duration DESC;