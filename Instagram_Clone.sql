-- Active: 1674108989279@@127.0.0.1@3306@ig_clone
CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO
    users (username)
VALUES
    ('BlueTheCat'),
    ('CharlieBrown'),
    ('ColtSteele');

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

INSERT INTO
    photos (image_url, user_id)
VALUES
    ('/adfadf', 1),
    ('/dfadaf', 2),
    ('/cvzvd', 2);

SELECT
    image_url,
    username
FROM
    photos
    JOIN users ON photos.user_id = users.id;

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

INSERT INTO
    comments (comment_text, user_id, photo_id)
VALUES
    ('Meow!', 1, 2),
    ('Amazing Shot!', 3, 2),
    ('I <3 This', 2, 1);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO
    likes(user_id, photo_id)
VALUES
    (1, 1),
    (2, 1),
    (1, 2),
    (1, 3),
    (3, 3);

CREATE TABLE follows(
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

INSERT INTO
    follows(follower_id, followee_id)
VALUES
    (1, 2),
    (1, 3),
    (3, 1),
    (2, 3);

CREATE TABLE tags(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags(
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO
    tags(tag_name)
VALUES
    ('adorable'),
    ('cute'),
    ('sunrise');

INSERT INTO
    photo_tags(photo_id, tag_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (3, 2);

SELECT
    *
FROM
    follows;

SELECT
    *
FROM
    users
ORDER BY
    created_at
LIMIT
    5;

SELECT
    username,
    DATE_FORMAT(created_at, '%W')
FROM
    users;

SELECT
    DAYNAME(created_at) AS DAY,
    COUNT(*) AS total
FROM
    users
GROUP BY
    DAY
ORDER BY
    total DESC
LIMIT
    2;

SELECT
    username
FROM
    users
    LEFT JOIN photos ON users.id = photos.user_id
WHERE
    user_id IS NULL;

SELECT
    username,
    photos.id,
    photos.image_url,
    COUNT(*) AS total
FROM
    photos
    JOIN likes ON photos.id = likes.photo_id
    JOIN users ON photos.user_id = users.id
GROUP BY
    photos.id
ORDER BY
    total DESC
LIMIT
    1;

SELECT
    username,
    COUNT(*) AS total
FROM
    users
    JOIN photos ON users.id = photos.user_id
GROUP BY
    username WITH ROLLUP;

CREATE VIEW username_total AS
SELECT
    username,
    COUNT(*) AS total
FROM
    users
    JOIN photos ON users.id = photos.user_id
GROUP BY
    username;

SELECT
    *
FROM
    username_total;

SELECT
    ROUND(AVG(total), 2) AS average
FROM
    username_total;

SELECT
    (
        SELECT
            COUNT(*)
        FROM
            photos
    ) / (
        SELECT
            COUNT(*)
        FROM
            users
    ) AS avg;

SELECT
    *
FROM
    photo_tags
    JOIN tags ON photo_tags.tag_id = tags.id;

SELECT
    tag_name,
    COUNT(*) AS total
FROM
    photo_tags
    JOIN tags ON photo_tags.tag_id = tags.id
GROUP BY
    tag_name
ORDER BY
    total DESC
LIMIT
    5;

SELECT
    username,
    photo_id,
    image_url
FROM
    likes
    LEFT JOIN users ON likes.user_id = users.id
    LEFT JOIN photos ON likes.photo_id = photos.id;

SELECT
    username,
    COUNT(photos.user_id),
    COUNT(likes.user_id)
FROM
    likes
    LEFT JOIN users ON likes.user_id = users.id
    LEFT JOIN photos ON likes.photo_id = photos.id
GROUP BY
    username;

SELECT
    username,
    COUNT(*)
FROM
    users
    JOIN likes ON users.id = likes.user_id
GROUP BY
    user_id;

SELECT
    username,
    COUNT(*)
FROM
    users
    JOIN photos ON users.id = photos.user_id
GROUP BY users.id;