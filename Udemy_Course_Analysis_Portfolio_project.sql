-- Creating view for joined tables
Create view joining
As
select cr.*, ct.*
from course cr
join content ct
on cr.id = ct.id;

-- Course Languages in Udemy.
select count(language) English_language_course_offered
from course cr
join content ct
on cr.id=ct.id
where language = 'English';

select count(language) Spanish_language_course_offered
from course cr
join content ct
on cr.id=ct.id
where language like 's%h';

select count(language) Turkish_language_course_offered
from course cr
join content ct
on cr.id=ct.id
where language like 'Tur%';

-- Number of courses in each category.
select category, count(category)
from course cr
join content ct
on cr.id = ct.id
group by (category)
order by count(category);

-- Number of subscribers in each category.
select category, sum(num_subscribers) as subscribers_Count
from course cr
join content ct
on cr.id = ct.id
group by (category)
order by subscribers_Count desc;

-- Top 5 courses with highest number of reviews.
select Title, sum(num_reviews) as subscribers_review_Count
from course cr
join content ct
on cr.id = ct.id
group by (Title)
order by subscribers_review_Count desc
Limit 5;

-- Top 5 courses with highest number of reviews.
select Title, sum(num_reviews) as subscribers_review_Count
from course cr
join content ct
on cr.id = ct.id
group by (Title)
order by subscribers_review_Count desc
Limit 5;

-- Top 5 courses with highest number of subscribers.

select Title, num_subscribers, avg_rating
from course cr
join content ct
on cr.id = ct.id
-- where avg_rating > '4.6'
group by (Title)
order by num_subscribers desc
Limit 5;

-- Most expensive Udemy courses.
select title as Title, price 
from course
where price <
(select max(price)
from course)
order by price desc
Limit 10;

-- Lenthy course with high ratings.
select 
Title, num_subscribers, avg_rating, content_length_min, category, subcategory, instructor_name
from course cr
join content ct
on cr.id = ct.id
-- where avg_rating > '4.6'
-- group by (Title)
order by content_length_min desc;

-- Udemy free courses list.
select 
Title, is_paid, num_subscribers, avg_rating, content_length_min, category, subcategory, instructor_name
from course cr
join content ct
on cr.id = ct.id
where is_paid = 'false'
order by num_subscribers desc;

-- High number of courses is lend by Tutor
select distinct (instructor_name), count(*) number_of_course_offeref_by_Tutor
from content
group by (subcategory)
order by number_of_course_offeref_by_Tutor desc;

-- Best courses for beginners
Select *
from course
where title like "%beginners%" and avg_rating >= '4.0'