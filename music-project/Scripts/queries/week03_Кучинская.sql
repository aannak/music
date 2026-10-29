-- Запрос 1. WHERE с OR (Таблица albums).
-- Вопрос по данным: Какие альбомы вышли до 1980 года ИЛИ имеют тип "Live"?
-- Демонстрирует: WHERE с OR.
SELECT title, release_date, album_type 
FROM albums 
WHERE release_date < '1980-01-01' OR album_type = 'Live';

-- Запрос 2. IN (Таблица artists).
-- Вопрос по данным: Какие артисты родом из США или Великобритании?
-- Демонстрирует: Использование IN.
SELECT name, country, formed_year 
FROM artists 
WHERE country IN ('США', 'Великобритания');

-- Запрос 3. BETWEEN и вычисляемый столбец (Таблица albums).
-- Вопрос по данным: Какие альбомы вышли в период с 2000 по 2010 год, и сколько лет прошло с их релиза на текущий момент?
-- Демонстрирует: BETWEEN и вычисляемый столбец с датой.
SELECT title, release_date, EXTRACT(YEAR FROM AGE(release_date)) AS years_since_release 
FROM albums 
WHERE release_date BETWEEN '2000-01-01' AND '2010-12-31';

-- Запрос 4. LIKE (Таблица artists).
-- Вопрос по данным: В названии каких артистов есть слово "The"?
-- Демонстрирует: Использование LIKE.
SELECT name, country 
FROM artists 
WHERE name LIKE '%The%';

-- Запрос 5. ORDER BY и IS NULL (Таблица albums).
-- Вопрос по данным: Какие альбомы не имеют указанного типа (album_type IS NULL), отсортированные по дате выхода от новых к старым?
-- Демонстрирует: ORDER BY и IS NULL.
SELECT title, album_type, release_date 
FROM albums 
WHERE album_type IS NULL 
ORDER BY release_date DESC;

-- Запрос 6. WHERE с AND (Таблица artists).
-- Вопрос по данным: Какие артисты из США были основаны после 2000 года?
-- Демонстрирует: WHERE с AND.
SELECT name, country, formed_year 
FROM artists 
WHERE country = 'США' AND formed_year > 2000;

-- Запрос 7. IN (Таблица albums).
-- Вопрос по данным: Какие альбомы принадлежат артистам с ID 1, 2 или 3?
-- Демонстрирует: Использование IN.
SELECT title, artist_id 
FROM albums 
WHERE artist_id IN (1, 2, 3);

-- Запрос 8. BETWEEN и вычисляемый столбец (Таблица artists).
-- Вопрос по данным: Какие артисты были основаны в период с 1990 по 2000 год, и сколько лет они существуют?
-- Демонстрирует: BETWEEN и вычисляемый столбец.
SELECT name, formed_year, (2024 - formed_year) AS years_active 
FROM artists 
WHERE formed_year BETWEEN 1990 AND 2000;

-- Запрос 9. LIKE (Таблица albums).
-- Вопрос по данным: В названии каких альбомов встречается слово "Love"?
-- Демонстрирует: Использование LIKE.
SELECT title, release_date 
FROM albums 
WHERE title LIKE '%Love%';

-- Запрос 10. ORDER BY (Таблица artists).
-- Вопрос по данным: Вывести всех артистов, отсортированных по году основания (от старых к новым).
-- Демонстрирует: Использование ORDER BY ASC.
SELECT name, formed_year 
FROM artists 
ORDER BY formed_year ASC;