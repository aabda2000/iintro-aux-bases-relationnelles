DROP table if exists post_topic;
DROP table if exists topics;
DROP table if exists posts;
DROP table if exists users;
create table users(
  id int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  username VARCHAR (25) NOT NULL,
  email VARCHAR(20) NOT NULL,
  role enum('Author', 'Admin') DEFAULT NULL,
  password varchar(255) NOT NULL,
  created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT NULL
);
CREATE TABLE posts (
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id int(11) DEFAULT NULL,
  title varchar(255) NOT NULL,
  slug varchar(255) NOT NULL UNIQUE,
  views int(11) NOT NULL DEFAULT '0',
  image varchar(255) NOT NULL,
  body text NOT NULL,
  published tinyint(1) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE TABLE topics(
  id int(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  slug VARCHAR(255) NOT NULL UNIQUE
);
CREATE TABLE post_topic(
  id int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  post_id INT(11) NOT NULL,
  topic_id INT(11) NOT NULL,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE NO ACTION,
  FOREIGN KEY (topic_id) REFERENCES topics (id) ON DELETE CASCADE ON UPDATE NO ACTION
);
INSERT INTO
  `users` (
    `username`,
    `email`,
    `role`,
    `password`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    'ahmad',
    'info@info.com',
    'Admin',
    'mypassword',
    '2018-01-08 12:52:58',
    '2018-01-08 12:52:58'
  ),
  (
    'jade',
    'jade@info.com',
    'Author',
    'mypassword',
    '2018-01-08 12:52:58',
    '2018-01-08 12:52:58'
  ),
  (
    'pierre',
    'info@info.com',
    'Author',
    'mypassword',
    '2018-01-08 12:52:58',
    '2018-01-08 12:52:58'
  );
INSERT INTO
  `posts` (
    `id`,
    `user_id`,
    `title`,
    `slug`,
    `views`,
    `image`,
    `body`,
    `published`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    1,
    1,
    '5 Habits that can improve your life',
    '5-habits-that-can-improve-your-life',
    0,
    'banner.jpg',
    'Read every day',
    1,
    '2018-02-03 07:58:02',
    '2018-02-01 19:14:31'
  ),
  (
    2,
    1,
    'Second post on LifeBlog',
    'second-post-on-lifeblog',
    0,
    'banner.jpg',
    'This is the body of the second post on this site',
    0,
    '2018-02-02 11:40:14',
    '2018-02-01 13:04:36'
  );
INSERT INTO
  `topics` (`id`, `name`, `slug`)
VALUES
  (1, 'Inspiration', 'inspiration'),
  (2, 'Motivation', 'motivation'),
  (3, 'Diary', 'diary');
INSERT INTO
  `post_topic` (`id`, `post_id`, `topic_id`)
VALUES
  (1, 1, 1),
  (2, 2, 2);
Alter table
  users
add
  city Varchar(40) NULL;
Alter table
  users
add
  location POINT NULL;