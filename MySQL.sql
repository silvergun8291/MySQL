-- Active: 1674108989279@@127.0.0.1@3306@bootcamp
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

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO
    customers (first_name, last_name, email)
VALUES
    ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2016-02-10', 99.99, 1),
    ('2017-11-11', 35.50, 1),
    ('2014-12-12', 800.67, 2),
    ('2015-01-03', 12.50, 2),
    ('1999-04-11', 450.25, 5);

SELECT
    *
FROM
    customers;

SELECT
    *
FROM
    orders;

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2022-11-11', 50.68, 975);

SELECT
    *
FROM
    orders
WHERE
    id = 1;

SELECT
    *
FROM
    orders
WHERE
    customer_id = 1;

SELECT
    *
FROM
    orders
WHERE
    customer_id = (
        SELECT
            id
        FROM
            customers
        WHERE
            last_name = 'George'
    );

SELECT
    customers.id,
    first_name,
    last_name,
    email,
    order_date,
    amount,
    customer_id
FROM
    customers
    JOIN orders ON customers.id = orders.customer_id;

SELECT
    first_name,
    last_name,
    SUM(amount) AS TOTAL
FROM
    customers
    JOIN orders ON orders.customer_id = customers.id
GROUP BY
    first_name,
    last_name
ORDER BY
    TOTAL;

SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    customers
    LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT
    first_name,
    last_name,
    order_date,
    amount
FROM
    orders
    LEFT JOIN customers ON orders.customer_id = customers.id;

SELECT
    *
FROM
    customers
    LEFT JOIN orders ON orders.customer_id = customers.id;

SELECT
    first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS money_spent
FROM
    customers
    LEFT JOIN orders ON orders.customer_id = customers.id
GROUP BY
    first_name,
    last_name;

SELECT
    first_name,
    last_name,
    order_date,
    amount,
    customer_id
FROM
    customers
    RIGHT JOIN orders ON customers.id = orders.customer_id;

DELETE FROM
    customers
WHERE
    first_name = 'George';

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);

INSERT INTO
    customers (first_name, last_name, email)
VALUES
    ('Boy', 'George', 'george@gmail.com'),
    ('George', 'Michael', 'gm@gmail.com'),
    ('David', 'Bowie', 'david@gmail.com'),
    ('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO
    orders (order_date, amount, customer_id)
VALUES
    ('2016-02-10', 99.99, 1),
    ('2017-11-11', 35.50, 1),
    ('2014-12-12', 800.67, 2),
    ('2015-01-03', 12.50, 2),
    ('1999-04-11', 450.25, 5);

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)
);

CREATE TABLE papers (
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students (id) ON DELETE CASCADE
);

INSERT INTO
    students (first_name)
VALUES
    ('Caleb'),
    ('Samantha'),
    ('Raj'),
    ('Carlos'),
    ('Lisa');

INSERT INTO
    papers (student_id, title, grade)
VALUES
    (1, 'My First Book Report', 60),
    (1, 'My Second Book Report', 75),
    (2, 'Russian Lit Through The Ages', 94),
    (2, 'De Montaigne and The Art of The Essay', 98),
    (4, 'Borges and Magical Realism', 89);

SELECT
    first_name,
    IFNULL(title, 'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM
    students
    LEFT JOIN papers ON id = student_id;

SELECT
    first_name,
    IFNULL(AVG(grade), 0) AS average
FROM
    students
    LEFT JOIN papers ON id = student_id
GROUP BY
    first_name
ORDER BY
    average DESC;

SELECT
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN AVG(grade) >= 75 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
FROM
    students
    LEFT JOIN papers ON id = student_id
GROUP BY
    first_name
ORDER BY
    average DESC;

CREATE DATABASE tv_db;

CREATE TABLE reviewers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2, 1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY (series_id) REFERENCES series (id) ON DELETE CASCADE,
    FOREIGN KEY (reviewer_id) REFERENCES reviews (id) ON DELETE CASCADE
);

INSERT INTO
    series (title, released_year, genre)
VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO
    reviewers (first_name, last_name)
VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO
    reviews(series_id, reviewer_id, rating)
VALUES
    (1, 1, 8.0),
    (1, 2, 7.5),
    (1, 3, 8.5),
    (1, 4, 7.7),
    (1, 5, 8.9),
    (2, 1, 8.1),
    (2, 4, 6.0),
    (2, 3, 8.0),
    (2, 6, 8.4),
    (2, 5, 9.9),
    (3, 1, 7.0),
    (3, 6, 7.5),
    (3, 4, 8.0),
    (3, 3, 7.1),
    (3, 5, 8.0),
    (4, 1, 7.5),
    (4, 3, 7.8),
    (4, 4, 8.3),
    (4, 2, 7.6),
    (4, 5, 8.5),
    (5, 1, 9.5),
    (5, 3, 9.0),
    (5, 4, 9.1),
    (5, 2, 9.3),
    (5, 5, 9.9),
    (6, 2, 6.5),
    (6, 3, 7.8),
    (6, 4, 8.8),
    (6, 2, 8.4),
    (6, 5, 9.1),
    (7, 2, 9.1),
    (7, 5, 9.7),
    (8, 4, 8.5),
    (8, 2, 7.8),
    (8, 6, 8.8),
    (8, 5, 9.3),
    (9, 2, 5.5),
    (9, 3, 6.8),
    (9, 4, 5.8),
    (9, 6, 4.3),
    (9, 5, 4.5),
    (10, 5, 9.9),
    (13, 3, 8.0),
    (13, 4, 7.2),
    (14, 2, 8.5),
    (14, 3, 8.9),
    (14, 4, 8.9);

