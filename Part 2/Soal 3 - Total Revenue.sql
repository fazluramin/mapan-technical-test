--Created by : Fazlur Rahman Amin
--Database : PostgreSQL 4.30
--SQL : PostgreSQL

-- Soal SQL 3
-- Find total revenue for subscription packages based on their class (X, XI, & XII).
-- Output field: SchoolYear, TotalRevenue
select 
SchoolYear, sum(totalprice) as TotalRevenue
from user_status a 
left join user_data b 
	on a.uniqueid = b.uniqueid
left join user_profile c 
	on b.uniqueid = c.uniqueid
left join transaction d
	on b.uniqueid = d.uniqueuserid
left join packages e
	on d.uniquepackageid = e.packageid
where SchoolYear SIMILAR TO '%(X|XI|XII)%'
Group by SchoolYear
