-- Запрос 1. COUNT (Таблица users).
-- Вопрос по данным: Сколько всего пользователей зарегистрировано в базе?
-- Демонстрирует: Агрегатная функция COUNT.
SELECT COUNT(*) AS total_users FROM users;

-- Запрос 2. MIN и MAX (Таблица users).
-- Вопрос по данным: Какая самая ранняя и самая поздняя дата регистрации пользователя?
-- Демонстрирует: Агрегатные функции MIN и MAX с датами.
SELECT MIN(registration_date) AS first_registration, MAX(registration_date) AS last_registration FROM users;

-- Запрос 3. GROUP BY по одному столбцу (Таблица users).
-- Вопрос по данным: Сколько пользователей зарегистрировано в каждой стране?
-- Демонстрирует: GROUP BY по одному столбцу.
SELECT country, COUNT(*) AS user_count 
FROM users 
GROUP BY country;

-- Запрос 4. GROUP BY по двум столбцам (Таблица users).
-- Вопрос по данным: Сколько пользователей в каждой стране имеют определенную подписку (subscription_id)?
-- Демонстрирует: GROUP BY по двум столбцам.
SELECT country, subscription_id, COUNT(*) AS count_users 
FROM users 
GROUP BY country, subscription_id;

-- Запрос 5. HAVING (Таблица users).
-- Вопрос по данным: Какие страны имеют более 3 зарегистрированных пользователей?
-- Демонстрирует: GROUP BY и HAVING.
SELECT country, COUNT(*) AS user_count 
FROM users 
GROUP BY country 
HAVING COUNT(*) > 3;

-- Запрос 6. WHERE + GROUP BY + ORDER BY (Таблица users).
-- Вопрос по данным: Какие страны имеют средний возраст пользователей (вычисленный по дате рождения) более 25 лет, и как они отсортированы по этому возрасту?
-- Демонстрирует: WHERE, GROUP BY, вычисление возраста и ORDER BY.
SELECT country, AVG(EXTRACT(YEAR FROM AGE(birth_date))) AS avg_age 
FROM users 
WHERE birth_date IS NOT NULL 
GROUP BY country 
ORDER BY avg_age DESC;

-- Запрос 7. SUM и AVG (Таблица subscriptions).
-- Вопрос по данным: Какова общая стоимость всех подписок в базе и средняя цена одной подписки?
-- Демонстрирует: Агрегатные функции SUM и AVG.
SELECT SUM(price) AS total_price, AVG(price) AS avg_price FROM subscriptions;

-- Запрос 8. COUNT с DISTINCT (Таблица users).
-- Вопрос по данным: Сколько уникальных типов подписок используется пользователями?
-- Демонстрирует: COUNT(DISTINCT column).
SELECT COUNT(DISTINCT subscription_id) AS unique_subscriptions FROM users;

-- Запрос 9. GROUP BY с HAVING (Таблица subscriptions).
-- Вопрос по данным: Какие типы подписок имеют суммарную стоимость (price * duration_months) больше 500?
-- Демонстрирует: GROUP BY с вычисляемым столбцом и HAVING.
SELECT type, SUM(price * duration_months) AS total_revenue 
FROM subscriptions 
GROUP BY type 
HAVING SUM(price * duration_months) > 500;

-- Запрос 10. Сложный GROUP BY (Таблица users).
-- Вопрос по данным: Какое количество пользователей в каждой стране имеют бесплатную подписку (subscription_id = 1), и как они отсортированы (от большего к меньшему)?
-- Демонстрирует: WHERE, GROUP BY и ORDER BY.
SELECT country, COUNT(*) AS free_users 
FROM users 
WHERE subscription_id = 1 
GROUP BY country 
ORDER BY free_users DESC;