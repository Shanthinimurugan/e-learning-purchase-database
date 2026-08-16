										-- Elearning Purchase Database Analysis
										-- 1. Database Setup & Data Entry
create database if not exists elearning_db;

use elearning_db;

										-- Creating learners Table

create table if not exists learners (
learner_id int primary key,
full_name varchar(100) Not Null,
country varchar(50) Not Null
);
desc learners;

										-- Creating courses Table

create table if not exists courses(
course_id int primary key,
course_name varchar(200),
catagory varchar(200),
unit_price decimal(10,2) Not Null
);
desc courses;

										-- Creating purchases Table

create table if not exists purchases(
purchase_id int auto_increment,
learner_id int,
course_id int,
quantity int,
purchase_date date default (current_date()),

primary key(purchase_id),

constraint fk_learnerid
foreign key(learner_id) references learners(learner_id)
on delete cascade
on update cascade,

constraint fk_courseid
foreign key(course_id) references courses(course_id)
on delete cascade
on update cascade
);
desc purchases;

											-- Inserting data for all three tables
                                            
insert into learners values  
(1, 'Anitha Raj', 'India'),
(2, 'Priya Charan', 'India'),
(3, 'Divya Priya', 'India'),
(4, 'Vijay Anand', 'India'),
(5, 'Sanjay Kumar', 'India'),
(6, 'Swetha Rani', 'USA'),
(7, 'Manoj Kumar', 'USA'),
(8, 'Deepa Lakshmi', 'USA'),
(9, 'Michael Brown', 'UK'),
(10, 'Emma Johnson', 'UK'),
(11, 'Oliver Jones', 'Canada'),
(12, 'Sophia Wilson', 'Canada');    

/*SET FOREIGN_KEY_CHECKS = 0;
truncate table purchases;
truncate table courses;
SET FOREIGN_KEY_CHECKS = 1;*/

insert into courses values 
(101, 'Excel for Beginners', 'Beginner', 2500.00),
(102, 'Python Basics', 'Beginner', 3000.00),
(103, 'SQL for Beginners', 'Beginner', 2800.00),
(104, 'HTML and CSS', 'Web Development', 6000.00),
(105, 'JavaScript Fundamentals', 'Web Development', 7000.00),
(106, 'React JS Development', 'Web Development', 8000.00),
(107, 'Java Programming', 'Programming', 6500.00),
(108, 'C,C++ Programming', 'Programming', 7500.00),
(109, 'AWS Cloud Fundamentals', 'Cloud Computing', 8000.00),
(110, 'Microsoft Azure Basics', 'Cloud Computing', 8000.00),
(111, 'Network Security', 'Cybersecurity', 7500.00),
(112, 'Cybersecurity Fundamentals', 'Cybersecurity', 8000.00),
(113, 'Digital Marketing Basics', 'Digital Marketing', 4000.00),
(114, 'Social Media Marketing', 'Digital Marketing', 6000.00),
(115, 'UI/UX Design Fundamentals', 'UI/UX Design', 3500.00),
(116, 'Graphic Design Basics', 'UI/UX Design', 4000.00);


/*alter table purchases add total_amount decimal(10,2);
alter table purchases drop column total_amount;*/

insert into purchases (purchase_id, learner_id, course_id, quantity, purchase_date)
values
(1001, 1, 101, 1, '2026-01-05'),
(1002, 1, 105, 2, '2026-01-12'),
(1003, 1, 107, 1, '2026-02-10'),

(1004, 2, 102, 1, '2026-01-08'),
(1005, 2, 106, 1, '2026-02-15'),
(1006, 2, 112, 1, '2026-03-05'),

(1007, 3, 103, 2, '2026-01-15'),
(1008, 3, 104, 1, '2026-02-20'),

(1009, 4, 105, 1, '2026-01-20'),
(1010, 4, 110, 1, '2026-03-01'),
(1011, 4, 113, 1, '2026-03-15'),

(1012, 5, 101, 2, '2026-01-25'),
(1013, 5, 108, 1, '2026-02-25'),

(1014, 6, 106, 1, '2026-01-10'),
(1015, 6, 111, 1, '2026-02-10'),

(1016, 7, 105, 1, '2026-01-18'),
(1017, 7, 110, 2, '2026-02-18'),

(1018, 8, 102, 1, '2026-01-22'),
(1019, 8, 109, 1, '2026-03-10'),

