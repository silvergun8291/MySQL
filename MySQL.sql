-- Active: 1673774227721@@127.0.0.1@3306@book_shop
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