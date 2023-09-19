drop database if exists vk;
create database if not exists vk;
use vk;

create table if not exists users(
id int primary key auto_increment,
username varchar(30),
password_hash varchar(300),
last_seen datetime
);

create table if not exists chats(
id int primary key auto_increment,
title varchar(50),
description varchar(200),
owner_id int,
foreign key (owner_id) references users(id)
);

create table if not exists users_to_chats(
users_id int,
chat_id int,
primary key (users_id, chat_id),
enter_datetime datetime,
foreign key (users_id) references users(id),
foreign key (chat_id) references chats(id)
);

insert into users(username) values
('user 1'),
('user 2'),
('user 3'),
('user 4'),
('user 5'),
('user 6'),
('user 7'),
('user 8');

insert into chats(title, description, owner_id) values
('chat 1', 'for car lovers', 1),
('chat 2', 'anime is the best kino', 2),
('chat 3', '', 4);

insert into users_to_chats values
(1, 1, '2023-01-15 14:56:07'),
(2, 1, '2023-01-15 14:56:07'),
(3, 1, '2023-01-15 14:56:07'),
(4, 1, '2023-01-17 09:34:27'),
(1, 2, '2023-01-16 14:56:07'),
(2, 2, '2023-01-16 14:56:07'),
(4, 2, '2023-01-15 14:56:07'),
(5, 2, '2023-01-18 14:56:07'),
(7, 2, '2023-01-23 13:00:04'),
(8, 2, '2023-01-30 13:09:13'),
(3, 3, '2023-01-25 00:06:54'),
(4, 3, '2023-01-25 00:06:54');

-- выбрать всех пользователей, которые не владеют чатами:
select users.username from users
left join chats on users.id = chats.owner_id
where chats.owner_id is null;

-- выбрать пользователей, которых нет ни в одном чате:
select users.username from users
left join users_to_chats as utc on users.id = utc.users_id
where utc.users_id is null;

-- для каждого пользователя узнать название и описание чата где они находятся
-- упорядочить по названию чата в обратном порядке:
select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 1'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 2'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 3'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 4'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 5'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 6'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 7'
order by chats.title desc;

select title, description, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 8'
order by chats.title desc;

-- узнать название и дату вступления в чат для каждого пользователя
-- упорядочить по дате
select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 1'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 2'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 3'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 4'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 5'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 6'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 7'
order by utc.enter_datetime;

select title, enter_datetime, username from users
join users_to_chats as utc on users.id = utc.users_id
join chats on chats.id = utc.chat_id
where users.username = 'user 8'
order by utc.enter_datetime;