(1020, 9, 107, 1, '2026-01-12'),
(1021, 9, 113, 1, '2026-02-12'),

(1022, 10, 103, 1, '2026-01-28'),
(1023, 10, 112, 1, '2026-02-28'),

(1024, 11, 108, 1, '2026-01-30'),
(1025, 11, 110, 1, '2026-03-20'),

(1026, 12, 101, 1, '2026-02-05'),
(1027, 12, 104, 1, '2026-03-05'),

(1028, 1, 106, 1, '2026-04-01'),
(1029, 4, 111, 1, '2026-04-05'),
(1030, 7, 106, 1, '2026-04-10');


select * from learners;
select * from courses;
select * from purchases;

alter table courses 
change catagory category varchar(200);
desc courses;

												-- 2. Data Exploration Using INNER, LEFT, and RIGHT Joins
                                                -- INNER JOIN
                                                -- Displays only purchases where the learners and courses exist

select
l.full_name,
c.course_name,
c.category,
c.unit_price * p.quantity as Total_Amount,
p.purchase_date
from purchases p
inner join courses c on c.course_id = p.course_id
inner join learners l on l.learner_id = p.learner_id
order by Total_Amount desc;

												-- LEFT JOIN
                                                -- Displays all learners, even if a learner has no purchase
                                                
select
l.full_name,
c.course_name,
c.category,
c.unit_price * p.quantity as Total_Amount,
p.purchase_date
from learners l
left join purchases p on p.learner_id = l.learner_id
left join courses c on c.course_id = p.course_id
order by Total_Amount desc;

												-- RIGHT JOIN
                                                -- Display all courses, even if a course has never been purchased
                                                
                                                
select
l.full_name,
c.course_name,
c.category,
c.unit_price * p.quantity as Total_Amount,
p.purchase_date
from learners l
right join purchases p on p.learner_id = l.learner_id
right join courses c on c.course_id = p.course_id
order by Total_Amount desc;

												-- 3. Core Analytical Queries 
												-- Q1. Display each learner’s total spending with their country
select
l.learner_id,
l.full_name,
l.country,
sum(c.unit_price * p.quantity) as Total_Spending
from learners l
inner join purchases p on p.learner_id = l.learner_id
inner join courses c on c.course_id = p.course_id
group by 
l.learner_id;


												-- Q2. Find the top 3 most purchased courses by quantity

select 
c.course_id,
c.course_name,
sum(p.quantity) as Total_Quantity
from courses c
inner join purchases p on p.course_id = c.course_id
group by c.course_id
order by Total_Quantity desc limit 3;



												/*Q3. Show each category’s:
												● Total revenue
												● Number of unique learners*/

select 
c.category,
sum(p.quantity * c.unit_price) as Total_Revenue,
count(distinct l.learner_id) as Unique_Learners
from courses c
inner join purchases p on p.course_id = c.course_id
inner join learners l on l.learner_id = p.learner_id
group by 
c.category;

												-- Q4. List learners who purchased from more than one category

select
l.learner_id,
l.full_name,
count(c.category) as category_count
from purchases p
inner join courses c on c.course_id = p.course_id
inner join learners l on l.learner_id = p.learner_id
group by l.learner_id
having category_count > 1;

												-- Q5. Identify courses never purchased
                                                
 select
 l.learner_id,
 l.full_name,
 c.course_name,
 c.category
 from courses c
 left join purchases p on c.course_id = p.course_id
 left join learners l on l.learner_id = p.learner_id
 where p.course_id is null;


											-- 4. Subqueries & Correlated Subqueries
											-- Q6. Find learners whose total spending is above the average learner spending
                                            
 select
 l.learner_id,
 l.full_name,
 sum(p.quantity * c.unit_price) as Total_Spending2
 from purchases p
 inner join courses c on c.course_id = p.course_id
 inner join learners l on l.learner_id = p.learner_id
 group by l.learner_id
 having Total_Spending2 > (select avg(Total_Spending1)
 from (
 select p.learner_id,
 sum(p.quantity * c.unit_price) as Total_Spending1
 from purchases p
 inner join courses c on c.course_id = p.course_id
 group by p.learner_id) as learner_totals
 );
 

 -- CTE method
 
