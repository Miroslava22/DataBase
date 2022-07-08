create database zachet;
create sequence movies_id;
create table movies (
id int not null default nextval('movies_id') primary key,
Films varchar,
Description text,
Foreign_news  text,
Russian_news text,
Fantasy_genre boolean,
Comedy_genre boolean,
Historical_genre boolean,
Comments boolean);

create sequence personal_id;
create table personal (
id int not null default nextval('personal_id') primary key, 
first_name varchar (30),
last_name varchar(30),
e_mail varchar,
phone varchar,
balance money,
subscription boolean,
month_of_subscription int);
alter table movies add column persona_id int references personal(id);

create sequence subscription_id;
create table subscription (
id int not null default nextval('subscription_id') primary key,
subscription boolean,
month_of_subscription int);
alter table personal drop column subscription, drop column month_of_subscription;
alter table movies add column subscription_id int references subscription(id);

create sequence news_id;
create table news (
id int not null default nextval('news_id') primary key,  
For_news text,
Rus_news text);
alter table movies drop column Foreign_news, drop column Russian_news;
alter table movies add column all_news_id int references news(id);

create sequence genres_id;
create table genres (
id int not null default nextval('genres_id') primary key,
Fantasy_genres boolean,
Comedy_genres boolean,
Historical_genres boolean);
alter table movies drop column Fantasy_genre, drop column Comedy_genre, drop column Historical_genre;
alter table movies add column genres_id int references genres(id);

create sequence films_id;
create table films (
id int not null default nextval('films_id') primary key, 
Films_name varchar,
Description text,
Comments boolean);
alter table movies drop column Films, drop column Description, drop column Comments;
alter table movies add column Films_id int references films(id);

insert into films (films_name, description, comments) values
('9 rota', 'The picture describes the fate of conscripts in the Soviet army.', 't'),
('Devyataev', 'The history of the feat of the Soviet pilot' , 't'),
('Artek.The big jorney', 'Summer solar comedy for the whole family with beautiful Crimean landscapes', 'f'), 
('Hello again!', 'animated action comedy', 't'),
('Pirates of Caribean', 'Mega popular pirate action', 't');

insert into genres (Fantasy_genres, Comedy_genres, Historical_genres) values
('f', 'f', 't'),
('f', 'f', 't'),
('f', 't', 'f'),
('f', 't', 'f'),
('t', 'f', 'f');

insert into news (For_news, Rus_news) values
('New track for the film in 4 languages', 'Трейлер на 4 языках'),
('Film premiere in Moscow', 'Премьера фильма в Москве'),
('New family comedy', 'Новая семейная комедия'),
('New movie star', 'Новая звезда фильма'),
('3D quality', 'Качество 3D');

insert into personal (first_name, last_name, phone, e_mail, balance) values
('Ivan', 'Ivanov','89315112233', 'ivan@yandex.ru', '283.98'),
('Stepan','Stepanov','89826112234', 'maria@mail.ru', '154'),
('Anna','Petrova','89318642235', 'olesya@yandex.ru', '300.0'),
('Janna','Sinicina','89315137436','Janna@mail.ru', '12'),
('Andrey','Andreev','89322382239', 'zima@gmail.com', '53.57');

insert into subscription (subscription, month_of_subscription) values
('t', 6),
('t', 3),
('t', 12),
('f', 0),
('t', 4);

insert into movies (id, films_id, all_news_id, genres_id, persona_id, subscription_id) values
(1,(select id from films where id=1),
(select id from news where id=1),
(select id from genres where id=1),
(select id from personal where id=1),
(select id from subscription where id=1),
(2,(select id from films where id=2),
(select id from news where id=2),
(select id from genres where id=2),
(select id from personal where id=2),
(select id from subscription where id=2),
(3,(select id from films where id=3),
(select id from news where id=3),
(select id from genres where id=3),
(select id from personal where id=3),
(select id from subscription where id=3),
(4,(select id from films where id=4),
(select id from news where id=4),
(select id from genres where id=4),
(select id from personal where id=4),
(select id from subscription where id=4),
(5,(select id from films where id=5),
(select id from news where id=5),
(select id from genres where id=5),
(select id from personal where id=5),
(select id from subscription where id=5));

select *
from (movies  
inner join films
on films.id=movies.id),
(news
inner join genres 
on genres.id=news.id),
(personal
inner join "subscription" 
on subscription.id=personal.id);

select movies.films_id, movies.all_news_id, movies.genres_id, movies.persona_id, movies.subscription_id,
films.films_name from movies
inner join films on films.id=movies.id
order by movies.id;





