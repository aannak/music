-- 1. Подзапрос с IN: треки, которые слушал хотя бы один пользователь из США
-- (показывает треки, популярные среди американских пользователей)
SELECT track_id, title, play_count
FROM tracks
WHERE track_id IN (
    SELECT l.track_id
    FROM listens l
    JOIN users u ON l.user_id = u.user_id
    WHERE u.country = 'США'
)
ORDER BY play_count DESC;

-- 2. NOT EXISTS: пользователи, которые не прослушали ни одного трека
SELECT u.user_id, u.username, u.country
FROM users u
WHERE NOT EXISTS (
    SELECT 1
    FROM listens l
    WHERE l.user_id = u.user_id
)
ORDER BY u.username;

-- 3. Подзапрос в FROM: пользователи и суммарное время прослушивания (только те, у кого >= 2 прослушиваний)
SELECT stats.user_id, stats.username, stats.total_listens, stats.total_seconds
FROM (
    SELECT u.user_id, u.username,
           COUNT(l.listen_id) AS total_listens,
           SUM(l.seconds_played) AS total_seconds
    FROM users u
    JOIN listens l ON u.user_id = l.user_id
    GROUP BY u.user_id, u.username
) AS stats
WHERE stats.total_listens >= 2
ORDER BY stats.total_seconds DESC;

-- 4. CTE (WITH): треки с длительностью выше средней по всем трекам
WITH avg_duration AS (
    SELECT AVG(duration_sec) AS avg_dur
    FROM tracks
)
SELECT t.track_id, t.title, t.duration_sec, ROUND(avg_duration.avg_dur, 1) AS avg_all
FROM tracks t, avg_duration
WHERE t.duration_sec > avg_duration.avg_dur
ORDER BY t.duration_sec DESC;

-- 5. Аналитический: пользователи, у которых суммарное время прослушивания выше среднего по пользователям
-- (сочетает JOIN, CTE и агрегацию)
WITH user_totals AS (
    SELECT u.user_id, u.username, u.country,
           COUNT(l.listen_id) AS total_listens,
           SUM(l.seconds_played) AS total_seconds
    FROM users u
    JOIN listens l ON u.user_id = l.user_id
    GROUP BY u.user_id, u.username, u.country
)
SELECT user_id, username, country, total_listens, total_seconds
FROM user_totals
WHERE total_seconds > (
    SELECT AVG(total_seconds)
    FROM user_totals
)
ORDER BY total_seconds DESC;