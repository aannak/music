-- Показывает общее количество треков в таблице
SELECT COUNT(*) AS total_tracks FROM tracks;

-- Показывает первые 5 треков, чтобы визуально убедиться, что данные есть
SELECT * FROM tracks LIMIT 5;