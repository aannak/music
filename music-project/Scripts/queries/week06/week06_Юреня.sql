-- 1. Пользователи, у которых оформлена платная подписка

SELECT
    user_id,
    username,
    country,
    subscription_id
FROM users
WHERE subscription_id IN (
    SELECT subscription_id
    FROM subscriptions
    WHERE price > 0
)
ORDER BY username;

-- 2. Исполнители, у которых нет альбомов

SELECT
    a.artist_id,
    a.name,
    a.country
FROM artists a
WHERE NOT EXISTS (
    SELECT 1
    FROM albums al
    WHERE al.artist_id = a.artist_id
)
ORDER BY a.name;

-- 3. Пользователи с двумя и более прослушиваниями

SELECT
    listening_stats.user_id,
    listening_stats.username,
    listening_stats.total_listens,
    listening_stats.total_seconds
FROM (
    SELECT
        u.user_id,
        u.username,
        COUNT(l.listen_id) AS total_listens,
        SUM(l.seconds_played) AS total_seconds
    FROM users u
    JOIN listens l ON u.user_id = l.user_id
    GROUP BY u.user_id, u.username
) AS listening_stats
WHERE listening_stats.total_listens >= 2
ORDER BY listening_stats.total_listens DESC;

-- 4. Плейлисты, содержащие более двух треков

WITH playlist_stats AS (
    SELECT
        p.playlist_id,
        p.title,
        p.user_id,
        COUNT(pt.track_id) AS tracks_count
    FROM playlists p
    LEFT JOIN playlist_tracks pt
        ON p.playlist_id = pt.playlist_id
    GROUP BY p.playlist_id, p.title, p.user_id
)

SELECT
    playlist_id,
    title,
    user_id,
    tracks_count
FROM playlist_stats
WHERE tracks_count > 2
ORDER BY tracks_count DESC;

-- 5. Исполнители с количеством прослушиваний выше среднего

WITH artist_stats AS (
    SELECT
        a.artist_id,
        a.name,
        a.country,
        COUNT(DISTINCT l.listen_id) AS total_listens,
        COALESCE(SUM(l.seconds_played), 0) AS total_seconds
    FROM artists a
    LEFT JOIN albums al
        ON a.artist_id = al.artist_id
    LEFT JOIN tracks t
        ON al.album_id = t.album_id
    LEFT JOIN listens l
        ON t.track_id = l.track_id
    GROUP BY a.artist_id, a.name, a.country
)

SELECT
    artist_id,
    name,
    country,
    total_listens,
    total_seconds
FROM artist_stats
WHERE total_listens > (
    SELECT AVG(total_listens)
    FROM artist_stats
)
ORDER BY total_listens DESC;
