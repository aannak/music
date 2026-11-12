-- Запрос 1. INNER JOIN.
-- Вопрос по данным: Вывести ID плейлиста и названия треков, которые в него добавлены.
-- Демонстрирует: INNER JOIN между playlist_tracks и tracks.
SELECT pt.playlist_id, t.title AS track_title
FROM playlist_tracks pt
INNER JOIN tracks t ON pt.track_id = t.track_id;

-- Запрос 2. LEFT JOIN.
-- Вопрос по данным: Вывести все плейлисты и треки в них. Если плейлист пуст, вывести NULL.
-- Демонстрирует: LEFT JOIN между playlists и playlist_tracks.
SELECT p.title AS playlist_title, t.title AS track_title
FROM playlists p
LEFT JOIN playlist_tracks pt ON p.playlist_id = pt.playlist_id
LEFT JOIN tracks t ON pt.track_id = t.track_id;

-- Запрос 3. Соединение 3 таблиц.
-- Вопрос по данным: Вывести название плейлиста, имя пользователя (владельца) и название трека в этом плейлисте.
-- Демонстрирует: Соединение playlists -> users -> playlist_tracks -> tracks.
SELECT p.title AS playlist_title, u.username, t.title AS track_title
FROM playlists p
INNER JOIN users u ON p.user_id = u.user_id
INNER JOIN playlist_tracks pt ON p.playlist_id = pt.playlist_id
INNER JOIN tracks t ON pt.track_id = t.track_id;

-- Запрос 4. FULL JOIN.
-- Вопрос по данным: Вывести все треки и все плейлисты, даже если трек не в плейлисте или плейлист пуст.
-- Демонстрирует: FULL JOIN между tracks и playlist_tracks.
SELECT t.title AS track_title, pt.playlist_id
FROM tracks t
FULL JOIN playlist_tracks pt ON t.track_id = pt.track_id;

-- Запрос 5. INTERSECT.
-- Вопрос по данным: Вывести ID треков, которые есть и в таблице tracks, и в таблице playlist_tracks (то есть добавлены в плейлисты).
-- Демонстрирует: Операцию INTERSECT (пересечение множеств).
SELECT track_id FROM tracks
INTERSECT
SELECT track_id FROM playlist_tracks;