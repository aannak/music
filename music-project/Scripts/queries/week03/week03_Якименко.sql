-- Запрос 1. WHERE с OR (Таблица listens).
-- Вопрос по данным: Какие прослушивания были сделаны с устройства "iPhone" ИЛИ длились более 200 секунд?
-- Демонстрирует: WHERE с OR.
SELECT listen_id, device, seconds_played 
FROM listens 
WHERE device = 'iPhone' OR seconds_played > 200;

-- Запрос 2. IN (Таблица playlist_tracks).
-- Вопрос по данным: Какие треки добавлены в плейлисты на позиции 1, 2 или 3?
-- Демонстрирует: Использование IN.
SELECT playlist_id, track_id, position 
FROM playlist_tracks 
WHERE position IN (1, 2, 3);

-- Запрос 3. BETWEEN и вычисляемый столбец (Таблица listens).
-- Вопрос по данным: Какие прослушивания длились от 60 до 180 секунд, и какова их длительность в минутах?
-- Демонстрирует: BETWEEN и вычисляемый столбец.
SELECT listen_id, seconds_played, ROUND(seconds_played / 60.0, 2) AS minutes_played 
FROM listens 
WHERE seconds_played BETWEEN 60 AND 180;

-- Запрос 4. LIKE (Таблица listens).
-- Вопрос по данным: Какие прослушивания были сделаны с устройств, название которых начинается на "Mac"?
-- Демонстрирует: Использование LIKE.
SELECT listen_id, device 
FROM listens 
WHERE device LIKE 'Mac%';

-- Запрос 5. ORDER BY и IS NULL (Таблица listens).
-- Вопрос по данным: Какие прослушивания не имеют указанного устройства (device IS NULL), отсортированные по времени прослушивания (от новых к старым)?
-- Демонстрирует: ORDER BY и IS NULL.
SELECT listen_id, device, listened_at 
FROM listens 
WHERE device IS NULL 
ORDER BY listened_at DESC;

-- Запрос 6. WHERE с AND (Таблица listens).
-- Вопрос по данным: Какие прослушивания были сделаны пользователем с ID 2 с устройства "Web"?
-- Демонстрирует: WHERE с AND.
SELECT listen_id, user_id, device 
FROM listens 
WHERE user_id = 2 AND device = 'Web';

-- Запрос 7. IN (Таблица listens).
-- Вопрос по данным: Какие прослушивания были сделаны с устройств "Android" или "Windows"?
-- Демонстрирует: Использование IN.
SELECT listen_id, device 
FROM listens 
WHERE device IN ('Android', 'Windows');

-- Запрос 8. BETWEEN и вычисляемый столбец (Таблица playlist_tracks).
-- Вопрос по данным: Какие треки были добавлены в плейлисты в период с 1 по 5 января 2024 года, и сколько дней они там находятся?
-- Демонстрирует: BETWEEN и вычисляемый столбец.
SELECT playlist_id, track_id, added_at, (CURRENT_DATE - added_at::date) AS days_in_playlist 
FROM playlist_tracks 
WHERE added_at BETWEEN '2024-01-01' AND '2024-01-05';

-- Запрос 9. LIKE (Таблица listens).
-- Вопрос по данным: Какие прослушивания были сделаны с устройств, название которых заканчивается на "oid" (Android)?
-- Демонстрирует: Использование LIKE.
SELECT listen_id, device 
FROM listens 
WHERE device LIKE '%oid';

-- Запрос 10. ORDER BY (Таблица listens).
-- Вопрос по данным: Вывести все прослушивания, отсортированные по количеству прослушанных секунд (от наибольшего к наименьшему).
-- Демонстрирует: Использование ORDER BY DESC.
SELECT listen_id, seconds_played 
FROM listens 
ORDER BY seconds_played DESC;