/*
 * Upon submission, this file should contain the SQL script to initialize your database.
 * It should contain all DROP TABLE and CREATE TABLE statments, and any INSERT statements
 * required.
 */

drop table if exists comments;
drop table if exists articles;
drop table if exists users;

create table users (
   user_id integer not null primary key,
   fname varchar(15),
   lname varchar(15),
   username varchar(15) unique not null,
   password int not null,
   dob date,
   user_desc varchar(128),
   avatar_icon varchar(128),
   authToken varchar(128)
);

CREATE table if not EXISTS articles (
  article_id integer not null PRIMARY key,
  title varchar(65),
  post_date date,
  user_id integer,
  FOREIGN key (user_id) REFERENCES users (user_id)
);

CREATE table if not EXISTS comments (
  comment_id integer not null,
  content text,
  comment_date date,
  num_of_like integer,
  parent_comment_id INTEGER,
  isChild char(1),
  user_id INTEGER,
  article_id INTEGER,
  FOREIGN key (user_id) REFERENCES users (user_id),
  FOREIGN key (article_id) REFERENCES articles (article_id)
);

INSERT into users (user_id, fname, lname, username, password, dob, user_desc, avatar_icon)VALUES 
(1, 'Alice', 'White', 'ali01', 'pa55word', '1997/04/17', 'I am Alice', 'icon09'),
(2, 'Bob', 'Black', 'bb02', 'pa55', '1996/07/04', 'I am Bob', 'icon03'),
(3, 'John', 'Doe', 'jd03', '55word', '2000/12/12', 'I am John Doe', 'icon06');

INSERT into articles VALUES
(1, 'article one', '2010/04/04', 2),
(2, 'article two', '2006/05/05', 1),
(3, 'article three','2015/06/02', 3);


insert into comments values
(1, 'good article overall', '2020/02/02', 34, null, 'Y', 1, 1),
(2, 'bad article ever', '1990/01/01', 9, null, 'N', 2, 2),
(3, 'not bad', '2001/03/03', 11, 1, 'N', 3, 1);


