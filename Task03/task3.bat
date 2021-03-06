#!/bin/bash
chcp 65001

sqlite3 movies_rating.db < db_init.sql

echo "1. Составить список фильмов, имеющих хотя бы одну оценку. Список фильмов отсортировать по году выпуска и по названиям. В списке оставить первые 10 фильмов."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select distinct m.id, m.title, m.year, m.genres from movies m join ratings r on m.id = r.movie_id order by year, title limit 10;"
echo " "

echo "2. Вывести список всех пользователей, фамилии (не имена!) которых начинаются на букву 'A'. Полученный список отсортировать по дате регистрации. В списке оставить первых 5 пользователей."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select * from users where name like '%% A%%' order by register_date limit 5;"
echo " "

echo "3. Написать запрос, возвращающий информацию о рейтингах в более читаемом формате: имя и фамилия эксперта, название фильма, год выпуска, оценка и дата оценки в формате ГГГГ-ММ-ДД. Отсортировать данные по имени эксперта, затем названию фильма и оценке. В списке оставить первые 50 записей."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select users.name, movies.title, movies.year, rating, date(timestamp, 'unixepoch') as rating_date from ratings inner join users on users.id = user_id inner join movies on movies.id = movie_id order by users.name, movies.title, rating limit 50;"
echo " "

echo "4. Вывести список фильмов с указанием тегов, которые были им присвоены пользователями. Сортировать по году выпуска, затем по названию фильма, затем по тегу. В списке оставить первые 40 записей."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select movies.*, tags.tag from movies inner join tags on tags.movie_id = movies.id order by year, title, tag limit 40;"
echo " "

echo "5. Вывести список самых свежих фильмов. В список должны войти все фильмы последнего года выпуска, имеющиеся в базе данных. Запрос должен быть универсальным, не зависящим от исходных данных (нужный год выпуска должен определяться в запросе, а не жестко задаваться)."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select * from movies where year = (select max(year) from movies);"
echo " "

echo "6. Найти все комедии, выпущенные после 2000 года, которые понравились мужчинам (оценка не ниже 4.5). Для каждого фильма в этом списке вывести название, год выпуска и количество таких оценок. Результат отсортировать по году выпуска и названию фильма."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select m.title, m.year, count(case m.title when m.title then 1 else null end) from movies m join  ratings r on m.id = r.movie_id join users u on r.user_id = u.id where year > 2000 and genres like '%%Comedy%%' and gender == 'male' and r.rating >= 4.5 group by title order by year, title;"
echo " "

echo "7. Провести анализ занятий (профессий) пользователей - вывести количество пользователей для каждого рода занятий. Найти самую распространенную и самую редкую профессию посетителей сайта."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "select occupation, count(distinct id) from users group by occupation;"
sqlite3 movies_rating.db -box -echo "select occupation, max(number) from (select occupation, count(distinct id) as number from users group by occupation);"
sqlite3 movies_rating.db -box -echo "select occupation, min(number) from (select occupation, count(distinct id) as number from users group by occupation);"