SELECT
    title,
    rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
LIMIT
    15;

SELECT
    title,
    rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id;

SELECT
    title,
    ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    title
ORDER BY
    avg_rating;

SELECT
    first_name,
    last_name,
    rating
FROM
    reviewers
    JOIN reviews ON reviewers.id = reviews.reviewer_id;

SELECT
    title AS unreviewed_series
FROM
    series
    LEFT JOIN reviews ON series.id = reviews.series_id
WHERE
    rating IS NULL;

SELECT
    genre,
    ROUND(AVG(rating), 2) AS avg_rating
FROM
    series
    JOIN reviews ON series.id = reviews.series_id
GROUP BY
    genre;

SELECT
    first_name,
    last_name,
    COUNT(rating) AS COUNT,
    IFNULL(MIN(rating), 0) AS MIN,
    IFNULL(MAX(rating), 0) AS MAX,
    ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
    CASE
        WHEN COUNT(*) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS STATUS
FROM
    reviewers
    LEFT JOIN reviews ON reviewers.id = reviews.reviewer_id
GROUP BY
    first_name,
    last_name;

SELECT
    title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM
    reviews
    JOIN series ON series.id = reviews.series_id
    JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    reviews
    JOIN series ON series.id = reviews.series_id
    JOIN reviewers ON reviewers.id = reviews.reviewer_id;

CREATE VIEW full_reviews AS
SELECT
    title,
    released_year,
    genre,
    rating,
    first_name,
    last_name
FROM
    reviews
    JOIN series ON series.id = reviews.series_id
    JOIN reviewers ON reviewers.id = reviews.reviewer_id;

SELECT
    *
FROM
    full_reviews
WHERE
    genre = 'Animation';

SELECT
    genre,
    AVG(rating) AS average
FROM
    full_reviews
GROUP BY
    genre;

SELECT
    *
FROM
    full_reviews;

DELETE FROM
    full_reviews
WHERE
    released_year = 2011;

CREATE VIEW ordered_series AS
SELECT
    *
FROM
    series
ORDER BY
    released_year;

CREATE
OR REPLACE VIEW ordered_series AS
SELECT
    *
FROM
    series
ORDER BY
    released_year DESC;

ALTER VIEW ordered_series AS
SELECT
    *
FROM
    series
ORDER BY
    released_year;

SELECT
    title,
    AVG(rating)
FROM
    full_reviews
GROUP BY
    title;

SELECT
    title,
    AVG(rating) AS average,
    COUNT(rating) AS review_count
FROM
    full_reviews
GROUP BY
    title
HAVING
    COUNT(rating) > 1;

SELECT
    AVG(rating)
FROM
    full_reviews;

SELECT
    title,
    AVG(rating)
FROM
    full_reviews
GROUP BY
    title;

SELECT
    title,
    AVG(rating)
FROM
    full_reviews
GROUP BY
    title WITH ROLLUP;

SELECT
    title,
    COUNT(rating)
FROM
    full_reviews
GROUP BY
    title WITH ROLLUP;

SELECT
    released_year,
    genre,
    ROUND(AVG(rating), 2) AS AVG
FROM
    full_reviews
GROUP BY
    released_year,
    genre WITH ROLLUP;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO
    employees (department, salary)
VALUES
    ('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000);

SELECT
    department,
    AVG(salary)
FROM
    employees
GROUP BY
    department;

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg
FROM
    employees;

SELECT
    AVG(salary) OVER()
FROM
    employees;

SELECT
    department,
    salary,
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department)
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    SUM(salary) OVER (
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    RANK() OVER(
        ORDER BY
            salary DESC
    ) AS overall_salary_rank
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    RANK() OVER (
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS dept_salary_rank,
    RANK() OVER(
        ORDER BY
            salary DESC
    ) AS overall_salary_rank
FROM
    employees
ORDER BY
    department;

SELECT
    emp_no,
    department,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS dept_row_number,
    RANK() OVER(
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS dept_salary_rank,
    RANK() OVER(
        ORDER BY
            salary DESC
    ) AS overall_rank,
    DENSE_RANK() OVER(
        ORDER BY
            salary DESC
    ) AS overall_dense_rank
FROM
    employees
ORDER BY
    overall_dense_rank;

SELECT
    emp_no,
    department,
    salary,
    NTILE(4) OVER (
        ORDER BY
            salary DESC
    ) AS salary_quartile
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER (
        ORDER BY
            salary DESC
    )
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    FIRST_VALUE(emp_no) OVER (
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS highest_paid_dept,
    FIRST_VALUE(emp_no) OVER (
        ORDER BY
            salary DESC
    ) AS highest_paid_dept
FROM
    employees;

SELECT
    emp_no,
    department,
    salary,
    salary - LAG(salary) OVER (
        PARTITION BY department
        ORDER BY
            salary DESC
    ) AS salary_diff
FROM
    employees;


    