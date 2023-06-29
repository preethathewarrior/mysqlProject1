create database library;
use library;
create table Branch(Branch_no int primary key,
Manager_id int,
Branch_address varchar(40),
Contact_no int,
foreign key (manager_id) references Employee(Emp_id));
desc Branch; 
drop table Branch;
insert into Branch(Branch_no,Manager_id,Branch_address,contact_no) values 
(1,100,"Kerala",1234567890),
(2,101,"Kerala",1234567891),
(3,102,"Kerala",1234567892),
(4,103,"Kerala",1234567893),
(5,104,"Kerala",1234567894),
(6,105,"Kerala",1234567895);
select * from Branch;
create table Employee(Emp_id int primary key,
Emp_name varchar(30),
Position Varchar(30),
Salary int);
desc Employee;
drop table Employee;
insert into Employee(Emp_id,Emp_name,Position,Salary) values 
(100,"Devi","Librarian",15000),
(101,"Ganga","Receptionist",16000),
(102,"Suresh","Librabian",30000),
(103,"Pravesh","Recetionist",15000),
(104,"Prasad","Librarian",30000),
(105,"Harsha","Receptionist",17000);

select * from Employee;

create table customer(customer_id int primary key,
customer_name varchar(30),
customer_address varchar(30),
Reg_date date);
desc customer;
insert into Customer(customer_id,customer_name,customer_address,Reg_date) values 
(1000,"Pooja","Alappuzha","2020-09-08"),
(1001,"Devapriya","Pathanamtitta","2020-02-12"),
(1002,"Victor","Alappuzha","2021-09-10"),
(1003,"Rajeev","Alappuzha","2022-11-22"),
(1004,"Divakar","Ernakulam","2020-12-23"),
(1005,"Janaki","Alappuzha","2023-11-15");
select * from Customer;
drop table customer;


create table Books(ISBN int primary key,
Book_title varchar(30),
Category Varchar(30),
Rental_price int,
Status varchar(30),
Author varchar(30),
publisher varchar(30));
desc Books;
insert into Books(ISBN,Book_title,Category,Rental_Price,Status,Author,Publisher) values
(1422111,"Introduction to Algebra","Mathematics",200,"Yes","R.D.Sharma","V.K.Books"),
(1422112,"Introduction to Geometry","Mathematics",500,"No","C.R,Rao","V.K.Books"),
(1422113,"English Grammar","English",100,"Yes","M.M.Mahadev","Oxford Books"),
(1422114,"Biochemistry","Chemistry",200,"Yes","Devapriya","V.K,Books"),
(1422115,"Calculus","Mathematics",600,"Yes","R.D.Sharma","V.K.Books"),
(1422116,"Indulekha","Malayalam Novel",200,"No","O.Chandumenon","Siso Books");
select * from Books;
drop table books;
create table issue_status(issue_id int primary key,
issued_cust int,
issued_book_name varchar(30),
issue_date date,
isbn_book int,
foreign key (issued_cust) references customer(customer_id),
foreign key (isbn_book) references books(isbn));
desc issue_status;
insert into issue_status(issue_id,issued_cust,issued_book_name,issue_date,isbn_book) values
(2001,1000,"English Grammar","2023-04-12",1422113),
(2002,1001,"Calculus","2023-02-11",1422115),
(2003,1002,"Indulekha","2023-01-30",1422116),
(2004,1003,"Introduction to Algebra","2023-03-25",1422111),
(2005,1004,"Biochemistry","2023-02-01",1422114),
(2006,1005,"Introduction to Geometry","2023-06-10",1422112);
select * from issue_status;
drop table issue_status;
create table Return_status(Return_id int primary key,
Return_cust varchar(30),
Return_book_name varchar(30),
Return_date date,
Isbn_book2 int);
-- foreign key (isbn_book2) references books(isbn));
desc Return_status;
insert into Return_status(Return_id,Return_cust,Return_book_name,Return_date,isbn_book2) values
(3001,"Hari","Introduction to Geometry","2023-01-24",1422112),
(3002,"Rahul","Indulekha","2023-01-24",142216),
(3003,"Krishnapriya","Biochemistry","2023-01-24",1422114),
(3004,"Jayalekshmi","English Grammar","2023-01-24",1422113),
(3005,"Sindhu","Calculus","2023-01-24",1422115),
(3006,"Raji","Introduction to Algebra","2023-01-24",1422111);
select *from Return_status;
drop table return_status;



-- 1. Retrieve the book title, category, and rental price of all available books. 
select upper(Book_title),category,rental_price from books;
-- 2.   List the employee names and their respective salaries in descending order of salary. 
select emp_name,salary from Employee order by salary desc;
-- 3.  Retrieve the book titles and the corresponding customers who have issued those books. 
select issued_book_name,issued_cust from issue_status;
-- 4.  Display the total count of books in each category. 
select category,count(*) from books group by category;
-- 5.  Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select emp_name,Position,salary from Employee where salary>20000;
-- 6.  List the customer names who registered before 2022-01-01 and have not issued any books yet. 
select customer_name,Reg_date from customer where Reg_date<"2022-01-01" and customer_id in (select issued_cust from issue_status where not issued_book_name); 
-- 7.  Display the branch numbers and the total count of employees in each branch. 
select count(*),branch_no,manager_id from branch group by branch_no;
-- 8.  Display the names of customers who have issued books in the month of June 2023. 
select customer_name from customer where customer_id in (select issued_cust from issue_status where issue_date>="2023-06-01");
-- 9.  Retrieve book_title from book table containing history. 
select book_title from books where category="mathematics";
-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
select branch_no ,count(*) from branch group by branch_no having branch_no>5;