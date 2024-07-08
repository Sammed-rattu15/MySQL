create database Student_books;

use Student_books;

create table books(
book_id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(100),
author_fname VARCHAR(100),
author_lname VARCHAR(100),
released_year INT,
stock_quantity INT,
pages INT,
PRIMARY KEY(book_id)
);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

# DESCRIBE FUNCTION :
desc books;

select * from books;

# CONCAT FUNCTIONS :
select concat(author_fname, " ", author_lname) as 'author name' from books;
select concat(author_fname, " ", author_lname) as author_name, released_year, stock_quantity from books;
select concat(title, " was released in ", released_year) as "Book data" from books;

select concat(substr(title, 1, 10), "... ") as 'short title',
concat(author_fname, " ", author_lname) as 'author name' ,
concat(stock_quantity, " in stock") as 'quantity' from books;

# CONCAT_WS FUNCTION :
select concat(title, "-", author_fname, "-", author_lname, "-", released_year) as data from books;
select concat_ws(" - ", title, author_fname, author_lname, released_year) as data from books;

# SUBSTRING :
select concat(substring(title, 1, 10), "....") as title_fr from books;
select substring(author_fname, 1, 10) as title_fr from books;

# REPLACE STRING :
select replace(title, "e", 3) as title from books;
select substring(replace(title, 'e', 3), 1, 10) as "String" from books;

# REVERSE STRING FUNCTION :
select reverse(title) as reverse_tilte from books;
select concat(author_fname, reverse(author_fname)) from books;

# CHAR LENGTH STRING FUNCTION
select title, char_length(title) as tilte_length from books;
select author_fname, char_length(author_fname) as length_name from books;
select concat(author_lname, "is ", char_length(author_lname), " words") as name_length from books;
select title, character_length(title) as character_count from books;

# UPPER OR LOWER STRING FUNCTION :
select upper(title) as tlt from books;
select upper(concat(author_fname, " ", author_lname)) as "Name in Caps" from books;
select lower(author_lname) as l_name from books;

# SELECTION REFINING FUNCTIONS :

# DISTINCT FUNCTION :
select distinct(author_lname) from books;
select concat(author_fname, " ", author_lname) as full_name from books;
select distinct author_fname, author_lname from books;

# ORDER BY FUNCTION :
select author_fname from books order by author_fname;
select author_lname from books order by author_lname desc;
select title, released_year from books order by released_year desc;

# LIMIT FUNCTION :
select title from books limit 3;
select * from books limit 5;
select title, released_year from books order by released_year limit 5;
select title, released_year from books order by released_year desc limit 5;
select title, released_year, stock_quantity from books order by stock_quantity asc limit 5;

# LIKE FUNCTION :
select title, author_fname from books where author_fname like "%da%";
select title, author_fname from books where author_fname like "%do_";
select title from books where title like "%the%";

# NOT LKE FUNCTION :
select * from books where author_fname not like "D%";
select * from books where title not like "W%";
select * from books where released_year not like "20__";
select * from books where stock_quantity not like "__";

# CHALLANGES :

# SELECT ALL FROM TITLE CONTAINING STORIES :
select title from books where title like "%stories%";

# FIND THE LONGEST BOOK :
select title, pages from books order by pages desc limit 1;

# PRINT A SUMMARY ONTSINING TITLE AND YEAR FOR THE 3 MOST RECENT BOOKS :
select concat(title, " - ", released_year) as Summary from books order by released_year desc limit 3;

# FIND ALL BOOKS THAT CONTAIN AUTHOR_LNAME THAT CONTAINS A SPACE(" ") :
select title, author_lname from books where author_lname like "% %";

# FIND THE 3 BOOKS WITH THE LOWEST STOCK :
select title, released_year, stock_quantity from books order by stock_quantity asc limit 3;

# PRINT TITLE, LNAME SORTED FIRST BY AUTHOR LNAME AND THEN BY TITLE :
select title, author_lname from books order by author_lname, title;
select title, author_lname from books order by 2, 1;

# SORT ALPHABETICALLY BY LAST NAME :
select concat("My Favorite Author is ",author_fname, " ", author_lname) as fav_author from books order by author_lname; 

# COUNT FUNCTION :
select count(*) from books; # It counts all the rows in the table
select count(author_lname) from books;
select count(distinct(author_lname)) as count_no from books;
select count(distinct author_fname, author_lname) as n_count from books;
select count(*) from books where title like "%the%";

# MIN / MAX FUNCTION :
select min(released_year) from books;
select max(released_year) from books;
select max(pages), min(pages) from books;
select max(stock_quantity), min(stock_quantity) from books;

# SUBQUERIES FUNCTION :
select * from books where pages = (select min(pages) from books);
select * from books where pages = (select max(pages) from books);
select * from books where pages > 500 order by title;

# EQUAL AND NOT EQUAL FUNCTION
select * from books where released_year = 2016;
select title, released_year, author_fname from books where author_fname != "Dave";
select title, released_year, author_fname from books where author_fname = "David";

# GREATER THAN OR LESS THAN FUNCTION :
select title, released_year from books where released_year >= "2000" order by title;
select title, released_year, author_fname, stock_quantity from books where stock_quantity >= "100" order by author_fname;
select title, released_year, author_fname, pages from books where pages <= "200" order by title;
select title, released_year, author_fname, released_year from books where released_year <= "2000" order by title;
