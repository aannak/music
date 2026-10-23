-- Очищаем таблицы перед заполнением (чтобы при повторном запуске не было дублей)
TRUNCATE TABLE playlist_tracks, listens, playlists, tracks, albums, artists, users, subscriptions RESTART IDENTITY CASCADE;

-- Заполнение подписок (4 записи)
INSERT INTO subscriptions (type, price, duration_months) VALUES
('Free', 0, 0),
('Premium Individual', 199, 1),
('Premium Duo', 299, 1),
('Premium Family', 399, 1);

-- Заполнение пользователей (25 записей)
INSERT INTO users (username, email, password, birth_date, country, registration_date, subscription_id) 
SELECT 
    'user_' || i, 
    'user_' || i || '@example.com', 
    'hashed_pass_' || i, 
    ('1990-01-01'::date + (i * 100 || ' days')::interval), 
    (ARRAY['Россия', 'США', 'Германия', 'Франция', 'Великобритания'])[floor(random() * 5 + 1)], 
    ('2023-01-01'::date + (i * 10 || ' days')::interval),
    floor(random() * 4 + 1)
FROM generate_series(1, 25) AS i;

-- Заполнение артистов (20 записей)
INSERT INTO artists (name, country, formed_year, bio) VALUES
('The Beatles', 'Великобритания', 1960, 'Легендарная рок-группа'),
('Queen', 'Великобритания', 1970, 'Классический рок'),
('Michael Jackson', 'США', 1964, 'Король поп-музыки'),
('Miyagi & Andy Panda', 'Россия', 2015, 'Хип-хоп дуэт'),
('Eminem', 'США', 1996, 'Известный рэпер'),
('Daft Punk', 'Франция', 1993, 'Электронная музыка'),
('Radiohead', 'Великобритания', 1985, 'Альтернативный рок'),
('Linkin Park', 'США', 1996, 'Ню-метал'),
('Ariana Grande', 'США', 2013, 'Поп-исполнительница'),
('Tame Impala', 'Австралия', 2007, 'Психоделический поп'),
('Владимир Высоцкий', 'СССР', 1960, 'Бард'),
('Кино', 'СССР', 1981, 'Русский рок'),
('Beyoncé', 'США', 1997, 'R&B'),
('Nirvana', 'США', 1987, 'Гранж'),
('Pink Floyd', 'Великобритания', 1965, 'Прогрессивный рок'),
('Metallica', 'США', 1981, 'Хэви-метал'),
('Billie Eilish', 'США', 2015, 'Поп'),
('Kendrick Lamar', 'США', 2003, 'Хип-хоп'),
('Soda Luv', 'Россия', 2018, 'Хип-хоп'),
('Coldplay', 'Великобритания', 1996, 'Поп-рок');

-- Заполнение альбомов (22 записи)
INSERT INTO albums (title, release_date, album_type, artist_id) VALUES
('Abbey Road', '1969-09-26', 'Studio', 1),
('A Night at the Opera', '1975-11-21', 'Studio', 2),
('Thriller', '1982-11-30', 'Studio', 3),
('Yamakasi', '2020-03-13', 'Studio', 4),
('The Marshall Mathers LP', '2000-05-23', 'Studio', 5),
('Discovery', '2001-03-12', 'Studio', 6),
('OK Computer', '1997-05-21', 'Studio', 7),
('Hybrid Theory', '2000-10-24', 'Studio', 8),
('thank u, next', '2019-02-08', 'Studio', 9),
('Currents', '2015-07-17', 'Studio', 10),
('The Dark Side of the Moon', '1973-03-01', 'Studio', 15),
('Nevermind', '1991-09-24', 'Studio', 14),
('Master of Puppets', '1986-03-03', 'Studio', 16),
('When We All Fall Asleep, Where Do We Go?', '2019-03-29', 'Studio', 17),
('good kid, m.A.A.d city', '2012-10-22', 'Studio', 18),
('Parachutes', '2000-07-10', 'Studio', 20),
('Lemonade', '2016-04-23', 'Studio', 13),
('Группа крови', '1988-01-01', 'Studio', 12),
('The Eminem Show', '2002-05-26', 'Studio', 5),
('Random Access Memories', '2013-05-17', 'Studio', 6),
('A Moon Shaped Pool', '2016-05-08', 'Studio', 7),
('Happier Than Ever', '2021-07-30', 'Studio', 17);

