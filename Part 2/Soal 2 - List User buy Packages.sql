--Created by : Fazlur Rahman Amin
--Database : PostgreSQL 4.30
--SQL : PostgreSQL

-- Soal SQL 2
-- Find list of users who bought subscription packages (einstein, marie curie, tesla, newton, etc). 
-- Output field: UniqueTransactionId, UniqueUserId, Email, Name, PackageName, TotalPrice, CompletedOrderTransactionDate
select 
UniqueTransactionId, UniqueUserId, Email, Name, PackageName, sum(TotalPrice) TotalPrice, CompletedOrderTransactionDate
from user_status a 
left join user_data b 
	on a.uniqueid = b.uniqueid
left join user_profile c 
	on b.uniqueid = c.uniqueid
left join transaction d
	on b.uniqueid = d.uniqueuserid
left join packages e
	on d.uniquepackageid = e.packageid
where packagename SIMILAR TO '%(Einstein|Newton|Tesla|Marie)%'
group by 
UniqueTransactionId, UniqueUserId, Email, Name, PackageName, CompletedOrderTransactionDate
