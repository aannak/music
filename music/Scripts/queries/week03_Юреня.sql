-- ============================================================
-- week03_Фамилия.sql
-- Тема: Выборка из одной таблицы
-- Таблица: artists
-- ============================================================

-- Запрос 1. WHERE с AND/OR + ORDER BY
-- Вопрос: Какие артисты из США или Великобритании,
-- сформированные после 1990 года, отсортированы по году основания?
SELECT artist_id, name, country, formed_year
FROM artists
WHERE (country = 'США' OR country = 'Великобритания')
  AND formed_year > 1990
ORDER BY formed_year ASC;

-- Запрос 2. IN + BETWEEN + DISTINCT
-- Вопрос: Какие уникальные страны представлены у артистов,
-- основанных между 1980 и 2000 годами (включительно),
-- среди стран США, России и Великобритании?
SELECT DISTINCT country
FROM artists
WHERE country IN ('США', 'Россия', 'Великобритания')
  AND formed_year BETWEEN 1980 AND 2000;

-- Запрос 3. LIKE + ORDER BY
-- Вопрос: Какие артисты имеют в названии слово, начинающееся
-- на букву "B" (например, "Beatles", "Beyoncé"), и как они
-- упорядочены по названию?
SELECT artist_id, name, country
FROM artists
WHERE name LIKE 'B%'
ORDER BY name ASC;

-- Запрос 4. Вычисляемый столбец
-- Вопрос: Сколько полных лет прошло с момента основания
-- каждого артиста до текущей даты (возраст группы)?
SELECT
    name,
    formed_year,
    (EXTRACT(YEAR FROM CURRENT_DATE) - formed_year) AS years_since_formed
FROM artists
WHERE formed_year IS NOT NULL
ORDER BY years_since_formed DESC;

-- Запрос 5. IS NULL
-- Вопрос: У каких артистов не указана страна или год основания
-- (неполные данные в справочнике)?
SELECT artist_id, name, country, formed_year, bio
FROM artists
WHERE country IS NULL OR formed_year IS NULL;