-- Заполнение треков (30 записей)
INSERT INTO tracks (title, duration_sec, track_number, explicit, play_count, album_id) VALUES
('Come Together', 259, 1, FALSE, 1000000, 1),
('Something', 182, 2, FALSE, 800000, 1),
('Bohemian Rhapsody', 354, 11, FALSE, 1500000, 2),
('Love of My Life', 219, 9, FALSE, 900000, 2),
('Billie Jean', 294, 6, FALSE, 2000000, 3),
('Beat It', 258, 5, FALSE, 1800000, 3),
('Kosandra', 180, 1, TRUE, 5000000, 4),
('Utopia', 200, 2, TRUE, 3000000, 4),
('Stan', 404, 3, TRUE, 1200000, 5),
('The Real Slim Shady', 284, 1, TRUE, 1100000, 5),
('One More Time', 320, 1, FALSE, 1500000, 6),
('Digital Love', 301, 2, FALSE, 1000000, 6),
('Karma Police', 261, 6, FALSE, 1300000, 7),
('Paranoid Android', 387, 2, FALSE, 1100000, 7),
('In the End', 216, 8, FALSE, 2500000, 8),
('Crawling', 209, 2, FALSE, 1600000, 8),
('7 rings', 178, 2, TRUE, 1800000, 9),
('thank u, next', 207, 1, TRUE, 1900000, 9),
('The Less I Know the Better', 216, 4, FALSE, 1400000, 10),
('Let It Happen', 467, 1, FALSE, 1200000, 10),
('Money', 382, 6, FALSE, 1600000, 11),
('Time', 413, 4, FALSE, 1700000, 11),
('Smells Like Teen Spirit', 301, 1, FALSE, 2000000, 12),
('Battery', 312, 1, FALSE, 800000, 13),
('bad guy', 194, 2, FALSE, 2100000, 14),
('HUMBLE.', 177, 5, TRUE, 1900000, 15),
('Yellow', 266, 3, FALSE, 1500000, 16),
('Группа крови', 285, 1, FALSE, 1000000, 18),
('Without Me', 290, 2, TRUE, 1400000, 19),
('Get Lucky', 369, 8, FALSE, 1600000, 20);

-- Заполнение плейлистов (20 записей)
INSERT INTO playlists (title, is_public, created_at, user_id) 
SELECT 
    'Плейлист ' || i, 
    CASE WHEN i % 3 = 0 THEN FALSE ELSE TRUE END, 
    ('2024-01-01'::date + (i * 5 || ' days')::interval), 
    floor(random() * 25 + 1)
FROM generate_series(1, 20) AS i;

-- Заполнение связи Плейлисты-Треки (25 записей)
-- Внимание: чтобы избежать дублей (playlist_id, track_id), берем уникальные пары
INSERT INTO playlist_tracks (playlist_id, track_id, position, added_at) 
SELECT 
    floor(random() * 20 + 1), 
    floor(random() * 30 + 1), 
    floor(random() * 10 + 1),
    NOW() - (random() * interval '10 days')
FROM generate_series(1, 25)
ON CONFLICT DO NOTHING; 

-- Заполнение прослушиваний (30 записей)
INSERT INTO listens (user_id, track_id, listened_at, device, seconds_played) 
SELECT 
    floor(random() * 25 + 1), 
    floor(random() * 30 + 1), 
    NOW() - (random() * interval '30 days'), 
    (ARRAY['iPhone', 'Android', 'Web', 'MacBook', 'Windows'])[floor(random() * 5 + 1)], 
    floor(random() * 300 + 10)
FROM generate_series(1, 30);