with learner_Totspending as (
select 
p.learner_id,
sum(p.quantity * c.unit_price) as Total_spending
from purchases p
inner join courses c on c.course_id = p.course_id
group by p.learner_id)
select 
l.learner_id,
l.full_name,
lt.Total_spending
from learner_Totspending lt
inner join learners l on l.learner_id = lt.learner_id
where lt.Total_spending > (select avg(Total_spending) from learner_Totspending);

										-- Q7. Display courses whose price is higher than any course in the ‘Beginner’ category
                                        
 select
 course_id,
 course_name,
 category,
 unit_price from courses
 where unit_price > all (select unit_price from courses where category = "Beginner");
 
										-- Q8 . Find learners who spent more than the average spending in their country
 SELECT
    l.learner_id,
    l.full_name,
    l.country,
    SUM(p.quantity * c.unit_price) AS Total_Spending
FROM learners l
INNER JOIN purchases p
    ON p.learner_id = l.learner_id
INNER JOIN courses c
    ON c.course_id = p.course_id
GROUP BY l.learner_id, l.full_name, l.country
HAVING Total_Spending > (
    SELECT AVG(learner_spending)
    FROM (
        SELECT
            l2.learner_id,
            l2.country,
            SUM(p2.quantity * c2.unit_price) AS learner_spending
        FROM learners l2
        INNER JOIN purchases p2
            ON p2.learner_id = l2.learner_id
        INNER JOIN courses c2
            ON c2.course_id = p2.course_id
        WHERE l2.country = l.country
        GROUP BY l2.learner_id, l2.country
    ) AS country_spending
);

-- CTE

WITH learner_spending AS (
    SELECT
        l.learner_id,
        l.full_name,
        l.country,
        SUM(p.quantity * c.unit_price) AS Total_Spending
    FROM learners l
    INNER JOIN purchases p
        ON p.learner_id = l.learner_id
    INNER JOIN courses c
        ON c.course_id = p.course_id
    GROUP BY l.learner_id, l.full_name, l.country
)
SELECT
    learner_id,
    full_name,
    country,
    Total_Spending
FROM learner_spending ls
WHERE Total_Spending > (
    SELECT AVG(ls2.Total_Spending)
    FROM learner_spending ls2
    WHERE ls2.country = ls.country
);

											-- 5. CTE, CASE, View, and NULL Handling
											-- Q9. Use a CTE to calculate total spending per learner, then: Display learners with spending above 10,000
 
with learner_Totspending as (
select 
l.full_name,
sum(c.unit_price * p.quantity) as Total_spending
from purchases p
inner join courses c on c.course_id = p.course_id
inner join learners l on l.learner_id = p.learner_id
group by l.full_name)
select 
full_name,
Total_spending
from learner_Totspending 
where Total_spending > 10000;



													-- Q10. CASE Expression
													-- Classify learners based on spending: ● Above 15,000 → “High Value”, ● 8,000–15,000 → “Medium Value”, ● Below 8,000 → “Low Value”
select
l.learner_id,
l.full_name,
sum(c.unit_price * p.quantity) as Total_Spending,
	case
		when sum(c.unit_price * p.quantity) > 15000 then 'High Value'
		when sum(c.unit_price * p.quantity) between 8000 and 15000 then 'Medium Value'
		else 'Low Value'
	end as Totalspending_category
from purchases p
inner join courses c on c.course_id = p.course_id
inner join learners l on l.learner_id = p.learner_id
group by 
l.learner_id,
l.full_name;

													-- Q11 . NULL Handling
													-- Display all courses and replace NULL purchase counts with 0 using: IFNULL() or COALESCE()

select 
c.course_id,
c.course_name,
c.category,
ifnull(count(p.quantity), 0) as Purchase_count
from courses c
left join purchases p on p.course_id = c.course_id
group by c.course_id;

														/* Q12 . View
														● Create a view: category_performance_view
														● Showing:
														● Category
														● Total revenue
														● Number of purchases
														● Average revenue per purchase*/

create view category_performance_view as
select 
c.category,
COALESCE(sum(p.quantity * c.unit_price),0) as Total_revenue,
COALESCE(count(p.course_id),0) as Number_of_purchases,
COALESCE(round(avg(p.quantity * c.unit_price),2),0) as Average_revenue_per_purchase
from courses c
left join purchases p on p.course_id = c.course_id
group by c.category;
                           
select * from category_performance_view;
											




 
