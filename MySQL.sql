-- Active: 1673774227721@@127.0.0.1@3306@bootcamp
SELECT
    *
FROM
    books
LIMIT
    1, 6;

SELECT
    *
FROM
    books
WHERE
    author_fname = 'David';

SELECT
    title,
    author_fname,
    author_lname
FROM
    books
WHERE
    author_fname LIKE '%av%';

SELECT
    title,
    author_fname,
    author_lname
FROM
    books
WHERE
    author_fname LIKE '____';

SELECT
    title,
    author_fname,
    author_lname
FROM
    books
WHERE
    title LIKE '%\%%';

SELECT
    title,
    author_fname,
    author_lname
FROM
    books
WHERE
    title LIKE '%\_%';

SELECT
    title
FROM
    books
WHERE
    title LIKE '%stories%';

SELECT
    title,
    pages
FROM
    books
ORDER BY
    pages DESC
LIMIT
    1;

SELECT
    CONCAT(title, ' - ', released_year) AS summary
FROM
    books
ORDER BY
    released_year DESC
LIMIT
    3;

SELECT
    title,
    author_lname
FROM
    books
WHERE
    author_lname LIKE '% %';

SELECT
    title,
    released_year,
    stock_quantity
FROM
    books
ORDER BY
    stock_quantity
LIMIT
    3;

SELECT
    title,
    author_lname
FROM
    books
ORDER BY
    author_lname,
    title;

SELECT
    CONCAT(
        'MY FAVORITE AUTHOR IS ',
        UPPER(author_fname),
        ' ',
        UPPER(author_lname),
        '!'
    ) AS yell
FROM
    books
ORDER BY
    author_lname;

SELECT
    COUNT(*)
FROM
    books;

SELECT
    COUNT(author_fname)
FROM
    books;

SELECT
    COUNT(DISTINCT(author_fname))
FROM
    books;

SELECT
    COUNT(*)
FROM
    books
WHERE
    title LIKE '%the%';

SELECT
    author_lname,
    COUNT(*) AS books_written
FROM
    books
GROUP BY
    author_lname
ORDER BY
    books_written DESC;

SELECT
    released_year,
    COUNT(*)
FROM
    books
GROUP BY
    released_year;

SELECT
    CONCAT(author_fname, ' ', author_lname) AS Author,
    COUNT(*) AS 'Number of Books'
FROM
    books
GROUP BY
    author;

SELECT
    title,
    MAX(pages)
FROM
    books;

SELECT
    title,
    pages
FROM
    books
WHERE
    pages = (
        SELECT
            MIN(pages)
        FROM
            books
    );

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year = (
        SELECT
            MAX(released_year)
        FROM
            books
    );

SELECT
    author_fname,
    author_lname,
    Min(released_year)
FROM
    books
GROUP BY
    author_fname,
    author_lname;

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    COUNT(*) AS books_written,
    MAX(released_year) AS latest_release,
    MIN(released_year) AS earliest_release
FROM
    books
GROUP BY
    author;

SELECT
    author_lname,
    SUM(pages)
FROM
    books
GROUP BY
    author_lname;

SELECT
    AVG(pages)
FROM
    books;

SELECT
    released_year,
    AVG(stock_quantity)
FROM
    books
GROUP BY
    released_year;

SELECT
    COUNT(title)
FROM
    books;

SELECT
    released_year,
    COUNT(*)
FROM
    books
GROUP BY
    released_year;

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    AVG(released_year)
FROM
    books
GROUP BY
    author;

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
WHERE
    pages =(
        SELECT
            MAX(pages)
        FROM
            books
    );

SELECT
    CONCAT(author_fname, ' ', author_lname) AS author
FROM
    books
ORDER BY
    pages DESC
LIMIT
    1;

SELECT
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM
    books
GROUP BY
    year;

CREATE DATABASE bootcamp;

CREATE TABLE friends (name VARCHAR(10));

INSERT INTO
    friends (name)
VALUES
    ('tom'),
    ('juan pablo'),
    ('james');

SELECT
    *
FROM
    friends;

CREATE TABLE states (abbr CHAR(2));

INSERT INTO
    states (abbr)
VALUES
    ('CA'),
    ('NY');

SELECT
    *
FROM
    states;

CREATE TABLE human (height DECIMAL(5, 2), weight DECIMAL(5, 2));

INSERT INTO
    human (height, weight)
VALUES
    (168.8, 59.54),
    (177.2, 72.5);

SELECT
    *
FROM
    human;

CREATE TABLE num (x FLOAT, y DOUBLE);

INSERT INTO
    num
VALUES
    (1.125, 1.125);

INSERT INTO
    num
VALUES
    (1.123456789, 1.123456789);

CREATE TABLE people(
    name VARCHAR(10),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

DESC people;

INSERT INTO
    people (name, birthdate, birthtime, birthdt)
VALUES
    (
        'Elton',
        '2000-12-25',
        '22:42:55',
        '2000-12-25 22:42:55'
    ),
    (
        'Kevin',
        '2003-05-15',
        '17:22:50',
        '2003-05-15 17:22:50'
    ),
    (
        'Lulu',
        '1992-07-30',
        '23:22:14',
        '1992-07-30 23:22:14'
    );

INSERT INTO
    people (name, birthdate, birthtime, birthdt)
VALUES
    ('Juan', CURDATE(), CURTIME(), NOW()),
    ('Hazel', CURDATE(), CURTIME(), NOW());

SELECT
    *
FROM
    people;

SELECT
    birthdate,
    DAY(birthdate)
FROM
    people;

SELECT
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate)
FROM
    people;

SELECT
    birthdate,
    DAY(birthdate),
    DAYOFWEEK(birthdate),
    DAYOFYEAR(birthdate)
