-- Запрос 1. WHERE с OR.
-- Вопрос по данным: Какие треки являются нецензурными (explicit = TRUE) ИЛИ имеют более 1 000 000 прослушиваний?
-- Демонстрирует: Использование оператора WHERE с логическим OR.
SELECT title, explicit, play_count 
FROM tracks 
WHERE explicit = TRUE OR play_count > 1000000;

-- Запрос 2. IN.
-- Вопрос по данным: Какие треки находятся на 1, 2 или 3 позиции в своих альбомах?
-- Демонстрирует: Использование оператора IN для проверки списка значений.
SELECT title, duration_sec, track_number 
FROM tracks 
WHERE track_number IN (1, 2, 3);

-- Запрос 3. BETWEEN и вычисляемый столбец.
-- Вопрос по данным: Какие треки длятся от 200 до 300 секунд, и какова их длительность в минутах?
-- Демонстрирует: Использование BETWEEN для диапазона и создание вычисляемого столбца (перевод в минуты).
SELECT title, duration_sec, ROUND(duration_sec / 60.0, 2) AS duration_minutes 
FROM tracks 
WHERE duration_sec BETWEEN 200 AND 300;

-- Запрос 4. LIKE.
-- Вопрос по данным: В названии каких треков встречается слово "Love"?
-- Демонстрирует: Использование оператора LIKE с шаблоном поиска (%Love%).
SELECT title, duration_sec 
FROM tracks 
WHERE title LIKE '%Love%';

-- Запрос 5. ORDER BY и IS NULL.
-- Вопрос по данным: Какие треки не имеют номера в альбоме (track_number пустой), и как они отсортированы по количеству прослушиваний (от популярных к менее популярным)?
-- Демонстрирует: Использование IS NULL для поиска пустых значений и ORDER BY DESC для сортировки.
SELECT title, play_count, track_number 
FROM tracks 
WHERE track_number IS NULL 
ORDER BY play_count DESC;

-- Запрос 6. WHERE с AND: Найти пользователей из России, которые зарегистрировались после 1 июня 2023 года.
-- (Демонстрирует использование WHERE с AND)
SELECT username, country, registration_date 
FROM users 
WHERE country = 'Россия' AND registration_date > '2023-06-01';

-- Запрос 7. IN: Вывести имена и email пользователей, у которых ID подписки равен 1, 2 или 3.
-- (Демонстрирует использование IN)
SELECT username, email, subscription_id 
FROM users 
WHERE subscription_id IN (1, 2, 3);

-- Запрос 8. BETWEEN и вычисляемый столбец: Найти пользователей, родившихся в 90-е годы (1990-1999), и вычислить их возраст на текущий момент.
-- (Демонстрирует BETWEEN и вычисляемый столбец с датой)
SELECT username, birth_date, EXTRACT(YEAR FROM AGE(birth_date)) AS age 
FROM users 
WHERE EXTRACT(YEAR FROM birth_date) BETWEEN 1990 AND 1999;

-- Запрос 9. LIKE: Найти всех пользователей, в email которых используется домен "example.com".
-- (Демонстрирует использование LIKE)
SELECT username, email 
FROM users 
WHERE email LIKE '%@example.com';

-- Запрос 10. ORDER BY и IS NULL: Вывести пользователей, у которых не указана дата рождения (birth_date IS NULL), отсортированных по дате регистрации (от новых к старым).
-- (Демонстрирует ORDER BY и IS NULL)
SELECT username, birth_date, registration_date 
FROM users 
WHERE birth_date IS NULL 
ORDER BY registration_date DESC;

