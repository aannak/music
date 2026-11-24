-- 1. Подзапрос с IN: треки, которые есть хотя бы в одном плейлисте
-- (показывает треки, добавленные в плейлисты, и их количество прослушиваний)
SELECT t.track_id, t.title, t.play_count
FROM tracks t
WHERE t.track_id IN (
    SELECT pt.track_id
    FROM playlist_tracks pt
)
ORDER BY t.play_count DESC;

-- 2. NOT EXISTS: плейлисты, в которых нет ни одного трека
SELECT p.playlist_id, p.title, p.user_id
FROM playlists p
WHERE NOT EXISTS (
    SELECT 1
    FROM playlist_tracks pt
    WHERE pt.playlist_id = p.playlist_id
)
ORDER BY p.title;

-- 3. Подзапрос в FROM: треки и количество плейлистов, в которых они есть (только те, что в >= 2 плейлистах)
SELECT stats.track_id, stats.title, stats.playlists_count
FROM (
    SELECT t.track_id, t.title, COUNT(pt.playlist_id) AS playlists_count
    FROM tracks t
    JOIN playlist_tracks pt ON t.track_id = pt.track_id
    GROUP BY t.track_id, t.title
) AS stats
WHERE stats.playlists_count >= 2
ORDER BY stats.playlists_count DESC;

-- 4. CTE (WITH): прослушивания, длительность которых выше средней по всем прослушиваниям
WITH avg_seconds AS (
    SELECT AVG(seconds_played) AS avg_sec
    FROM listens
)
SELECT l.listen_id, l.user_id, l.track_id, l.seconds_played,
       ROUND(avg_seconds.avg_sec, 1) AS avg_all
FROM listens l, avg_seconds
WHERE l.seconds_played > avg_seconds.avg_sec
ORDER BY l.seconds_played DESC;

-- 5. Аналитический: плейлисты, у которых суммарная длительность треков выше средней по плейлистам
-- (сочетает JOIN, CTE и агрегацию)
WITH playlist_duration AS (
    SELECT p.playlist_id, p.title, p.user_id,
           COUNT(pt.track_id) AS tracks_count,
           SUM(t.duration_sec) AS total_duration
    FROM playlists p
    JOIN playlist_tracks pt ON p.playlist_id = pt.playlist_id
    JOIN tracks t ON pt.track_id = t.track_id
    GROUP BY p.playlist_id, p.title, p.user_id
)
SELECT playlist_id, title, user_id, tracks_count, total_duration
FROM playlist_duration
WHERE total_duration > (
    SELECT AVG(total_duration)
    FROM playlist_duration
)
ORDER BY total_duration DESC;