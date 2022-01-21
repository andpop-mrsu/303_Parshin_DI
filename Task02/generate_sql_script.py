import csv
import re

table_name = ["movies", "ratings", "tags", "users"]


def delete_table():
    s = ""
    for cur_table_name in table_name:
        s += f'drop table if exists {cur_table_name};\n'
    return s


def create_movies_table():
    full_movies = ""
    with open('movies.csv', 'r') as movies_file:
        dict_reader = csv.DictReader(movies_file)
        for row in dict_reader:
            title = row['title'].replace('"', '""').replace('\'', '\'\'')
            year = re.search(r'\d{4}', row['title'])
            full_movies += f"({row['movieId']}, '{title}', {year.group(0) if year is not None else 'null'}, '{row['genres']}'),\n"
    return full_movies[:-2] + ';\n'


def create_ratings_table():
    full_ratings = ""
    with open('ratings.csv', 'r') as ratings_file:
        dict_reader = csv.DictReader(ratings_file)
        id = 1
        for row in dict_reader:
            full_ratings += f"({id}, {row['userId']}, {row['movieId']}, {row['rating']}, {row['timestamp']}),\n"
            id += 1
    return full_ratings[:-2] + ';\n'

def create_tags_table():
    full_tags = ""
    with open('tags.csv', 'r') as tags_file:
        dict_reader = csv.DictReader(tags_file)
        id = 1
        for row in dict_reader:
            tag = row['tag'].replace('"', '""').replace('\'', '\'\'')
            full_tags += f"({id}, {row['userId']}, {row['movieId']}, '{tag}', {row['timestamp']}),\n"
            id += 1
    return full_tags[:-2] + ';\n'

def create_users_table():
    full_users = ""
    with open('users.txt', 'r') as users_file:
        users_data = users_file.readlines()
    for line in users_data:
        user_data = line.replace('"', '""').replace('\'', '\'\'').rstrip().split('|')
        full_users += f"({user_data[0]}, '{user_data[1]}', '{user_data[2]}', '{user_data[3]}', '{user_data[4]}', '{user_data[5]}'),\n"
    return full_users[:-2] + ';\n'


if __name__ == '__main__':
    with open('db_init.sql', 'w+') as f:
        f.write(delete_table() + '\n')

        f.write(f'create table movies(\n'
                '\tid int primary key,\n'
                '\ttitle varchar(255),\n'
                '\tyear int,\n'
                '\tgenres varchar(255)\n'
                ');\n'
                '\n')

        f.write(f'create table ratings(\n'
                '\tid int primary key,\n'
                '\tuser_id int,\n'
                '\tmovie_id int,\n'
                '\trating float,\n'
                '\ttimestamp int\n'
                ');\n'
                '\n')

        f.write(f'create table tags(\n'
                '\tid int primary key,\n'
                '\tuser_id int,\n'
                '\tmovie_id int,\n'
                '\ttag varchar(255),\n'
                '\ttimestamp int\n'
                ');\n'
                '\n')

        f.write(f'create table users(\n'
                '\tid int primary key,\n'
                '\tname varchar(255),\n'
                '\temail varchar(255),\n'
                '\tgender varchar(16),\n'
                '\tregister_date varchar(32),\n'
                '\toccupation varchar(255)\n'
                ');\n'
                '\n')

        f.write(f'insert into movies(id, title, year, genres)\n'
                'values\n' + create_movies_table() + '\n')

        f.write(f'insert into ratings(id, user_id, movie_id, rating, timestamp)\n'
                'values\n' + create_ratings_table() + '\n')

        f.write(f'insert into tags(id, user_id, movie_id, tag, timestamp)\n'
                'values\n' + create_tags_table() + '\n')

        f.write(f'insert into users(id, name, email, gender, register_date, occupation)\n'
                'values\n' + create_users_table())

