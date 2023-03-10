-- Active: 1673774227721@@127.0.0.1@3306@backup
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: book_shop
-- ------------------------------------------------------
-- Server version	5.5.5-10.10.2-MariaDB
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!50503 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `author_fname` varchar(100) DEFAULT NULL,
  `author_lname` varchar(100) DEFAULT NULL,
  `released_year` int(11) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 20 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `books`
--
LOCK TABLES `books` WRITE;

/*!40000 ALTER TABLE `books` DISABLE KEYS */
;

INSERT INTO
  `books`
VALUES
  (1, 'The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
(2, 'Norse Mythology', 'Neil', 'Gaiman', 2016, 43, 304),
(3, 'American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
(
    4,
    'Interpreter of Maladies',
    'Jhumpa',
    'Lahiri',
    1996,
    97,
    198
  ),
(
    5,
    'A Hologram for the King: A Novel',
    'Dave',
    'Eggers',
    2012,
    154,
    352
  ),
(6, 'The Circle', 'Dave', 'Eggers', 2013, 26, 504),
(
    7,
    'The Amazing Adventures of Kavalier & Clay',
    'Michael',
    'Chabon',
    2000,
    68,
    634
  ),
(8, 'Just Kids', 'Patti', 'Smith', 2010, 55, 304),
(
    9,
    'A Heartbreaking Work of Staggering Genius',
    'Dave',
    'Eggers',
    2001,
    104,
    437
  ),
(10, 'Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
(
    11,
    'What We Talk About When We Talk About Love: Stories',
    'Raymond',
    'Carver',
    1981,
    23,
    176
  ),
(
    12,
    'Where I\'m Calling From: Selected Stories',
    'Raymond',
    'Carver',
    1989,
    12,
    526
  ),
(13, 'White Noise', 'Don', 'DeLillo', 1985, 49, 320),
(14, 'Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
(
    15,
    'Oblivion: Stories',
    'David',
    'Foster Wallace',
    2004,
    172,
    329
  ),
(
    16,
    'Consider the Lobster',
    'David',
    'Foster Wallace',
    2005,
    92,
    343
  ),
(17, '10% Happier', 'Dan', 'Harris', 2014, 29, 256),
(18, 'fake_book', 'Freida', 'Harris', 2001, 287, 428),
(
    19,
    'Lincoln In The Bardo',
    'George',
    'Saunders',
    2017,
    1000,
    367
  );

/*!40000 ALTER TABLE `books` ENABLE KEYS */
;

UNLOCK TABLES;