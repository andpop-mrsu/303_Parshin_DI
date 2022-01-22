insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
<<<<<<< HEAD
('Dmitry', 'Parshin', 'Parshin_Dmitry@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Ilya', 'Nikulov', 'Nikulov_Ilya@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Daniil', 'Osipov', 'Daniil_Osipov@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Julia', 'Potapkina', 'Potapkina_Julia@gmail.com', date('now'), 'female', (select id from occupations as o where o.title = 'student'));
values
("Daria", "Rodkina", "Daria_Rodkina@gmail.com", "female", DATE("now"), (SELECT id FROM occupations WHERE occupations.title = "student"));
=======
('Daniil', 'Osipov', 'Daniil_Osipov@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Stepan', 'Maximov', 'Maximov_Stepan@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Ilya', 'Nikulov', 'Nikulov_Ilya@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Dmitry', 'Parshin', 'Parshin_Dmitry@gmail.com', date('now'), 'male', (select id from occupations as o where o.title = 'student'));
insert into users(first_name, last_name, email, register_date, gender, occupation_id)
values
('Julia', 'Potapkina', 'Potapkina_Julia@gmail.com', date('now'), 'female', (select id from occupations as o where o.title = 'student'));
>>>>>>> e778ca3bb6dcd24348b124758cab1669f2f46c4f

insert into movies(title, year) 
values('Film_1_2021', 2021),
('Film_2_2021', 2021),
('Film_3_2021', 2021);

insert into ratings(user_id, movie_id, rating, 'timestamp')
values
<<<<<<< HEAD
((select id from users where users.email = 'Parshin_Dmitry@gmail.com'), 
=======
((select id from users where users.email = 'Daniil_Osipov@gmail.com'), 
>>>>>>> e778ca3bb6dcd24348b124758cab1669f2f46c4f
(select id from movies where movies.title = 'Film_1_2021' and movies.year = 2021),
2.75,
strftime('%s','now'));

insert into ratings(user_id, movie_id, rating, 'timestamp')
values
<<<<<<< HEAD
((select id from users where users.email = 'Parshin_Dmitry@gmail.com'), 
=======
((select id from users where users.email = 'Daniil_Osipov@gmail.com'), 
>>>>>>> e778ca3bb6dcd24348b124758cab1669f2f46c4f
(select id from movies where movies.title = 'Film_2_2021' and movies.year = 2021),
3.25,
strftime('%s','now'));

insert into ratings(user_id, movie_id, rating, 'timestamp')
values
<<<<<<< HEAD
((select id from users where users.email = 'Parshin_Dmitry@gmail.com'), 
=======
((select id from users where users.email = 'Daniil_Osipov@gmail.com'), 
>>>>>>> e778ca3bb6dcd24348b124758cab1669f2f46c4f
(select id from movies where movies.title = 'Film_3_2021' and movies.year = 2021),
3.75,
strftime('%s','now')); 