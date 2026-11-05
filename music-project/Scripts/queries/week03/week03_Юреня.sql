-- Запрос 1. WHERE с OR (Таблица playlists).
-- Вопрос по данным: Какие плейлисты являются публичными ИЛИ были созданы в 2024 году?
-- Демонстрирует: WHERE с OR.
SELECT title, is_public, created_at 
FROM playlists 
WHERE is_public = TRUE OR created_at >= '2024-01-01';

-- Запрос 2. IN (Таблица subscriptions).
-- Вопрос по данным: Какие подписки стоят 199 или 299 рублей?
-- Демонстрирует: Использование IN.
SELECT type, price, duration_months 
FROM subscriptions 
WHERE price IN (199, 299);

-- Запрос 3. BETWEEN и вычисляемый столбец (Таблица subscriptions).
-- Вопрос по данным: Какие подписки длятся от 1 до 3 месяцев, и какова их общая стоимость за год (цена * 12)?
-- Демонстрирует: BETWEEN и вычисляемый столбец.
SELECT type, duration_months, (price * 12) AS yearly_price 
FROM subscriptions 
WHERE duration_months BETWEEN 1 AND 3;

-- Запрос 4. LIKE (Таблица playlists).
-- Вопрос по данным: В названии каких плейлистов есть слово "Хиты"?
-- Демонстрирует: Использование LIKE.
SELECT title, created_at 
FROM playlists 
WHERE title LIKE '%Хиты%';

-- Запрос 5. ORDER BY и IS NULL (Таблица playlists).
-- Вопрос по данным: Какие плейлисты не имеют статуса публичности (is_public IS NULL), отсортированные по дате создания от новых к старым?
-- Демонстрирует: ORDER BY и IS NULL.
SELECT title, is_public, created_at 
FROM playlists 
WHERE is_public IS NULL 
ORDER BY created_at DESC;

-- Запрос 6. WHERE с AND (Таблица playlists).
-- Вопрос по данным: Какие приватные плейлисты (is_public = FALSE) принадлежат пользователю с ID 5?
-- Демонстрирует: WHERE с AND.
SELECT title, user_id 
FROM playlists 
WHERE is_public = FALSE AND user_id = 5;

-- Запрос 7. IN (Таблица playlists).
-- Вопрос по данным: Какие плейлисты принадлежат пользователям с ID 1, 2 или 3?
-- Демонстрирует: Использование IN.
SELECT title, user_id 
FROM playlists 
WHERE user_id IN (1, 2, 3);

-- Запрос 8. BETWEEN и вычисляемый столбец (Таблица playlists).
-- Вопрос по данным: Какие плейлисты были созданы в первой половине 2024 года (с января по июнь), и сколько дней прошло с их создания (приблизительно)?
-- Демонстрирует: BETWEEN и вычисляемый столбец.
SELECT title, created_at, (CURRENT_DATE - created_at) AS days_passed 
FROM playlists 
WHERE created_at BETWEEN '2024-01-01' AND '2024-06-30';

-- Запрос 9. LIKE (Таблица subscriptions).
-- Вопрос по данным: Какие типы подписок содержат слово "Premium"?
-- Демонстрирует: Использование LIKE.
SELECT type, price 
FROM subscriptions 
WHERE type LIKE '%Premium%';

-- Запрос 10. ORDER BY (Таблица subscriptions).
-- Вопрос по данным: Вывести все подписки, отсортированные по цене от самой дорогой к самой дешевой.
-- Демонстрирует: Использование ORDER BY DESC.
SELECT type, price 
FROM subscriptions 
ORDER BY price DESC;