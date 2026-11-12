-- Запрос 1. INNER JOIN.
-- Вопрос по данным: Вывести имена пользователей и типы их подписок.
-- Демонстрирует: INNER JOIN между users и subscriptions.
SELECT u.username, s.type AS subscription_type
FROM users u
INNER JOIN subscriptions s ON u.subscription_id = s.subscription_id;

-- Запрос 2. LEFT JOIN.
-- Вопрос по данным: Вывести всех пользователей и их плейлисты. Если у пользователя нет плейлистов, вывести NULL.
-- Демонстрирует: LEFT JOIN между users и playlists.
SELECT u.username, p.title AS playlist_title
FROM users u
LEFT JOIN playlists p ON u.user_id = p.user_id;

-- Запрос 3. Соединение 3 таблиц.
-- Вопрос по данным: Вывести имя пользователя, название его плейлиста и название трека, который добавлен в этот плейлист.
-- Демонстрирует: Соединение users -> playlists -> playlist_tracks -> tracks.
SELECT u.username, p.title AS playlist_title, t.title AS track_title
FROM users u
JOIN playlists p ON u.user_id = p.user_id
JOIN playlist_tracks pt ON p.playlist_id = pt.playlist_id
JOIN tracks t ON pt.track_id = t.track_id;

-- Запрос 4. FULL JOIN.
-- Вопрос по данным: Вывести всех пользователей и все подписки, даже если пользователь без подписки или подписка не используется.
-- Демонстрирует: FULL JOIN между users и subscriptions.
SELECT u.username, s.type AS subscription_type
FROM users u
FULL JOIN subscriptions s ON u.subscription_id = s.subscription_id;

-- Запрос 5. EXCEPT.
-- Вопрос по данным: Вывести ID пользователей, которые есть в таблице users, но не создали ни одного плейлиста.
-- Демонстрирует: Операцию EXCEPT (разность множеств).
SELECT user_id FROM users
EXCEPT
SELECT user_id FROM playlists;