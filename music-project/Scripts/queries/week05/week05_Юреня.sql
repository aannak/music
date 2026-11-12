-- Запрос 1. INNER JOIN.
-- Вопрос по данным: Вывести ID прослушивания и название трека, который прослушивали.
-- Демонстрирует: INNER JOIN между listens и tracks.
SELECT l.listen_id, t.title AS track_title
FROM listens l
INNER JOIN tracks t ON l.track_id = t.track_id;

-- Запрос 2. LEFT JOIN.
-- Вопрос по данным: Вывести все треки и их прослушивания. Если трек ни разу не слушали, вывести NULL.
-- Демонстрирует: LEFT JOIN между tracks и listens.
SELECT t.title AS track_title, l.listen_id
FROM tracks t
LEFT JOIN listens l ON t.track_id = l.track_id;

-- Запрос 3. Соединение 3 таблиц.
-- Вопрос по данным: Вывести имя пользователя, название прослушанного трека и устройство, с которого слушали.
-- Демонстрирует: Соединение users -> listens -> tracks.
SELECT u.username, t.title AS track_title, l.device
FROM listens l
INNER JOIN users u ON l.user_id = u.user_id
INNER JOIN tracks t ON l.track_id = t.track_id;

-- Запрос 4. RIGHT JOIN.
-- Вопрос по данным: Вывести все треки и информацию о прослушиваниях, даже если у трека нет прослушиваний (через RIGHT JOIN).
-- Демонстрирует: RIGHT JOIN между listens и tracks.
SELECT t.title AS track_title, l.listen_id
FROM listens l
RIGHT JOIN tracks t ON l.track_id = t.track_id;

-- Запрос 5. UNION.
-- Вопрос по данным: Вывести единый список названий треков и имен артистов в одном столбце.
-- Демонстрирует: Операцию UNION.
SELECT title AS name, 'Track' AS type FROM tracks
UNION
SELECT name, 'Artist' AS type FROM artists;