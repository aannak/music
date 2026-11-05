-- Запрос 1. COUNT (Таблица playlists).
-- Вопрос по данным: Сколько всего плейлистов создано в базе?
-- Демонстрирует: Агрегатная функция COUNT.
SELECT COUNT(*) AS total_playlists FROM playlists;

-- Запрос 2. MIN и MAX (Таблица playlists).
-- Вопрос по данным: Какая самая ранняя и самая поздняя дата создания плейлиста?
-- Демонстрирует: Агрегатные функции MIN и MAX с датами.
SELECT MIN(created_at) AS first_created, MAX(created_at) AS last_created FROM playlists;

-- Запрос 3. GROUP BY по одному столбцу (Таблица playlists).
-- Вопрос по данным: Сколько плейлистов создал каждый пользователь (user_id)?
-- Демонстрирует: GROUP BY по одному столбцу.
SELECT user_id, COUNT(*) AS playlist_count 
FROM playlists 
GROUP BY user_id;

-- Запрос 4. GROUP BY по двум столбцам (Таблица playlists).
-- Вопрос по данным: Сколько публичных и приватных плейлистов создал каждый пользователь?
-- Демонстрирует: GROUP BY по двум столбцам.
SELECT user_id, is_public, COUNT(*) AS count_playlists 
FROM playlists 
GROUP BY user_id, is_public;

-- Запрос 5. HAVING (Таблица playlists).
-- Вопрос по данным: Какие пользователи создали более 2 плейлистов?
-- Демонстрирует: GROUP BY и HAVING.
SELECT user_id, COUNT(*) AS playlist_count 
FROM playlists 
GROUP BY user_id 
HAVING COUNT(*) > 2;

-- Запрос 6. WHERE + GROUP BY + ORDER BY (Таблица playlists).
-- Вопрос по данным: Сколько публичных плейлистов (is_public = TRUE) создал каждый пользователь, и как они отсортированы по количеству (от большего к меньшему)?
-- Демонстрирует: WHERE, GROUP BY и ORDER BY.
SELECT user_id, COUNT(*) AS public_playlists 
FROM playlists 
WHERE is_public = TRUE 
GROUP BY user_id 
ORDER BY public_playlists DESC;

-- Запрос 7. COUNT с DISTINCT (Таблица playlist_tracks).
-- Вопрос по данным: Сколько уникальных треков (track_id) добавлено во все плейлисты?
-- Демонстрирует: COUNT(DISTINCT column).
SELECT COUNT(DISTINCT track_id) AS unique_tracks_in_playlists FROM playlist_tracks;

-- Запрос 8. AVG (Таблица playlist_tracks).
-- Вопрос по данным: Какая средняя позиция (position) у треков в плейлистах?
-- Демонстрирует: Агрегатная функция AVG.
SELECT AVG(position) AS avg_position FROM playlist_tracks;

-- Запрос 9. GROUP BY с HAVING (Таблица playlist_tracks).
-- Вопрос по данным: В каких плейлистах (playlist_id) больше 3 треков?
-- Демонстрирует: GROUP BY и HAVING.
SELECT playlist_id, COUNT(*) AS track_count 
FROM playlist_tracks 
GROUP BY playlist_id 
HAVING COUNT(*) > 3;

-- Запрос 10. Сложный GROUP BY (Таблица playlist_tracks).
-- Вопрос по данным: Какие плейлисты имеют суммарную позицию всех треков больше 10, и как они отсортированы по этой сумме?
-- Демонстрирует: GROUP BY, SUM и ORDER BY.
SELECT playlist_id, SUM(position) AS total_position 
FROM playlist_tracks 
GROUP BY playlist_id 
HAVING SUM(position) > 10 
ORDER BY total_position DESC;