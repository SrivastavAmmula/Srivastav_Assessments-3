Create database Assessment;

use Assessment;

Create Table Subject
	(
		subjectId int Primary key,
		subtitle varchar(20) not null,
	);

Create table Book 
(
    bookId int Primary key,
    title varchar(20) not null,
    price int not null,
    volume int not null,
    author varchar(20) not null,
    publishDate Date not null,
    subjectId int, 
    Foreign key (subjectId) References Subject(subjectId)
);
Alter table Book Alter column title varchar(50) not null;

--Q1
insert into Subject (subjectId, subtitle) values
(1, 'Maths'),
(2, 'Science'),
(3, 'English'),
(4, 'History'),
(5, 'Geography');

select * from Subject

--Q2
insert into Book (bookId, title, price, volume, author, publishDate, subjectId) values
(101, 'Algebra', 600, 1, 'John', '2020-01-01', 1),
(102, 'Geometry', 700, 1, 'Jannu', '2019-05-15', 1),
(103, 'M2', 800, 1, 'Vinay', '2018-07-21', 1),
(104, 'Physics', 650, 2, 'Mamatha', '2020-08-12', 2),
(105, 'Chemistry', 750, 1, 'Vasu', '2017-11-23', 2),
(106, 'Biology', 800, 1, 'Krisha', '2016-03-14', 2),
(107, 'Literature', 500, 1, 'Kishro', '2020-12-01', 3),
(108, 'Grammar', 550, 1, 'Nikki', '2019-04-22', 3),
(109, 'Poetry', 600, 1, 'Srinu', '2018-09-17', 3),
(110, 'World History', 650, 1, 'Bhanu', '2021-02-25', 4),
(111, 'Ancient History', 700, 1, 'Bharath', '2017-06-10', 4),
(112, 'Modern History', 750, 1, 'Pavan', '2018-12-19', 4),
(113, 'Physical Geography', 600, 1, 'Raju', '2019-08-29', 5),
(114, 'Human Geography', 650, 1, 'Vikas', '2020-05-04', 5),
(115, 'Environmental Geography', 700, 1, 'Sita', '2017-03-03', 5);

--Q3
select Book.bookId, Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle
FROM Book
inner join Subject on Book.subjectId = Subject.subjectId;

--Q4
select * from Book where publishDate between '2019-01-01' and '2020-12-31';

--Q5
select author, count(*) as NumberOfBooks from Book Group by author;

--Q6
select Subject.subtitle, count(*) as NumberOfBooks from Book
inner join Subject on Book.subjectId = Subject.subjectId Group by Subject.subtitle;

--Q7
select count(*) as NumberOfBooks from Book where year(publishDate) = 2000;

--Q8
update Book set price = 900, volume = 2 where bookId = 1;

--Q9
update Book set price = price * 1.10
where subjectId = (select subjectId from Subject where subtitle = 'English');

--Q10
delete from Book where bookId = 1;

--Q11
select Book.* from Book
inner join Subject on Book.subjectId = Subject.subjectId where Book.price > 500 and Subject.subtitle = 'Maths';

--Q12
select Book.bookId, Book.title, Book.price, Book.volume, Book.author, Book.publishDate, Subject.subtitle
from Book
inner join Subject on Book.subjectId = Subject.subjectId
Order by Subject.subtitle ASC;

--Q13
select * from Book where price = (select min(price) from Book);

--Q14
select min(price) as MinPrice from Book;


--Q15
select count(*) as NumberOfBooks from Book where subjectId = (select subjectId from Subject where subtitle = 'Maths');

--Q16
select Book.* from Book inner join Subject on Book.subjectId = Subject.subjectId where Subject.subtitle IN ('English', 'Maths', 'Science');
