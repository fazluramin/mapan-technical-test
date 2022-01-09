--Created by : Fazlur Rahman Amin
--Database : PostgreSQL 4.30
--SQL : PostgreSQL

-- Soal SQL Bonus
-- Find first purchase data of each user. 
-- Output field: UniqueUserId, Email, FirstPurchaseDate, FirstPurchasedPackageName
with 
tmp as (
	select *
	from user_status a 
	left join user_data b 
		on a.uniqueid = b.uniqueid
	left join user_profile c 
		on b.uniqueid = c.uniqueid
	left join transaction d
		on b.uniqueid = d.uniqueuserid
	left join packages e
		on d.uniquepackageid = e.packageid
),
tmp2 as 
(
	select UniqueUserId, Email, completedordertransactiondate as FirstPurchaseDate, packagename as FirstPurchasedPackageName, 
	row_number() over(partition by uniqueuserid, email
					  order by completedordertransactiondate asc) seq 
	from tmp
	where transactionstatus = 'settlement'
)
select UniqueUserId, Email, FirstPurchaseDate, FirstPurchasedPackageName from tmp2
where seq = 1 
