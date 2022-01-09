--Created by : Fazlur Rahman Amin
--Database : PostgreSQL 4.30
--SQL : PostgreSQL

--Part 2
-- Soal SQL 1
-- Find list of users that subscription is still active as of today. 
-- Output field: Name, Email, Phone, Gender, SchoolYear, District, Diamond, SubscriptionEndDate
select 
	Name, 
	Email, 
	Phone,
	Gender, 
	SchoolYear, 
	District, 
	currentdiamond as diamond, 
	SubscriptionEndDate  
from user_status a 
left join user_data b 
	on a.uniqueid = b.uniqueid
left join user_profile c 
	on b.uniqueid = c.uniqueid
where subscriptionenddate > current_date
order by subscriptionenddate
