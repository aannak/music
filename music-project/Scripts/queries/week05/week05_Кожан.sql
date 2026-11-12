-- Запрос 1. INNER JOIN (2 таблицы).
-- Вопрос по данным: Вывести названия треков и названия их альбомов.
-- Демонстрирует: INNER JOIN между таблицами tracks и albums.
SELECT t.title AS track_title, a.title AS album_title
FROM tracks t
INNER JOIN albums a ON t.album_id = a.album_id;

-- Запрос 2. LEFT JOIN (2 таблицы).
-- Вопрос по данным: Вывести всех артистов и их альбомы. Если у артиста нет альбомов, вывести NULL.
-- Демонстрирует: LEFT JOIN между artists и albums.
SELECT ar.name AS artist_name, al.title AS album_title
FROM artists ar
LEFT JOIN albums al ON ar.artist_id = al.artist_id;

-- Запрос 3. Соединение 3 и более таблиц.
-- Вопрос по данным: Вывести название трека, название альбома и имя артиста для всех треков.
-- Демонстрирует: Соединение tracks -> albums -> artists.
SELECT t.title AS track_title, al.title AS album_title, ar.name AS artist_name
FROM tracks t
INNER JOIN albums al ON t.album_id = al.album_id
INNER JOIN artists ar ON al.artist_id = ar.artist_id;

-- Запрос 4. RIGHT JOIN.
-- Вопрос по данным: Вывести всех артистов и их треки (через альбомы). Если у артиста нет треков, он все равно попадет в список.
-- Демонстрирует: RIGHT JOIN (или FULL JOIN) для показа всех артистов.
SELECT ar.name AS artist_name, t.title AS track_title
FROM tracks t
RIGHT JOIN albums al ON t.album_id = al.album_id
RIGHT JOIN artists ar ON al.artist_id = ar.artist_id;

-- Запрос 5. UNION.
-- Вопрос по данным: Вывести единый список названий всех альбомов и всех плейлистов.
-- Демонстрирует: Операцию UNION (объединение двух выборок).
SELECT title, 'Album' AS source_type FROM albums
UNION
SELECT title, 'Playlist' AS source_type FROM playlists;