FROM
    people;

SELECT
    birthdate,
    MONTHNAME(birthdate)
FROM
    people;

SELECT
    birthdate,
    YEAR(birthdate)
FROM
    people;

SELECT
    birthdate,
    YEAR(birthdate),
    MONTH(birthdate)
FROM
    people;

SELECT
    birthdate,
    YEAR(birthdate),
    MONTH(birthdate),
    DAY(birthdate)
FROM
    people;

SELECT
    birthtime,
    HOUR(birthtime),
    MINUTE(birthtime),
    SECOND(birthtime)
FROM
    people;

SELECT
    CONCAT(
        MONTHNAME(birthdate),
        ' ',
        DAY(birthdate),
        ' ',
        YEAR(birthdate)
    ) AS DATES
FROM
    people;

SELECT
    DATE_FORMAT(birthdate, '%b %d %Y')
FROM
    people;

SELECT
    birthdate,
    DATE_FORMAT(birthdate, '%a, %b %e')
FROM
    people;

SELECT
    birthdt,
    DATE_FORMAT(birthdt, '%r')
FROM
    people;

SELECT
    birthdt,
    DATE_FORMAT(birthdt, 'BORN ON: %H:%i')
FROM
    people;

SELECT
    birthdate,
    DATEDIFF(CURDATE(), birthdate)
FROM
    people;

CREATE TABLE captions (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
    captions (text)
VALUES
    ('beautiful sunset');

CREATE TABLE captions2 (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO
    captions2 (text)
VALUES
    ('I love my life!');

UPDATE
    captions2
SET
    text = 'I love live!!!!';

CREATE TABLE inventory (
    item_name VARCHAR,
    price MEDIUMINT UNSIGNED,
    quantity INT UNSIGNED
);

CREATE TABLE tweets (
    content VARCHAR(180),
    username VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year != 2017;

SELECT
    title
FROM
    books
WHERE
    title LIKE '% %';

SELECT
    title
FROM
    books
WHERE
    title NOT LIKE '% %';

SELECT
    title,
    author_fname,
    author_lname
FROM
    books
WHERE
    author_fname NOT LIKE 'da%';

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year > 2000;

SELECT
    title,
    pages
FROM
    books
WHERE
    pages < 200;

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year <= 2000;

SELECT
    *
FROM
    books;

SELECT
    title,
    author_lname,
    released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
    AND released_year > 2010
    AND title LIKE '%novel%';

SELECT
    title,
    pages
FROM
    books
WHERE
    CHAR_LENGTH(title) > 30
    AND pages > 500;

SELECT
    title,
    author_lname,
    released_year
FROM
    books
WHERE
    author_lname = 'Eggers'
    OR released_year > 2010;

SELECT
    title,
    pages
FROM
    books
WHERE
    pages < 200
    OR title LIKE '%stories%';

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year BETWEEN 2004
    AND 2015;

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year NOT BETWEEN 2004
    AND 2014;

SELECT
    *
FROM
    people
WHERE
    birthdate < '2005-01-01';

SELECT
    *
FROM
    people
WHERE
    birthtime > '15:00:00';

SELECT
    *
FROM
    people
WHERE
    birthtime BETWEEN '14:26:10'
    AND '17:22:50';

SELECT
    *
FROM
    people;

SELECT
    title,
    author_lname
FROM
    books
WHERE
    author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year NOT IN (
        2000,
        2002,
        2004,
        2006,
        2008,
        2010,
        2012,
        2014,
        2016
    );

SELECT
    title,
    released_year
FROM
    books
WHERE
    released_year >= 2000
    AND released_year % 2 = 0;

SELECT
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'modern lit'
        ELSE '20th century lit'
    END AS genre
FROM
    books;

SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        WHEN stock_quantity <= 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM
    books;

DELETE FROM
    books
WHERE
    title IS NULL;

SELECT
    *
FROM
    books
WHERE
    released_year < 1980;

SELECT
    *
FROM
    books
WHERE
    author_lname IN ('Eggers', 'Chabon');

SELECT
    *
FROM
    books
WHERE
    author_lname = 'Lahiri'
    AND released_year > 2000;

SELECT
    *
FROM
    books
WHERE
    pages BETWEEN 100
    AND 200;

SELECT
    *
FROM
    books
WHERE
    author_lname LIKE 'C%'
    OR author_lname LIKE 'S%';

SELECT
    title,
    author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title LIKE '%Just Kids%'
        OR title LIKE '%A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'NOVEL'
    END AS TYPE
FROM
    books;

SELECT
    author_fname,
    author_lname,
    CONCAT(COUNT(*), ' books') AS COUNT
FROM
    books
WHERE
    author_lname IS NOT NULL
GROUP BY
    author_fname,
    author_lname;

CREATE TABLE companies2 (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id)
);

CREATE TABLE contacts (
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE users (
    username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

CREATE TABLE palindromes (
    word VARCHAR(100) CHECK(REVERSE(word) = word)
);

CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name, address)
);

ALTER TABLE
    companies2 DROP COLUMN phone;

ALTER TABLE
    companies2
ADD
    COLUMN phone VARCHAR(15) NOT NULL UNIQUE;

ALTER TABLE
    companies
MODIFY
    COLUMN name VARCHAR(100) DEFAULT 'unkown';

ALTER TABLE
    companies
ADD
    CONSTRAINT name_address UNIQUE (name, address);

CREATE TABLE houses (
    purchase_price INT NOT NULL,
    sale_price INT NOT NULL
);

ALTER TABLE
    houses
ADD
    CONSTRAINT price_not_negative CHECK (purchase_price >= 0);